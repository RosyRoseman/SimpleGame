class Player
  include Combatable
  LEVEL_REQUIREMENTS  = [1, 50, 100, 200, 400, 800, 2000, 5000, 10000]
  attr_accessor :attributes

  def initialize
    status_start
    @attributes = {
                    inventory:       Inventory.new,
                    name:            "Player",
                    baseac:          8,
                    ac:              8,
                    bab:             0,
                    maxhp:           20,
                    hp:              20,
                    stats:           {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8},
                    level:           0,
                    exp:             0,
                    status_effects:  @status_effects,
                    location:        :dungeon_entrance,
                    room:            -1
                    }
  end
  def attributes
    @attributes
  end
  def inventory
    @attributes[:inventory].inventory
  end
  def equipped
    @attributes[:inventory].equipped
  end

  def refresh
    @attributes[:inventory].refresh
    armour_benefit
    @attributes[:ac] = @attributes[:baseac] + @protection
    check_level
  end

  def status
    puts "*" * 80
    puts "HP: #{@attributes[:hp]}/#{@attributes[:maxhp]}"
    puts "Your #{self.equipped[:Weapon].attributes[:name]} deals #{(self.equipped[:Weapon].attributes[:damage])} damage."
    puts "*" * 80
    @attributes[:inventory].print_equipped
  end

  def armour_benefit
    total = [0]
    @attributes[:inventory].equipped.each do |e|
      if e[1].attributes[:protection]
        total << e[1].attributes[:protection]
      end
    end
    @protection = [total.inject(:+), 0].max
  end

  def check_level
    if @attributes[:exp] >= LEVEL_REQUIREMENTS[@attributes[:level]]
      level_up
    end
  end

  def level_up
    @attributes[:level] += 1
    Story.say_slow("Congratulations or reaching level #{@attributes[:level]}!", blue)
  end

end
