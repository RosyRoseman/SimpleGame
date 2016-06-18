class Player
  include Combatable
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
                    level:           1,
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

end
