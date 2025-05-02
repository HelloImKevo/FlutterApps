/// SQL statement to create the `Items` table.
///
/// This table is modeled after the HackerNews API and includes the following columns:
/// - `id`: The unique identifier for the item (primary key).
/// - `deleted`: Indicates whether the item is deleted (1 for true, 0 for false).
/// - `type`: The type of the item (e.g., "story", "comment").
/// - `by`: The username of the item's author.
/// - `time`: The creation time of the item (in Unix timestamp format).
/// - `text`: The text content of the item (if applicable).
/// - `dead`: Indicates whether the item is dead (1 for true, 0 for false).
/// - `parent`: The parent item's ID (for comments or replies).
/// - `kids`: A JSON-encoded list of IDs of the item's child comments.
/// - `url`: The URL associated with the item (if applicable).
/// - `score`: The score of the item (e.g., upvotes for a story).
/// - `title`: The title of the item (if applicable).
/// - `descendants`: The total number of comments or replies for the item.
const String createItemsTable = '''
CREATE TABLE Items (
  id INTEGER PRIMARY KEY,
  deleted INTEGER,
  type TEXT,
  by TEXT,
  time INTEGER,
  text TEXT,
  dead INTEGER,
  parent INTEGER,
  kids TEXT,
  url TEXT,
  score INTEGER,
  title TEXT,
  descendants INTEGER
)
''';
