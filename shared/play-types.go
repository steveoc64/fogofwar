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
