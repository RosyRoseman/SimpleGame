require './Combat'

class Player
  include Combatable
  attr_accessor

  def initialize
    initialize_stats({maxHP: 25, WepDmg: [1,6]})

    puts 'Player Initialized'
  end

  def print_player_status
    puts "*" * 80
    puts "HP: #{@HP}/10"
    puts "Your 'weapon' deals #{@WepDmg} damage."
    puts "*" * 80
  end


end
