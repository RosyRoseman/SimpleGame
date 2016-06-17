class Combat
  COMBAT_ACTIONS  = [:attack, :run, :use_item, :help, :quit, :status, :inventory]

  def intitialize
    puts "Combat Initialized"
  end

  def fight_monster(monster)
    @monster                            = monster
    @weapon                             = $equipped[:weapon]
    if @monster.alive?
       if Roll.to_hit?(@monster, $player); @monster.hits($player) end
       if Roll.to_hit?($player, @monster); @weapon.hits(@monster) end
     else
       puts "The monster in this room is already dead..."
    end
    while @monster.alive?
      input = Parser.get_input(COMBAT_ACTIONS)
      case input
      when :attack
        if $player.alive? && @monster.alive?
          if Roll.to_hit?($player, @monster); @weapon.hits(@monster) end
          if @monster.alive?
            puts "It's at #{@monster.hp}"
            if Roll.to_hit?(@monster, $player); @monster.hits($player) end
          else
            puts "He's dead jim."
            @monster.died
          end
        else $player.died
        end
      when :run
        puts "This feature hasn't been implemented yet..."
      when :use_item
        Inventory.use(@monster)
      when :quit
        exit
      when :status
        puts "does status stuff"
      when :inventory
        Inventory.print_inventory
      end
    end
  end
end
############################################################
module Combatable
  def status_start
    @status_effects = {debuff: FALSE, petrified: FALSE, poisoned: FALSE, asleep: FALSE, frozen: FALSE, confused: FALSE}
  end
  def alive?
    @attributes[:hp] > 0
  end
  def TakeDmg(amount)
    @attributes[:hp] -= amount
  end
  def HealDmg(amount)
    @attributes[:hp] += amount
    @attributes[:hp] = [@attributes[:hp], @attributes[:maxhp]].min
  end
  def debuff(stat, amount)
    @attributes[:status_effects][:debuff] = [TRUE, {stat, amount}]
    @attributes[:stats][stat] -= amount
  end
  def remove_debuff(stat)
    if @attributes[:status_effects][:debuff] != FALSE && @attributes[:status_effects][:debuff][1][stat]
       @attributes[:stats][stat] += @attributes[:status_effects][:debuff][1][stat]
       @attributes[:status_effects][:debuff][1].delete(stat)
       unless @attributes[:status_effects][:debuff][1]
         @attributes[:status_effects][:debuff] = FALSE
       end
    elsif @attributes[:status_effects][:debuff] != FALSE && not @attributes [:status_effects][:debuff][1][stat]
       puts "That attribute isnt debuffed at the moment."
    else
       puts "You aren't suffering any debuffs at the moment."
    end
  end
  def give_status_effect(effect)
    @attributes[:status_effects][effect] = TRUE
  end
  def remove_status_effect(effect)
    if effect == :all
      @attributes[:status_effects].each_key |key|
      key = FALSE
    else
      @attributes[:status_effects][effect] = FALSE
    end
  end
end
##########################################################
