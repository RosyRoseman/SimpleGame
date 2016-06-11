class Monster
  attr_accessor :HP, :WepDmg, :Type, :monster_species

  def initialize
    @HP = 3
    @WepDmg = 1
    @monster_species = get_species
    @current_monster = @monster_species
    puts "Initialized Monster"
  end

  def alive?
    @HP > 0
  end

  def TakeDmg(amountDmg)
    @HP -= amountDmg
  end

  def get_monster_species
    @monster_species
  end

  def get_current_monster
    @current_monster
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
