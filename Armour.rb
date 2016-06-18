class Armour < Item
end
##################
class Helmet < Armour
end
class Cuirass < Armour
end
class Greaves < Armour
end
class Shield < Armour
end
#############################
class LeatherHelm < Helmet
  def initialize
    @attributes = {
      name:             "Leather Helmet",
      weight:           1,
      commonality:      3,
      equippable:       TRUE,
      type:             :Helmet,
      protection:       1
    }
  end
  def self.prime
    TRUE
  end
end
class PlateHelm < Helmet
  def initialize
    @attributes = {
      name:             "Plate Helm",
      weight:           2,
      commonality:      1,
      equippable:       TRUE,
      type:             :Helmet,
      protection:       2
    }
  end
  def self.prime
    TRUE
  end
end
#############################
class LeatherJerkin < Cuirass
  def initialize
    @attributes = {
      name:             "Leather Jerkin",
      weight:           2,
      commonality:      3,
      equippable:       TRUE,
      type:             :Cuirass,
      protection:       3
    }
  end
  def self.prime
    TRUE
  end
end
class PlateChestpiece < Cuirass
  def initialize
    @attributes = {
      name:             "Plate-maille Chest-piece",
      weight:           5,
      commonality:      1,
      equippable:       TRUE,
      type:             :Cuirass,
      protection:       5
    }
  end
  def self.prime
    TRUE
  end
end
##########################
class LeatherPants < Greaves
  def initialize
    @attributes = {
      name:             "Leather Hot-Pants",
      weight:           2,
      commonality:      3,
      equippable:       TRUE,
      type:             :Greaves,
      protection:       2
    }
  end
  def self.prime
    TRUE
  end
end
class PlateGreaves < Greaves
  def initialize
    @attributes = {
      name:             "Plate-maille Greaves",
      weight:           3,
      commonality:      1,
      equippable:       TRUE,
      type:             :Greaves,
      protection:       3
    }
  end
  def self.prime
    TRUE
  end
end
#############################
class WoodenBuckler < Shield
  def initialize
    @attributes = {
      name:             "Wooden Buckler",
      weight:           2,
      commonality:      4,
      equippable:       TRUE,
      type:             :Shield,
      protection:       1
    }
  end
  def self.prime
    TRUE
  end
end
class KiteShield < Shield
  def initialize
    @attributes = {
      name:             "Kite Shield",
      weight:           3,
      commonality:      2,
      equippable:       TRUE,
      type:             :Shield,
      protection:       2
    }
  end
  def self.prime
    TRUE
  end
end


=begin
def initialize
  @attributes = {
    name:             ,
    weight:           ,
    commonality:      ,
    equippable:       TRUE,
    type:             ,
    protection:
  }
end
def self.prime
  TRUE
end
=end
