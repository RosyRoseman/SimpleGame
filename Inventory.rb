class Inventory

  def initialize
  $inventory = {bludgeon: 1}
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






end
