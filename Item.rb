class Item
attr_accessor :name

  def loot
    puts "You find a #{@name}!"
    #Add item to inventory
  end

  def name
    @name
  end
end

class Potion < Item

  def self.drink
    puts "You drink the #{self.name}."
    give_player_effect
  end

  def throw
    puts "You throw the #{self.name} at your target."
    give_monster_effect
  end
end

class HealthPotion < Potion

  def initialize
    found_potion
    puts "HealthPot Created."
    @name = "Health Potion"

  end

  def found_potion
    puts "Do you want to drink this?"
    input = Parser.get_input([:yes, :no])
      if input == :yes
         HealthPotion.drink
      elsif input == :no
        Inventory.add(self)
        puts "Health Potion added to your inventory."
      end
  end

  def self.call_new
    HealthPotion.new
  end

  def self.give_player_effect
    $player.HealDmg(10)
    #remove from inventory
  end

  def give_monster_effect(target)
    @monster.HealDmg(10)
    #remove from inventory
  end
end
