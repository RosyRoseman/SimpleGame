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
    puts "HealthPot Created."
    @name = "Health Potion"
  end

  def ask_to_drink
    while true
    puts "Do you want to drink this?"
    input = Game.get_input([:yes, :no])
      if input == :yes
         HealthPotion.drink
      elsif input == :no
        puts "Health Potion added to your inventory."
      end
      break
    end
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
