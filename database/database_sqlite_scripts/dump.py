import sqlite3

conn = sqlite3.connect('../langum.db')
with open('dump_yyyy_mm_dd.sql', 'w', encoding='utf-8') as f:
    for line in conn.iterdump():
        f.write(line + '\n')
