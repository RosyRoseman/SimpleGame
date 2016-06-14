class Inventory
attr_accessor :equipped
  def initialize
    @starting_weapon = Bludgeon.new
    $inventory = {bludgeon: [1, @starting_weapon, @starting_weapon.weight]}
    $equipped = {weapon: @starting_weapon}
  end

  def self.add(item)
    if item.class.ancestors.include? Item
       thing = item.class.name.to_sym
       if $inventory.include?(thing)
          $inventory[thing] += 1
       else
          $inventory[thing] = 1
       end
       puts "You put the #{thing} in your inventory."
     else
       puts "#{item.class}"
    end
  end
  def equip(item)
    $equipped[item.class] = item
  end
  def self.equipped
    $equipped
  end




end
