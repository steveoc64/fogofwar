package shared

// Phases
const (
	PhaseOrders int = iota
	PhaseGT1
	PhaseBB
	PhaseGT2
	PhaseCommander
	PhaseEngage
	PhaseTactical
	PhaseObjectives
)

// Corps states
const (
	CmdReserve int = iota
	CmdMarchOrder
	CmdBattleLine
	CmdBattleAdvance
	CmdCompleteMarch
)

// Corps level orders
const (
	CommandCarryOn int = iota
	CommandNewObjective
	CommandHalt
	CommandResumeMarch
	CommandBattleLine
	CommandReserve
	CommandMarchOrder
	CommandPrepare
	CommandAdvance
)
const NumCommands = 9

// Unit Types
const (
	UnitType int = iota
	UnitDiv
	UnitBde
	UnitCav
	UnitGun
	UnitSpecial
)

type CmdOrder struct {
	Channel int
	ID      int // ID of the gamecmd
	Command int
	X, Y    int
}

type GTMoveData struct {
	Channel     int
	ID          int
	Destination bool
	Contact     bool
}

// type Bombard struct {
// 	UnitID    int
// 	FirerID   int
// 	TargetID  int
// 	TargetUID int
// 	RangeMax  int
// 	RangeMin  int
// 	Disputed  bool
// }

// type BombardData struct {
// 	Channel int
// 	Bombard *Bombard
// }