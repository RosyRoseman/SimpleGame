require './World'
require './Player'
require './Monster'
require './Item'
require './Story'

class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :quit, :yes, :no]

  def initialize
    @world              = World.new
    $player             = Player.new
    @room               = Room.new
    @story              = Story.new
    @room_size          = @room.get_room_size
    @room_adjetive      = @room.get_room_adjetive
    @current_room       = @world.get_room_of($player)
    puts 'Game Start'
    start_game
  end

  def  get_input(actions)
    while true
      print ">>"
      input = gets.chomp.to_sym
      next unless actions.include? input
      return input
    end
  end

  def  self.get_input(actions)
    while true
      print ">>"
      input = gets.chomp.to_sym
      next unless actions.include? input
      return input
    end
  end

  private
################################################
  def start_game
      @story.introduction
      @content            = "Nothing Yet"
    while $player.alive?
      @current_room       = @world.get_room_of($player)
      @content            = @room.content
      @content_name       = @content.name
      @monster            = @room.content
      input = get_input(ACTIONS)
      take_action(input)
    end
    puts "Game Over Wah Wah Wa~uh"
  end
##############################################

  def print_status
    puts "You are in room number #{@current_room}."
    puts "You are in a #{@room_adjetive} room, that is roughly #{@room_size}."
    puts "Inside you find a #{@content_name}! Oh Shit!"
  end

  def take_action(action)
    case action
    when :forward
      @world.player_forward
      @room               = Room.new
      @room_size          = @room.get_room_size
      @room_adjetive      = @room.get_room_adjetive
      @content            = @room.content
      @monster            = @room.content
      print_status
    when :backward
      @world.player_backward
    when :look
      print_status
    when :status
      $player.print_player_status
    when :attack
      @monster.combat($player)
    when :quit
      exit
    end
  end
end

$game = Game.new
