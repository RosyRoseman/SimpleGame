require './Combat'

class Monster
  attr_accessor :attributes
  include Combatable
  def attributes_are
    @attributes = {name: @name, ac: @ac, bab: @bab, hp: @hp, maxhp: @maxhp,
                   wepdmg: @wepdmg, stats: @stats, commonality: @commonality,
                   level: @level, loot: @loot, status_effects: @status_effects,
                   description: @description}
                   status_start
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
    @name                     = "Frog Lizard"
    @ac                       = 8
    @bab                      = 0
    @maxhp                    = 10
    @hp                       = @maxhp
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
    @name                     = "Lizard Frog"
    @ac                       = 8
    @bab                      = 0
    @maxhp                    = 10
    @hp                       = @maxhp
    @wepdmg                   = [1, 3]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "Its a frog that is also a lizard."
    attributes_are
  end
end

#Tweak the numbers however you'd like on these. I'm just coming up with monster names and stats for shits and giggles
class Spider < Monster
  def initialize
    @name                     = "Spider"
    @ac                       = 6
    @bab                      = 0
    @maxhp                    = 6
    @hp                       = @maxhp
    @wepdmg                   = [1, 2]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "You ever seen Spiderman? It's like that but with less radioactivity."
    attributes_are
  end
end

class GiantSpider < Monster
  def initialize
    @name                     = "Giant Spider"
    @ac                       = 8
    @bab                      = 0
    @maxhp                    = 12
    @hp                       = @maxhp
    @wepdmg                   = [2, 6]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "Its a bigger spider."
    attributes_are
  end
end

class Shadeling < Monster
  def initialize
    @name                     = "Shadeling"
    @ac                       = 10
    @bab                      = 0
    @maxhp                    = 8
    @hp                       = @maxhp
    @wepdmg                   = [2, 2]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "Its a small Shade."
    attributes_are
  end
end

class StoneGolem < Monster
  def initialize
    @name                     = "Stone Golem"
    @ac                       = 8
    @bab                      = 0
    @maxhp                    = 14
    @hp                       = @maxhp
    @wepdmg                   = [2, 2]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 100
    @level                    = 1
    @loot                     = [2, 5, :copper]
    @description              = "Its a big stone dude."
    attributes_are
  end
end

class Skeleton < Monster
  def initialize
    @name                     = "Skeleton"
    @ac                       = 6
    @bab                      = 2
    @maxhp                    = 15
    @hp                       = @maxhp
    @wepdmg                   = [1, 8]
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @commonality              = 20
    @level                    = 1
    @loot                     = [3, 10, :copper]
    @description              = "2spoopy"
    attributes_are
  end
end
