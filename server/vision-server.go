package main

import (
	"math/rand"

	"../shared"
)

func calcVision(game *shared.Game) {

	// For each Red corps, see if it can be seen
	for _, v := range game.RedCmd {
		calcVision2(game, v, game.BlueCmd)
	}

	// For each Blue corps, see if it can be seen
	for _, v := range game.BlueCmd {
		calcVision2(game, v, game.RedCmd)
	}
}

func calcVision2(game *shared.Game, cmd *shared.GameCmd, enemy []*shared.GameCmd) {

	d1 := 0
	d2 := 0

	// cmd.Seen = false

	// There is a small chance that a unit can be spotted, regardless of distance,
	// due to spies, or interrogation of locals
	if !cmd.Seen {
		if rand.Intn(12) == 0 {
			cmd.Seen = true
			println("seen 5")
			return
		}
	}

	sq := func(a int) int {
		return a * a
	}

	makeSeen := func(g *shared.GameCmd) {
		g.Seen = true
		DB.SQL(`update game_cmd set seen=true where id=$1`, g.ID).Exec()
	}

	println("calc vision", cmd.Name, cmd.ID)
	for _, v := range enemy {
		if !cmd.Seen {
			d1 = sq(cmd.CX-v.CX) + sq(cmd.CY-v.CY)
			d2 = sq(cmd.DX-v.DX) + sq(cmd.DY-v.DY)
			println("to", v.Name, d1, d2)
			if cmd.Moving() {
				// current location is within 1-4 grids random
				if d1 <= sq(2+rand.Intn(3)) {
					println("seen 1")
					makeSeen(cmd)
					return
				} else {
					// check destination
					if d2 <= sq(2) { // within 1 grid as diagonals are 1.4 grids away
						makeSeen(cmd)
						println("seen 2")
						return
					}
				}
			} else {
				// not moving - spotted if within 1 grid, or 2 grids straight
				if d1 < sq(3) {
					makeSeen(cmd)
					println("seen 3")
					return
				}
				tile := game.GetTileXY(cmd.CX, cmd.CY)
				if tile.Content == shared.TileClear {
					if d1 < 11 {
						// is just under 3 grids distant, and we are in the open
						makeSeen(cmd)
						println("seen 4")
						return
					}
				}
			}
		}
	}

}
