class Monster
  include Combatable
  def attributes
    @attributes
  end
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
  def status
    puts "#{attributes[:name]} is at #{attributes[:hp]} health."
  end
end
#########################################
class Frogzard < Monster
  def initialize
    @attributes = {
      name:               "Frogzard",
      ac:                 8,
      bab:                0,
      maxhp:              8,
      hp:                 8,
      damage:             [1,5],
      stats:              {str: 8, dex: 8, con: 10, int: 1, wis: 4, cha: 1},
      level:              1,
      loot:               Roll.item,
      status_effects:     status_start,
      exp:                5,
      description:        "Its a lizard that f@#cked a frog."
    }
  end
  def self.commonality
    10
  end
end

class Spider < Monster
  def initialize
    @attributes = {
      name:               "Spider",
      ac:                 8,
      bab:                0,
      maxhp:              10,
      hp:                 10,
      damage:             [2,2],
      stats:              {str: 8, dex: 8, con: 10, int: 1, wis: 4, cha: 1},
      level:              1,
      loot:               Roll.item,
      status_effects:     status_start,
      exp:                5,
      description:        "Its... just a spider, like, not even a big one."
    }
    status_start
  end
  def self.commonality
    10
  end
end



=begin
def initialize
  @attributes = {
    name:               ,
    ac:                 ,
    bab:                ,
    maxhp:              ,
    hp:                 ,
    damage:             [],
    stats:              {str: 8, dex: 8, con: 10, int: 1, wis: 4, cha: 1},
    level:              1,
    loot:               Roll.item,
    status_effects:     status_start,
    exp:                ,
    description:
  }
end

=end
