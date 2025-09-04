import sqlite3
import sys
from datetime import datetime

# File paths
database_file_path = '../langum.db'
dump_file_path = f'../backups/dump_{datetime.now().strftime("%Y_%m_%d")}.sql'

# SQL statement to populate Languages
sql_populate_languages = '''INSERT INTO Languages (languageEng, languageNative, languageEngTwoLetters) VALUES
('portuguese', 'Português', 'pt'),
('russian', 'Русский', 'ru'),
('polish', 'Polski', 'pl'),
('english', 'English', 'en'),
('mandarin', '普通话', 'zh'),
('romanian', 'Română', 'ro');'''


def dump_database(conn):
    with open(dump_file_path, 'w', encoding='utf-8') as f:
        for line in conn.iterdump():
            f.write(line + '\n')
    print(f"[✓] Database dumped to {dump_file_path}")


def reset_database(conn):
    cursor = conn.cursor()
    cursor.execute("PRAGMA foreign_keys = OFF;")
    cursor.execute("BEGIN TRANSACTION;")

    cursor.execute("""
        SELECT name
        FROM sqlite_master
        WHERE type = 'table'
          AND name NOT LIKE 'sqlite_%';
    """)
    tables = cursor.fetchall()

    for (table_name,) in tables:
        cursor.execute(f'DELETE FROM "{table_name}";')

    cursor.execute("DELETE FROM sqlite_sequence;")
    conn.commit()
    print("[✓] Database reset complete.")


def populate_languages(conn):
    cursor = conn.cursor()
    cursor.execute(sql_populate_languages)
    conn.commit()
    print("[✓] Languages table populated.")


def main():
    conn = sqlite3.connect(database_file_path)

    while True:
        print("\n=== Database Maintenance Menu ===")
        print("1) Reset database")
        print("2) Dump database")
        print("3) Populate languages")
        print("4) Exit")
        choice = input("Select an option: ").strip()

        if choice == '1':
            reset_database(conn)
        elif choice == '2':
            dump_database(conn)
        elif choice == '3':
            populate_languages(conn)
        elif choice == '4':
            conn.close()
            print("Exiting...")
            sys.exit(0)
        else:
            print("Invalid choice. Please enter 1–4.")


if __name__ == "__main__":
    main()
