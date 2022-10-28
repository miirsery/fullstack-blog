# React + Express

## Start project
```
Install dependencies
npm i

Watch
npm run dev
```

## Run in docker (recommended)
```
Up the containers
docker-compose up -d --build

# Down the containers
docker-compose down -v
```

## Dump sql
```
docker exec -t db pg_dump --no-owner -U socialUser social_db > dump.sql
```

## Load sql
```
cat dump.sql | docker exec -i db psql -U socialUser -d social_db
```


## change columns
```
docker-compose exec db bash
psql social_db -U socialUser;
\dt
ALTER TABLE person ADD phone TEXT;
ALTER TABLE person DROP column phone;
```

#### Заметки
1. У ticket убрать поле **movie_id**. Это поле можно будет получить через **session**.
2. Весь проект перевести на ts.
3. 