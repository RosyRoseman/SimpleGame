class Item
  def attributes
    @attributes
  end
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
#############################################
module Throwable
  def throw(target)
    puts "You throw the #{@attributes[:name]} at your target."
    give_effect(target)
  end
end
#############################################
class Garbage < Item
  TRASH = ["old tin-can", "rusty sword", "crushed helm", "bent pewter cup", "torn rags", "piece of driftwood"]
  def initialize
    @attributes = {
    name:            TRASH.sample,
    commonality:     20,
    weight:          1
    }
  end
end
require './Potions'
require './Weapons'
require './Armour'
