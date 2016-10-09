package shared

type Campaign struct {
	ID         int    `db:"id"`
	Author     int    `db:"author_id"`
	AuthorName string `db:"author_name"`
	ForkedFrom int    `db:"forked_from"`
	Name       string `db:"name"`
	Year       int    `db:"year"`
	Descr      string `db:"descr"`
	Notes      string `db:"notes"`
}
