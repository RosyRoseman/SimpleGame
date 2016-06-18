class Player
  include Combatable
  attr_accessor :attributes

  def initialize
    status_start
    @attributes = {
                    inventory:       Inventory.new,
                    name:            "Player",
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

  def status
    puts "*" * 80
    puts "HP: #{@attributes[:hp]}/#{@attributes[:maxhp]}"
    puts "Your #{self.equipped[:weapon].attributes[:name]} deals #{(self.equipped[:weapon].attributes[:damage])} damage."
    puts "*" * 80
    @attributes[:inventory].print_equipped
  end
end
