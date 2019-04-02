require('pg')

class Bounty



  def initialize( options )
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @favourite_weapon = options['favourite_weapon']
  end


  #define a function that creates instances of Bounty in database
  def save()
  #connect to database
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost' })
  #write big long SQL string
    sql = "INSERT INTO bounties
    (
    name,
    species,
    bounty_value,
    favourite_weapon
    )
    VALUES
    ($1, $2, $3, $4)"

  #make array of values for personal statement
    values = [@name, @species, @bounty_value, @favourite_weapon]

  #prepare statement
    db.prepare('save', sql)

  #exec statement
    db.exec_prepared('save', values)

  #close link to db
    db.close()
  end

end
