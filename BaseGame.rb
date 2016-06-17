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
    puts "Game Over. Wah Wah Wa~uh"
    exit
  end
##############################################
  def refresh_world
    @room                          = $dungeon_room_list[$dungeon.get_room_of($player)-1]
    @attributes                    = @room.attributes
  end
  def take_action(action)
    case action
    when :forward
#      if @attributes[:content] && Monster === @attributes[:content][0] && @attributes[:content][0].alive?
#        puts "You can't seem to get around the #{(@attributes[:content][0]).name}"
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
      if Monster === (@attributes[:content][0])
         combat = Combat.new
         combat.fight_monster(@attributes[:content][0])
      elsif Item === (@attributes[:content][0])
        puts "You want to attack a #{(@attributes[:content][0]).attributes[:name]}? I think not."
      else
        puts "Error: Content is neither monster nor item. #{@attributes[:content][0]}"
      end
    when :inventory
      Inventory.print_inventory
    when :use_item
      Inventory.use(@attributes[:content][0])
    when :take
      case @attributes[:content][0]
      when Potion; @attributes[:content][0].found
      when Garbage; puts "You really don't need to pick that up."
      when Monster; puts "Yeah, maybe kill it first, before you try and put it in your pocket..."
      when :dead_monster; puts "You turn over the corpse and rustle around in its pockets for #{@attributes[:content][2][0]}"
      else puts "This is wrong, tell the developers that you tried to pick up a #{@attributes[:content][0]}"
      end
    end
  end
end

$game = Game.new
