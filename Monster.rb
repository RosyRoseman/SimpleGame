require "./Combatable"

class Monster
  include Combatable
  attr_accessor :Type, :monster_species, :Name

  def initialize
    initialize_stats({maxHP: 10, WepDmg: [1,2]})
    @current_monster = get_species
    @name = @current_monster
    puts "Initialized Monster"
  end

  def get_current_monster
    @current_monster
  end

  def name
    @name
  end

  def combat(player)
      if alive?
        puts "You hit the monster for #{player.WepDmg}"
        TakeDmg(Roll.damage(player.WepDmg))
        puts "It's at #{@HP} HP."
          if alive?
            player.TakeDmg(@WepDmg)
            puts "The monster hits back for #{@WepDmg} points of damage."
          else
            puts "He's dead Jim, or whatever your name is."
          end
      else
        puts "The monster is already dead..."
      end
  end
  private
  def get_species
    ["Frog Lizard", "Lizard Frog",
      "Abnormal cross between a Frog and a Lizard"].sample
  end
end
