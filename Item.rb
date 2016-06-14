require './Potions'
require './Weapons'
class Item
attr_accessor :name

  def name
    @name
  end

  def find#(find_seed)
    Random.item
  end
end
#########################################
module Equipable

end
module Throwable
  def throw(target)
    puts "You throw the #{self.name} at your target."
    give_effect(target)
  end
end
###########################################
class Potion < Item
include Throwable
  def drink(potion_name)
    puts "You drink the #{potion_name}."
    give_effect($player)
  end
  def found
    puts "Do you want to drink this?"
    input = Parser.get_input([:yes, :no])
      if input == :yes
         self.drink(self.class.name)
      elsif input == :no
        Inventory.add(self)
      end
  end

end
###################################################

###############################################
class Weapon < Item
include Equipable

end
#####################################################
class Garbage < Item
  TRASH = ["old tin-can", "rusty sword", "crushed helm", "bent pewter cup"]
  def initialize
    @name = TRASH.sample
  end
end
