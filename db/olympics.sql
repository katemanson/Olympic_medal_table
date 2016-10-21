DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS participants;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS events;

CREATE TABLE countries(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE participants(
  id SERIAL2 PRIMARY KEY,
  country_id INT2 REFERENCES countries(id) ON DELETE CASCADE,
  name VARCHAR(255)
);

CREATE TABLE events(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  sport VARCHAR(255)
);

CREATE TABLE results(
  id SERIAL2 PRIMARY KEY,
  participant_id INT2 REFERENCES participants(id) ON DELETE CASCADE,
  event_id INT2 REFERENCES events(id) ON DELETE CASCADE,
  result INT2
);