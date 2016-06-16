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

  def Combatable.included(mod)
    attr_accessor :HP, :WepDmg
  end

  def initialize_stats(stats)
    @stats = stats
    @HP               = stats[:maxHP]
    @WepDmg           = stats[:WepDmg]
  end

  def alive?
    @HP > 0
  end

  def hp
    @HP
  end

  def TakeDmg(amount)
    @HP -= amount
  end

  def HealDmg(amount)
    @HP += amount
    @HP = [@HP, @stats[:maxHP]].min
  end
end

##########################################################
