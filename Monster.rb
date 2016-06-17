require './Combat'

class Monster
  attr_accessor :attributes
  include Combatable
  def attributes_are
    @attributes = {name: @name, ac: @ac, bab: @bab, hp: @hp, maxhp: @maxhp,
                   wepdmg: @wepdmg, stats: @stats, commonality: @commonality,
                   level: @level, loot: @loot, status_effects: @status_effects,
                   description: @description}
  end
  def attributes
    @attributes
  end
  def died
    $dungeon_room_list[($dungeon.get_room_of($player))-1].clear(@attributes[:name], Roll.gold(@attributes[:loot]))#<<For the death flavor text.
#    $player.gain_xp(2)#*monster level
  end
  def hits(target)
    damage = Roll.damage(@attributes[:wepdmg])
    puts "The monster hits you for #{damage} points of damage."
    target.TakeDmg(damage)
  end
end


class FrogLizard < Monster
  def initialize
    status_start
    @name                     = "Frog Lizard"
    @ac                       = 8
    @bab                      = 0
    @maxhp                    = 10
    @hp                       = @maxhp
    puts "Set hp"
    @wepdmg                   = [1, 3]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "Its a lizard that is also a frog."
    attributes_are
  end
end

class LizardFrog < Monster
  def initialize
    initialize_stats({maxHP: 7, WepDmg: [2,2]})
    @name = "Lizard Frog"
    @ac = 8
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end

#Tweak the numbers however you'd like on these. I'm just coming up with monster names and stats for shits and giggles
class Spider < Monster
  def initialize
    initialize_stats({maxHP: 6, WepDmg: [1,2]})
    @name = "Spider"
    @ac = 6
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end

class GiantSpider < Monster
  def initialize
    initialize_stats({maxHP: 12, WepDmg: [2,6]})
    @name = "Giant Spider"
    @ac = 8
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end

class Shadeling < Monster
  def initialize
    initialize_stats({maxHP: 8, WepDmg: [2,2]})
    @name = "Shadeling"
    @ac = 10
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end

class StoneGolem < Monster
  def initialize
    initialize_stats({maxHP: 9, WepDmg: [2,2]})
    @name = "Stone Golem"
    @ac = 8
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end

class Skeleton < Monster
  def initialize
    initialize_stats({maxHP: 6, WepDmg: [2,2]})
    @name = "Skeleton"
    @ac = 6
    @bonus_to_hit = 0
  end
  def loot
    range = [2, 5]
  end
end
