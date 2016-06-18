class Potion < Item
  include Throwable
  def use
    puts "You drink the #{@attributes[:name]}."
    give_effect($player)
  end

  def use_c(target)
    puts "Would you like to throw this or drink it?"
    input = Parser.get_specific([:drink, :throw])
    if input == :drink; give_effect($player)
    elsif input == :throw; give_effect(target) end
  end
end
###############################################
class HealthPotion < Potion
  def initialize
    @attributes = {
      name:           "Health Potion",
      commonality:    16
    }
  end

  def give_effect(target)
    target.heal_damage(10)
    puts "#{target.attributes[:name]} is healed 10 points of damage"
  end
  def self.primary
    TRUE
  end
end

class FirePotion < Potion
  def initialize
    @attributes = {
      name:           "Fire Potion",
      commonality:    6,
      damage:         [1, 16]
    }
  end

  def give_effect(target)
    target.take_damage(Roll.damage(@attributes[:damage]))
    puts "***Whoosh****"
    puts "#{target.attributes[:name]} is now on fire!"
    target.give_status_effect(:on_fire)
  end
  def self.primary
    TRUE
  end
end
