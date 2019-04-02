require('pg')

class Bounty

  attr_accessor :favourite_weapon

  def initialize( options )
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @favourite_weapon = options['favourite_weapon']
    @id = options['id'].to_i if options['id']
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

    #make array of values for prepared statement
    values = [@name, @species, @bounty_value, @favourite_weapon]
    #prepare statement
    db.prepare("save", sql)
    #exec statement
    db.exec_prepared("save", values)
    #close link to db
    db.close()
  end


  #define function to read from bounty_hunters database
  def Bounty.all()
    #connect to database
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write big long SQL string
    sql = "SELECT * FROM bounties"
    #prepare statement
    db.prepare("all", sql)
    #exec statement
    targets = db.exec_prepared("all")
    #close link to db
    db.close()
    #return orders
    return targets.map { |target| Bounty.new(target)}
  end


  #define class method to delete everything from table
  def Bounty.delete_all()
    #connect to database
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write big SQL statement string
    sql = "DELETE FROM bounties"
    #prepare statement
    db.prepare("delete_all", sql)
    #run prepared statement with pg
    db.exec_prepared("delete_all")
    #close db link
    db.close()
  end


  #define function to delete one instance from table
  def delete_one()
    #connect to db
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write SQL statement string
    sql = "DELETE FROM bounties WHERE id = $1"
    #make values array - in this case it only needs one value
    values = [@id]
    #prepare statemnt
    db.prepare("delete_one", sql)
    #run prepared statement
    db.exec_prepared("delete_one", values)
    #close db link
    db.close()
  end


  #define function to update rows in bounty_hunters db
  def update()
    #connect to db
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write big SQL statement string
    sql = "UPDATE bounties
    SET
    (
      name,
      species,
      bounty_value,
      favourite_weapon
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"

    #make array of values for prepared statement
    values = [@name, @species, @bounty_value, @favourite_weapon, @id]
    #prepare statement
    db.prepare("update", sql)
    #run statement with db
    db.exec_prepared("update", values)
    #close link to db
    db.close()
  end


  #define function to return one instance of class when name is passed in
  def Bounty.find_by_name(name)
    #connect to db
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write big SQL statement string
    sql = "SELECT FROM bounties WHERE name = $1"
    #make array of values for prepared statement
    values = [@name]
    #prepare statement
    db.prepare("update", sql)
    #run statement with db
    db.exec_prepared("update", values)
    #close link to db
    db.close()
  end


  #define function to return one instance of class when id is passed in
  def Bounty.find_by_id(id)
    #connect to db
    db = PG.connect({ dbname: "bounty_hunters", host: "localhost" })
    #write big SQL statement string
    sql = "SELECT FROM bounties WHERE id = $1"
    #make array of values for prepared statement
    values = [@id]
    #prepare statement
    db.prepare("update", sql)
    #run statement with db
    db.exec_prepared("update", values)
    #close link to db
    db.close()
  end

end
