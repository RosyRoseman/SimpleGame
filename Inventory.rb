class Inventory
  attr_accessor :equipped
  def initialize
    @inventory = {bludgeon: [Bludgeon.new]}
    @equipped  = {weapon: @inventory[:bludgeon][0]}
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

  def equip(item)
    if item.attributes[:equippable]
      @equipped[item.class.to_s.downcase.to_sym] = item
    else
      puts "This item can't be equipped."
    end
  end

  def unequip(item)
    @equipped[item.class.to_s.downcase.to_sym] = nil
  end

  def print_inventory
    @inventory.each {|pair| puts "#{pair[1].count} || #{pair[0].to_s}"}
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
    if @inventory[input].last.attributes[:usable] = TRUE
      @inventory[input].pop.use
    else
      puts "This item cant be used."
    end
  end

  def use_combat(target)
    puts "What item would you like to use?"
    print_inventory
    input = Parser.get_specific(@inventory.keys)
    if @inventory[input].first.attributes[:usable] = TRUE
      @inventory[input].pop.use_c(target)
    else
      puts "This item cant be used."
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
