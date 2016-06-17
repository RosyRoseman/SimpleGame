class Inventory
attr_accessor :equiped
  def initialize
    @starting_weapon = Bludgeon.new
    $inventory = {bludgeon: {is: [@starting_weapon]}}
    $equipped = {weapon: @starting_weapon}
  end

  def self.add(item)
    if item.class.ancestors.include? Item
       thing = item.class.name.to_sym.downcase
       if $inventory.include?(thing)
          $inventory[thing][:is] << item
       else
          $inventory[thing] = {is: [item]}
       end
       puts "You put the #{thing} in your inventory."
     else
       puts "#{item.class}"
    end
  end
  def self.use(target)
    puts "What item would you like to use?"
    print_inventory
    input = Parser.get_specific($inventory.keys)
    $inventory[input][:is].pop.use(target)
    unless $inventory[input][:is].any?; then $inventory.delete(input) end 
  end
  def self.equip(item)
    $equipped[item.class] = item
  end
  def self.unequip(item)
    $equipped[item.class] = nil
  end
  def self.equipped
    $equipped
  end

  def self.print_inventory
    $inventory.each {|pair| puts "#{pair[1][:is].count} || #{pair[0].to_s}"}#NEEDS LOTS OF WORK
    puts "*" * 80
    puts "#{$inventory.count} items."
  end
  def print_equipped

  end
end
