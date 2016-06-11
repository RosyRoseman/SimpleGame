require './World'
require './Player'
require './Monster'
require './Item'
require './Story'

class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :quit, :help]

  def initialize
    @world                          = World.new
    $player                         = Player.new
    @story                          = Story.new
    puts 'Game Start'
    start_game
  end

  def  get_input(actions)
    while true
      print ">>"
      input = gets.chomp.downcase.to_sym
      next unless actions.include? input
      return input
    end
  end

  def  self.get_input(actions)
    while true
      print ">>"
      input = gets.chomp.downcase.to_sym
      next unless actions.include? input
      return input
    end
  end

  private
################################################
  def start_game
      $dungeon_room_list             = Array.new
      @story.introduction
      @room                          = $dungeon_room_list.first
    while $player.alive?
      @current_room                  = $dungeon.get_room_of($player)
      @room                          = $dungeon_room_list[@current_room-1]
      @room_is                       = @room.get_room_is
      input = get_input(ACTIONS)
      take_action(input)
    end
    puts "Game Over Wah Wah Wa~uh"
    exit
  end
##############################################

  def print_status
    puts "You are in room number #{@room_is[:room_number]}."
    puts "You are in a #{@room_is[:adjetive]} room, that is roughly #{@room_is[:size]}."
    puts "Inside you find a #{(@room_is[:content]).name}! Oh Shit!"
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
         (@room_is[:content]).combat($player)
      elsif (@room_is[:content]).instance_of? Item
        puts "You want to attack a #{@name}? I think not."
      else
        puts "Error: Content is neither monster nor item."
      end
    when :quit
      exit
    when :help
      @story.help
    end
  end
end

$game = Game.new
