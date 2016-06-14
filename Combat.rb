class Combat
  COMBAT_ACTIONS  = [:attack, :run, :use_item, :help, :quit]

  def intitialize
    puts "Combat Initialized"
  end

  def fight_monster(monster)
    @monster                            = monster
    @weapon                             = $equipped[:weapon]
    if @monster.alive?
       monster_hits
       @weapon.hits(@monster)
     else
       puts "The monster in this room is already dead..."
    end
    while @monster.alive?
      input = Parser.get_input(COMBAT_ACTIONS)
      case input
      when :attack
        if $player.alive?
          @weapon.hits(@monster)
          if @monster.alive?
            puts "It's at #{@monster.hp}"
            monster_hits
          else
            puts "He's dead jim."
            @monster.died
          end
        else $player.died
        end
      when :run
        puts "This feature hasn't been implimented yet..."
      when :use_item
        puts "This feature hasn't been implimented yet..."
      when :help
        puts "attack, run, use item"
      when :quit
        exit
      end
    end
  end

  private

  def monster_hits
    damage = Roll.damage(@monster.WepDmg)
    puts "The monster hits back for #{damage} points of damage."
    $player.TakeDmg(damage)
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
