cmd.exe /c chcp 1252
"c:\Program Files\PostgreSQL\9.5\bin\psql" -U postgres -f listing%1.sql -o log%1.txt