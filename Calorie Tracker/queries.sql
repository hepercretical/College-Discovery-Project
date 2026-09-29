CREATE TABLE foods (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    calories REAL,
    serving_size REAL,
    serving_unit TEXT,
    protein REAL,
    fat REAL,
    carbs REAL
);

INSERT INTO foods (name, description, calories, serving_size, serving_unit, protein, fat, carbs)
SELECT
    json_extract(value, '$.name'),
    json_extract(value, '$.description'),
    json_extract(value, '$.calories'),
    json_extract(value, '$.serving_size'),
    json_extract(value, '$.serving_unit'),
    json_extract(value, '$.protein'),
    json_extract(value, '$.fat'),
    json_extract(value, '$.carbs')
FROM json_each(readfile('FoodData.json'));

INSERT INTO foods (name, description, calories, serving_size, serving_unit, protein, fat, carbs)
SELECT
    value ->> 'name',
    value ->> 'description',
    value ->> 'calories',
    value ->> 'serving_size',
    value ->> 'serving_unit',
    value ->> 'protein',
    value ->> 'fat',
    value ->> 'carbs'
FROM json_each(readfile('FoodData.json'));

