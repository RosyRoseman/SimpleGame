class Monster
  attr_accessor :HP, :WepDmg, :Type, :monster_species, :Name

  def initialize
    @HP = 3
    @WepDmg = 1
    @current_monster = get_species
    @name = @current_monster
    puts "Initialized Monster"
  end

  def alive?
    @HP > 0
  end

  def TakeDmg(amountDmg)
    @HP -= amountDmg
  end

  def HealDmg(amountHeal)
    @HP += amountHeal
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
        TakeDmg(player.WepDmg)
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
