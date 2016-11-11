package main

import (
	"math/rand"

	"../shared"
)

func calcVision(game *shared.Game) {

	// for each corps, fetch the latest coords, and stamp on the records
	for _, v := range game.RedCmd {
		// println("was", v.ID, v.Name, v.CX, v.CY)
		DB.SQL(`select cx,cy from game_cmd where id=$1`, v.ID).QueryScalar(&v.CX, &v.CY)
		// println("now", v.ID, v.Name, v.CX, v.CY)
	}
	for _, v := range game.BlueCmd {
		// println("was", v.ID, v.Name, v.CX, v.CY)
		DB.SQL(`select cx,cy from game_cmd where id=$1`, v.ID).QueryScalar(&v.CX, &v.CY)
		// println("now", v.ID, v.Name, v.CX, v.CY)
	}

	// For each Red corps, see if it can be seen
	for _, v := range game.RedCmd {
		if calcVision2(game, v, game.BlueCmd) {
			// then tell the blue team that this red cmd is now seen
		}
	}

	// For each Blue corps, see if it can be seen
	for _, v := range game.BlueCmd {
		if calcVision2(game, v, game.RedCmd) {
			// then tell the red team that this blue cmd is now seen
		}
	}
}

func calcVision2(game *shared.Game, cmd *shared.GameCmd, enemy []*shared.GameCmd) bool {

	d1 := 0
	d2 := 0

	// cmd.Seen = false

	makeSeen := func(g *shared.GameCmd) {
		g.Seen = true
		// print("setting seen on", g.ID)
		_, err := DB.SQL(`update game_cmd set seen=true where id=$1`, g.ID).Exec()
		if err != nil {
			print(err.Error())
		}
	}

	// There is a small chance that a unit can be spotted, regardless of distance,
	// due to spies, or interrogation of locals
	if !cmd.Seen {
		if rand.Intn(12) == 0 {
			cmd.Seen = true
			makeSeen(cmd)
			// println("seen 5")
			return true
		}
	}

	sq := func(a int) int {
		return a * a
	}
	// println("calc vision from", cmd.Name, cmd.ID, cmd.Name, cmd.CX, cmd.CY, cmd.Seen)
	for _, v := range enemy {
		// println("consider enemy", v.ID, v.Name, v.CX, v.CY, v.Seen)
		if !cmd.Seen {
			d1 = sq(cmd.CX-v.CX) + sq(cmd.CY-v.CY)
			d2 = sq(cmd.DX-v.DX) + sq(cmd.DY-v.DY)
			// println("to", v.Name, d1, d2)
			if cmd.Moving() {
				// current location is within 1-4 grids random
				if d1 <= sq(2+rand.Intn(3)) {
					// println("seen 1")
					makeSeen(cmd)
					return true
				} else {
					// check destination
					if d2 <= sq(2) { // within 1 grid as diagonals are 1.4 grids away
						makeSeen(cmd)
						// println("seen 2")
						return true
					}
				}
			} else {
				// not moving - spotted if within 1 grid, or 2 grids straight
				if d1 < sq(3) {
					makeSeen(cmd)
					// println("seen 3")
					return true
				}
				tile := game.GetTileXY(cmd.CX, cmd.CY)
				if tile.Content == shared.TileClear {
					if d1 < 11 {
						// is just under 3 grids distant, and we are in the open
						makeSeen(cmd)
						// println("seen 4")
						return true
					}
				}
			}
		}
	}
	return false

}
