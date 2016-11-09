package shared

type Musket struct {
	GameID        int
	ID            int
	UnitID        int
	FirerID       int
	TargetID      int
	TargetUID     int
	TargetTerrain int
	Paces         int
}

type MusketData struct {
	Channel int
	GameID  int
	ID      int
	Musket  *Musket
}
