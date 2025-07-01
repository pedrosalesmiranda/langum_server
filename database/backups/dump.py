import sqlite3

conn = sqlite3.connect('../langum.db')
with open('../sql_scripts/dump_dd_mm_yyyy.sql', 'w', encoding='utf-8') as f:
    for line in conn.iterdump():
        f.write(line + '\n')
