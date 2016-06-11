class Player
  attr_accessor :HP, :WepDmg

  def initialize
    @HP               = 10
    @WepDmg           = 1

    puts 'Player Initialized'
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

  def print_player_status
    puts "*" * 80
    puts "HP: #{@HP}/10"
    puts "*" * 80
  end
  

end
