import sqlite3

conn = sqlite3.connect('../langum.db')
with open('../backups/dump_2025_07_23.sql', 'w', encoding='utf-8') as f:
    for line in conn.iterdump():
        f.write(line + '\n')
