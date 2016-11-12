package shared

type Fight struct {
	ID     int     `db:"id"`
	GameID int     `db:"game_id"`
	Name   string  `db:"name"`
	Rough  bool    `db:"rough"`
	Woods  bool    `db:"woods"`
	Built  bool    `db:"built"`
	Fort   bool    `db:"fort"`
	Red    []*Unit `db:"red"`
	Blue   []*Unit `db:"blue"`
}

type GameFight struct {
	ID     int
	GameID int
	Name   string
	Rough  bool
	Woods  bool
	Built  bool
	Fort   bool
	Red    []int
	Blue   []int
}

type FightData struct {
	Channel int
	GameID  int
	ID      int
	DivID   int
	BdeID   int
	Fight   *Fight
}

type FightAction struct {
	Channel int
	GameID  int
	Opcode  int
	UnitID  int
	Target  int
	Range   int
	Terrain int
}

type FightOutcome struct {
	UnitID           int
	Descr            string
	Descr2           string
	CommanderControl int
	Condition        int
	Formation        int
	GunCondition     int
	SKOut            bool
	Woods            bool
	Rough            bool
	Cover            bool
	HasSupport       bool
	BayonetsLost     int
	BayonetsMState   int
	BayonetsMoved    bool
	BayonetsFired    bool
	LTLost           int
	LTMState         int
	SabresLost       int
	SabresMState     int
	SabresCharged    int
	GunsLost         int
	GunsFired        bool
	GunsMoved        bool
	GunsLimbered     bool
	GunsMState       int
	GunMaxCondition  int
	MState           int
	Ammo             int
	Role             int
	Committed        bool
}

func (u *Unit) SetOutcome(o *FightOutcome) {
	u.CommanderControl = o.CommanderControl
	u.Condition = o.Condition
	u.Formation = o.Formation
	u.GunCondition = o.GunCondition
	u.SKOut = o.SKOut
	u.Woods = o.Woods
	u.Rough = o.Rough
	u.Cover = o.Cover
	u.HasSupport = o.HasSupport
	u.BayonetsLost = o.BayonetsLost
	u.BayonetsMState = o.BayonetsMState
	u.BayonetsMoved = o.BayonetsMoved
	u.BayonetsFired = o.BayonetsFired
	u.LTLost = o.LTLost
	u.LTMState = o.LTMState
	u.SabresLost = o.SabresLost
	u.SabresMState = o.SabresMState
	u.SabresCharged = o.SabresCharged
	u.GunsLost = o.GunsLost
	u.GunsFired = o.GunsFired
	u.GunsMoved = o.GunsMoved
	u.GunsLimbered = o.GunsLimbered
	u.GunsMState = o.GunsMState
	u.GunMaxCondition = o.GunMaxCondition
	u.Ammo = o.Ammo
	u.Role = o.Role
	u.Committed = o.Committed
}

func (u *FightOutcome) MapFromUnit(o *Unit) {
	u.CommanderControl = o.CommanderControl
	u.Condition = o.Condition
	u.Formation = o.Formation
	u.GunCondition = o.GunCondition
	u.SKOut = o.SKOut
	u.Woods = o.Woods
	u.Rough = o.Rough
	u.Cover = o.Cover
	u.HasSupport = o.HasSupport
	u.BayonetsLost = o.BayonetsLost
	u.BayonetsMState = o.BayonetsMState
	u.BayonetsMoved = o.BayonetsMoved
	u.BayonetsFired = o.BayonetsFired
	u.LTLost = o.LTLost
	u.LTMState = o.LTMState
	u.SabresLost = o.SabresLost
	u.SabresMState = o.SabresMState
	u.SabresCharged = o.SabresCharged
	u.GunsLost = o.GunsLost
	u.GunsFired = o.GunsFired
	u.GunsMoved = o.GunsMoved
	u.GunsLimbered = o.GunsLimbered
	u.GunsMState = o.GunsMState
	u.GunMaxCondition = o.GunMaxCondition
	u.Ammo = o.Ammo
	u.Role = o.Role
	u.Committed = o.Committed
}

func (u *Unit) GetFightingDescription() string {
	retval := ""

	print("gfd", u)

	switch u.Role {
	case RoleAdvance:
		retval = "in Advance Party"
	case Role1:
		retval = "1st Line"
	case Role2:
		retval = "2nd Line"
	case RoleLeft:
		retval = "Left Flank"
	case RoleRight:
		retval = "Right Flank"
	case RoleReserve:
		return ""
	}

	switch u.UType {
	case UnitBde, UnitSpecial:
		if u.SKOut {
			retval += ", Skirmishers out"
		}
	case UnitCav:
		if u.SabresCharged < 1 {
			retval += ", horses are fresh"
		}
	case UnitGun:
		if u.GunsLimbered {
			retval += ", Limbered"
		}
	}
	return retval
}
