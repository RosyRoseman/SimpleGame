require './World'
require './Player'


class Game
  ACTIONS = [:forward, :backward, :look, :status, :quit]

  def initialize
    @world              = World.new
    @player             = Player.new
    @room               = Room.new
    @room_size          = @room.get_room_size
    @room_adjetive      = @room.get_room_adjetive
    puts 'Game Start'
    start_game
  end

  private
  def start_game
    while @player.alive?
      @current_room       = @world.get_room_of(@player)

      print_status

      action = take_player_input
      next unless ACTIONS.include? action

      take_action(action)
    end
    puts "Game Over Wah Wah Wa~uh"
  end

  def take_player_input
    puts "What do you do? (forward, backward, look, status)"
    gets.chomp.to_sym
  end

  def print_status
    puts "You are in room number #{@current_room}."
    puts "You are in a #{@room_adjetive}, that is roughly #{@room_size}."
  end

  def take_action(action)
    case action
    when :forward
      @world.player_forward
      @room               = Room.new
      @room_size          = @room.get_room_size
      @room_adjetive      = @room.get_room_adjetive
    when :backward
      @world.player_backward
    when :look
      print_status
    when :status
      @player.print_player_status
    when :quit
      exit
    end
  end
end

Game.new
