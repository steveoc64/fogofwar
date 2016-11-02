package shared

type PhaseDoneMsg struct {
	Channel int
	GameID  int
}

type PhaseUpdateMsg struct {
	Turn  int
	Phase int
	TODO  bool
	Done  bool
}
