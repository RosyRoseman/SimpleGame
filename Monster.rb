require './Combat'

class Monster
  attr_accessor :name
  include Combatable
  def name
    @name
  end
end


class FrogLizard < Monster
  def initialize
    initialize_stats({maxHP: 10, WepDmg: [1,3]})
    @name = "Frog Lizard"
  end
end

class LizardFrog < Monster
  def initialize
    initialize_stats({maxHP: 7, WepDmg: [2,2]})
    @name = "Lizard Frog"
  end
end
