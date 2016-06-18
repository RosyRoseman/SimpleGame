require './Dependencies'
class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :inventory, :use_item, :take, :equip]

  def initialize
    $player = Player.new
    start_game
  end
  def refresh
    @room = $player.attributes[:location]
    $player.attributes[:inventory].refresh
  end
  private
  def start_game
    Story.introduction
    refresh
  ###############GAME LOOP###################
  while $player.alive?
      refresh
      take_action(Parser.get_input(ACTIONS))
      refresh
    end
    puts "GAME OVER"
    exit
  end
end
###############END LOOP#######################
def take_action(action) #Non-combat
  case action
  when :forward
    $dungeon.forward
    refresh
    @room.status
  when :backward
    $dungeon.backward
    refresh
    @room.status
  when :look
    @room.status
  when :status
    $player.status
  when :attack
    Combat.new(@room.attributes[:content])
  when :inventory
    $player.attributes[:inventory].print_inventory
  when :use_item
    $player.attributes[:inventory].use
  when :take
    @room.loot
  when :equip
    $player.attributes[:inventory].equip
  end
end
$game = Game.new
