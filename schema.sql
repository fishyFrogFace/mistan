CREATE TABLE campus (
  campus_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
  
CREATE TABLE building (
  building_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  campus_id INT REFERENCES campus (campus_id) NOT NULL
);

CREATE TABLE floor (
  floor_id SERIAL PRIMARY KEY,
  name INT NOT NULL,
  building_id INT REFERENCES building (building_id) NOT NULL
);
  
CREATE TABLE room (
  room_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  floor_id INT REFERENCES floor (floor_id) NOT NULL
);

CREATE TYPE state AS ENUM ('found', 'lost', 'returned');

CREATE TABLE item_type (
  name TEXT PRIMARY KEY
);

CREATE TABLE item (
  item_id SERIAL PRIMARY KEY,
  registered_as state NOT NULL,
  item_name TEXT REFERENCES item_type (name) NOT NULL
);

CREATE TABLE moved_to (
  item_id INT REFERENCES item (item_id) NOT NULL,
  moved_from INT REFERENCES floor (floor_id) NOT NULL,
  moved_to INT REFERENCES floor (floor_id) NOT NULL,
  moved_date DATE NOT NULL,
  moved_time TIMETZ NOT NULL
);