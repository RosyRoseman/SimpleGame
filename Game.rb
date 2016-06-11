require './World'
require './Player'
require './Monster'

class Game
  ACTIONS = [:forward, :backward, :look, :status, :attack, :quit]

  def initialize
    @world              = World.new
    @player             = Player.new
    @room               = Room.new
    @monster            = Monster.new
    @current_monster    = @monster.get_current_monster
    @room_size          = @room.get_room_size
    @room_adjetive      = @room.get_room_adjetive
    @current_room       = @world.get_room_of(@player)
    puts 'Game Start'
    print_status
    start_game
  end

  private
################################################
  def start_game
    while @player.alive?
      @current_room       = @world.get_room_of(@player)
      @current_monster    = @monster.get_current_monster
      action = take_player_input
      next unless ACTIONS.include? action

      take_action(action)
    end
    puts "Game Over Wah Wah Wa~uh"
  end
##############################################
  def take_player_input
    puts "What do you do? (forward, backward, look, status, attack, quit)"
    gets.chomp.to_sym
  end

  def print_status
    puts "You are in room number #{@current_room}."
    puts "You are in a #{@room_adjetive}, that is roughly #{@room_size}."
    puts "Inside you find a #{@current_monster}! Oh Shit!"
  end

  def take_action(action)
    case action
    when :forward
      @world.player_forward
      @room               = Room.new
      @room_size          = @room.get_room_size
      @room_adjetive      = @room.get_room_adjetive
      @monster            = @room.content
      print_status
    when :backward
      @world.player_backward
    when :look
      print_status
    when :status
      @player.print_player_status
    when :attack
      @monster.combat(@player)
    when :quit
      exit
    end
  end
end

Game.new
