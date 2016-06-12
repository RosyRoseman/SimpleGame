require './Dependencies'

class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :inventory]

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
    puts "Inside you find a #{(@room_is[:content]).name}! Oh Shit!"
  end

  def print_inventory
    $inventory.each {|pair| puts "#{pair.last} || #{pair.first.to_s}"}
    puts " "
    puts "*" * 80
    puts "#{$inventory.count} items."
  end

  def take_action(action)
    case action
    when :forward
      if @room == $dungeon_room_list.last
        $dungeon_room_list          << Room.new
      end
      $dungeon.player_forward
      print_status
    when :backward
      $dungeon.player_backward
      @room                         = $dungeon_room_list[@current_room-1]
    when :look
      print_status
    when :status
      $player.print_player_status
    when :attack
      if (@room_is[:content]).instance_of? Monster
         combat = Combat.new
         combat.fight_monster(@room_is[:content])
      elsif (@room_is[:content]).instance_of? Item
        puts "You want to attack a #{@name}? I think not."
      else
        puts "Error: Content is neither monster nor item."
      end
    when :inventory
      print_inventory
    end
  end
end

$game = Game.new
