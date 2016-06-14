require './Dependencies'

class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :inventory, :use_item, :take]

  def initialize
    @world                          = World.new
    $player                         = Player.new
    puts 'Game Start'
    start_game
  end

  private
################################################
  def start_game
      $dungeon_room_list             = Array.new
      Story.introduction
      @room                          = $dungeon_room_list.first
###############GAME LOOP########################
    while $player.alive?
      refresh_world
      input = Parser.get_input(ACTIONS)
      take_action(input)
    end
    puts "Game Over Wah Wah Wa~uh"
    exit
  end
##############################################
  def refresh_world
    @room                          = $dungeon_room_list[$dungeon.get_room_of($player)-1]
    @room_is                       = @room.get_room_is
  end
  def take_action(action)
    case action
    when :forward
#      if @room_is[:content] && Monster === @room_is[:content][0] && @room_is[:content][0].alive?
#        puts "You can't seem to get around the #{(@room_is[:content][0]).name}"
#      else
        if @room == $dungeon_room_list.last
          $dungeon_room_list          << Room.new
        end
        $dungeon.player_forward
        refresh_world
        @room.print_room_status
#      end
    when :backward
      $dungeon.player_backward
      refresh_world
      @room.print_room_status
    when :look
      @room.print_room_status
    when :status
      $player.print_player_status
    when :attack
      if Monster === (@room_is[:content][0])
         combat = Combat.new
         combat.fight_monster(@room_is[:content][0])
      elsif Item === (@room_is[:content][0])
        puts "You want to attack a #{(@room_is[:content][0]).name}? I think not."
      else
        puts "Error: Content is neither monster nor item. #{@room_is[:content][0]}"
      end
    when :inventory
      Inventory.print_inventory
    when :use_item
      Inventory.use(@room_is[:content][0])
    when :take
      case @room_is[:content][0]
      when Potion; @room_is[:content][0].found
      when Garbage; puts "You really don't need to pick that up."
      when Monster; puts "Yeah, maybe kill it first, before you try and put it in your pocket..."
      when :dead_monster; puts "You turn over the corpse and rustle around in its pockets for #{@room_is[:content][2][0]}"
      else puts "This is wrong, tell the developers that you tried to pick up a #{@room_is[:content][0]}"
      end
    end
  end
end

$game = Game.new
