import sqlite3

conn = sqlite3.connect("../langum.db")
cursor = conn.cursor()

cursor.execute("PRAGMA foreign_keys = OFF;")
cursor.execute("BEGIN TRANSACTION;")

# Get all user-defined tables
cursor.execute("""
    SELECT name FROM sqlite_master 
    WHERE type='table' AND name NOT LIKE 'sqlite_%';
""")
tables = cursor.fetchall()

for (table_name,) in tables:
    cursor.execute(f'DELETE FROM "{table_name}";')

# Reset autoincrement
cursor.execute("DELETE FROM sqlite_sequence;")

cursor.execute("COMMIT;")
conn.close()
