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
      @current_room                  = $dungeon.get_room_of($player)
      @room                          = $dungeon_room_list[@current_room-1]
      @room_is                       = @room.get_room_is
      input = Parser.get_input(ACTIONS)
      take_action(input)
    end
    puts "Game Over Wah Wah Wa~uh"
    exit
  end
##############################################

  def print_status
    @current_room                  = $dungeon.get_room_of($player)
    @room                          = $dungeon_room_list[@current_room-1]
    @room_is                       = @room.get_room_is
    puts "You are in room number #{@room_is[:room_number]}."
    puts "You are in a #{@room_is[:adjetive]} room, that is roughly #{@room_is[:size]}."
    unless @room_is[:content].is_a? Array
      puts "Inside you find a #{(@room_is[:content]).name}! Oh Shit!"
    else
      puts "Inside is now #{@room_is[:content][1]}"
    end
  end

  def print_inventory
    $inventory.each {|pair| puts "#{pair.last} || #{pair.first.to_s}"}
    puts "*" * 80
    puts "#{$inventory.count} items."
  end

  def take_action(action)
    case action
    when :forward
      if @room_is[:content] && Monster === @room_is[:content] && @room_is[:content].alive?
        puts "You can't seem to get around the #{(@room_is[:content]).name}"
      else
        if @room == $dungeon_room_list.last
          $dungeon_room_list          << Room.new
        end
        $dungeon.player_forward
        print_status
      end
    when :backward
      $dungeon.player_backward
      @room                         = $dungeon_room_list[@current_room-1]
    when :look
      print_status
    when :status
      $player.print_player_status
    when :attack
      if Monster === (@room_is[:content])
         combat = Combat.new
         combat.fight_monster(@room_is[:content])
      elsif Item === (@room_is[:content])
        puts "You want to attack a #{(@room_is[:content]).name}? I think not."
      else
        puts "Error: Content is neither monster nor item. #{@room_is[:content]}"
      end
    when :inventory
      print_inventory
    when :use_item
      puts "What would you like to use?"
      puts "needs to be one of #{$inventory.keys}"
      input = Parser.get_specific($inventory.keys)
      puts "was #{input} "
    when :take
      case @room_is[:content][0]
      when Potion; @room_is[:content].found
      when Garbage; puts "You really don't need to pick that up."
      when Monster; puts "Yeah, maybe kill it first, before you try and put it in your pocket..."
      when :dead_monster; puts "You turn over the corpse and rustle around in its pockets for #{@room_is[:content][2][0]}"
      else puts "This is wrong, tell the developers that you tried to pick up a #{@room_is[:content]}"
      end
    end
  end
end

$game = Game.new
