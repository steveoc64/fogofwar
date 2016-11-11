package shared

// type AsyncMessage struct {
// 	Action string
// 	ID     int
// 	Opcode int
// 	// Bombard Bombard
// 	// UnitEvent UnitEvent
// }

type NetData struct {
	Action string
	ID     int
	Opcode int
	Unit   *UnitEvent
	Fight  *GameFight
	Cmds   *[]CmdUpdate
}

type NetRequest struct {
	ServiceMethod string
	Seq           uint64
}

type NetResponse struct {
	ServiceMethod string
	Seq           uint64
	Error         string
	Async         bool
}
