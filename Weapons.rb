class Weapon < Item

end
########################################################
class Bludgeon < Item
  def initialize
    @attributes = {
      name:             "Bludgeon",
      weight:           1,
      damage:           [1,6],
      commonality:      4,
      equippable:       TRUE,
      type:             :weapon
    }
  end
  def self.prime
    TRUE
  end
end

class ShortSword < Item
  def initialize
    @attributes = {
      name:             "Short sword",
      weight:           1,
      damage:           [2,4],
      commonality:      4,
      equippable:       TRUE,
      type:             :weapon
    }
  end
  def self.prime
    TRUE
  end
end

class Banana < Item
  def initialize
    @attributes = {
      name:             "Banana",
      weight:           1,
      damage:           [4,8],
      commonality:      2,
      equippable:       TRUE,
      type:             :weapon
    }
  end
  def self.prime
    TRUE
  end
end

class Hatchet < Item
  def initialize
    @attributes = {
      name:             "Hatchet",
      weight:           1,
      damage:           [2,6],
      commonality:      4,
      equippable:       TRUE,
      type:             :weapon
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
    damage:           ,
    commonality:      ,
    equippable:       TRUE,
    type:             :weapon
  }
  add_attributes
end
def self.prime
  TRUE
end


=end
