DROP TABLE IF EXISTS bounties;
CREATE TABLE bounties(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  species VARCHAR,
  bounty_value INT,
  favourite_weapon VARCHAR
);
