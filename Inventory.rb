class Inventory
  attr_accessor :equipped
  def initialize
    @inventory = {bludgeon: [Bludgeon.new]}
    @equipped = {}
    auto_equip(@inventory[:bludgeon].first)
  end

  def inventory
    @inventory
  end

  def equipped
    @equipped
  end

  def refresh
    @inventory.each do |k|
      unless k[1].any?; @inventory.delete(k[0])end
    end
  end

  def auto_equip(item)
    if @equipped[item.attributes[:type]]
      unequip(item.attributes[:type])
    end
    @equipped[item.attributes[:type]] = @inventory[item.class.to_s.downcase.to_sym].pop
  end

  def equip
    puts "What would you like to equip?"
    print_inventory
    print_equipped
    input = Parser.get_specific(@inventory.keys)
    if @inventory[input] && @inventory[input].last.attributes[:equippable]
      if @equipped[@inventory[input].first.attributes[:type]]
        unequip(@inventory[input].last)
      end
      @equipped[@inventory[input].first.attributes[:type]] = @inventory[input].pop
    else
      puts "This item can't be equipped."
    end
  end

  def unequip(item)
    @equipped[item.attributes[:type]] = nil
  end

  def print_inventory
    @inventory.each {|pair| puts "#{pair[1].count} || #{pair[1].first.attributes[:name]}"}
    puts "*" * 80
  end

  def print_equipped
    @equipped.each {|pair| puts "#{pair[0]}         #{pair[1].attributes[:name]}"}
    puts "*" * 80
  end

  def use #Non-combat
    puts "What item would you like to use?"
    print_inventory
    input = Parser.get_specific(@inventory.keys)
    if @inventory[input] && @inventory[input].last.attributes[:usable]
       @inventory[input].pop.use
     elsif @inventory[input]
       puts "This item cant be used."
     else
       puts ""
     end
  end

  def use_combat(target)
    puts "What item would you like to use?"
    print_inventory
    input = Parser.get_specific(@inventory.keys)
    if @inventory[input] && @inventory[input].first.attributes[:usable]
      @inventory[input].pop.use_c(target)
    elsif @inventory[input]
      puts "This item cant be used."
    else
      puts ""
    end
  end

  def add(thing) #to inventory
    if thing.class.ancestors.include? Item
      item = thing.class.to_s.downcase.to_sym
        if @inventory.include?(item)
           @inventory[item] << thing
        else
          @inventory[item] = [thing]
        end
    else
      puts "That #{thing} isn't an item, how can it go in your inventory?"
    end
  end

end
