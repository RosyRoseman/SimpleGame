require './Combat'

class Monster
  include Combatable
  attr_accessor :Type, :monster_species, :Name

  def initialize
    initialize_stats({maxHP: 10, WepDmg: [1,2]})
#    @monster_is = {:species \\\, :level \\\, :stats \\\, :type \\\, :loot \\\}
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

  private
  def get_species
    ["Frog Lizard", "Lizard Frog",
      "Abnormal cross between a Frog and a Lizard"].sample
  end
end
