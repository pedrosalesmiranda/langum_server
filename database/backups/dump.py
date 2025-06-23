import sqlite3

conn = sqlite3.connect('../langum.db')
with open('dump_23_06_2025.sql', 'w', encoding='utf-8') as f:
    for line in conn.iterdump():
        f.write(line + '\n')
