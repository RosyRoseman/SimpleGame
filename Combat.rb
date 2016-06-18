class Combat
  COMBAT_ACTIONS = [:attack, :run, :use_item, :status, :inventory]

  def initialize(enemy)
    if enemy.alive?
      @enemy = enemy
      combat_start
    else
      puts "Stop trying to attack a dead horse. Sorry \"#{enemy.attributes[:name]}\""
    end
  end
###########################COMBAT LOOP########################
  def combat_start
    effect_trigger
    Roll.initiative(@enemy)
    fight
      while @enemy.alive? && $player.alive?
        take_action(Parser.get_input(COMBAT_ACTIONS))
        effect_trigger
      end
    Story.death_message(@enemy)
  end
################################END LOOP#############################
  def fight
      if $player.attributes[:initiative] > @enemy.attributes[:initiative]
        player_hits
        if @enemy.alive?; monster_hits end
      else
        monster_hits
        player_hits
      end
  end

  def effect_trigger
    $player.attributes[:inventory].refresh
    puts @enemy.status
    #this is where effects will happen
  end

  def run
    Story.fourohfour
  end

  def player_hits
    if Roll.to_hit?(@enemy, $player)
       @enemy.take_damage($player)
     end
  end

  def monster_hits
    if Roll.to_hit?($player, @enemy)
      $player.take_damage(@enemy)
    end
  end

  def take_action(action)
    case action
    when :attack
      fight
    when :run
      run
    when :use_item
      $player.inventory.use_combat(@enemy)
    when :status
      $player.status
    when :inventory
      $player.inventory.print_inventory
    end
  end
end
####################################################################
module Combatable
  def status_start
    @status_effects = {
      debuff:       FALSE,
      petrified:    FALSE,
      poisoned:     FALSE,
      asleep:       FALSE,
      frozen:       FALSE,
      confused:     FALSE,
      on_fire:      FALSE
      }
  end

  def alive?
    @attributes[:hp] > 0
  end

  def take_damage(hitter)
    if hitter == $player; power = $player.equipped[:weapon].attributes[:damage]
    else power = hitter.attributes[:damage] end
    damage = Roll.damage(power)
    @attributes[:hp] -= damage
    @attributes[:hp] = [@attributes[:hp], 0].max
  end

  def heal_damage(amount)
    @attributes[:hp] += amount
    @attributes[:hp] = [@attributes[:hp], @attributes[:maxhp]].min
  end

  def debuff(stat, amount)
    @attributes[:status_effects][:debuff] = [TRUE, {stat =>  amount}]
    @attributes[:stats][stat] -= amount
  end

  def remove_debuff(stat)
    if @attributes[:status_effects][:debuff] != FALSE && @attributes[:status_effects][:debuff][1][stat]
       @attributes[:stats][stat] += @attributes[:status_effects][:debuff][1][stat]
       @attributes[:status_effects][:debuff][1].delete(stat)
       unless @attributes[:status_effects][:debuff][1]
         @attributes[:status_effects][:debuff] = FALSE
       end
    elsif @attributes[:status_effects][:debuff] != FALSE
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
