class Item
attr_accessor :name, :weight, :damage

  def name
    @name
  end
  def weight
    @weight
  end
  def damage
    @damage
  end
  def find#(find_seed)
    Random.item
  end
end
#########################################
module Equipable
  def equip
    Inventory.equip(self)
  end
  def unequip
    Inventory.unequip(self)
  end
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
  def use(target)
    puts "Would you like to throw this or drink it?"
    input = Parser.get_specific([:drink, :throw])
    if input == :drink; self.drink(self.name)
    elsif input == :throw; self.throw(target) end
  end
end
require './Potions'
###################################################

###############################################
class Weapon < Item
include Equipable
  def hits(target)
    hits_for = Roll.damage(@damage)
    puts "You hit the monster with your #{self.name.downcase} for #{hits_for}."
    target.TakeDmg(hits_for)
  end
end
require './Weapons'
#####################################################
class Garbage < Item
  TRASH = ["old tin-can", "rusty sword", "crushed helm", "bent pewter cup", "torn rags", "piece of driftwood"]
  def initialize
    @name = TRASH.sample
  end
end
