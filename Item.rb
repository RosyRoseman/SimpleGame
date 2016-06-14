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
###########################################
class Potion < Item

  def drink(potion_name)
    puts "You drink the #{potion_name}."
    give_effect($player)
  end

  def throw(target)
    puts "You throw the #{self.name} at your target."
    give_effect(target)
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
class HealthPotion < Potion
  def initialize
    @name = "Health Potion"
  end
  def give_effect(target)
    target.HealDmg(10)
    #remove from inventory
  end
end
#######################################################
class FirePotion < Potion
  def initialize
    @name = "Potion of Liquid Fire"
  end
  def give_effect(target)
    target.TakeDmg(10)
  end
end
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
