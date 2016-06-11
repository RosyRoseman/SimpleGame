class Monster
  attr_accessor :HP, :WepDmg, :Type, :Species

  def initialize
    @HP = 3
    @WepDmg = 1
    @Species = get_species
  end

  def alive?
    @hit_points > 0
  end

  def TakeDmg(amountDmg)
    @HP -= amountDmg
  end

  def get_species
    ["Frog Lizard", "Lizard Frog",
      "Abnormal cross between a Frog and a Lizard"].sample
  end

  def combat(player)
    while player.alive?
      puts "You hit the monster for #{player.WepDmg}"
      TakeDmg(player.WepDmg)
      break unless alive?
      player.TakeDmg(@WepDmg)
      puts "The monster hits back for #{@WepDmg} points of damage."
    end
  end
end
