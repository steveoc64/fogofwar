package shared

// Corps states
const (
	CmdReserve int = iota
	CmdMarchOrder
	CmdBattleLine
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
)
const NumCommands = 8

type CmdOrder struct {
	Channel int
	ID      int // ID of the gamecmd
	Command int
}
