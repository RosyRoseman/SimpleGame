class World

  def initialize
    puts 'World Initialized'
  end

end

#######################################################
class Dungeon

  def initialize
    puts "Dungeon Initialized."
    puts "Set player flag to 'in dungeon'"
    enter_dungeon
    $dungeon_room_list  = [Room.new]
  end

  def enter_dungeon
    puts "You are standing at the entrance of the dungeon"
    puts "Would you like to go inside?"
    input = Parser.get_input([:yes, :no])
    if input == :yes
      set_current_room_to(1)
      puts "You step inside the entrance."
    else
      set_current_room_to(0)
      puts "You decide its best not, and head back from whence you came."
    end
  end

  def player_forward
    @current_room += 1
  end

  def player_backward
    @current_room -= 1
  end

  def get_room_of(entity)
    @current_room
  end

  def set_current_room_to(room_number)
    @current_room = room_number
  end

end

######################################################
class Room
  attr_accessor :room_is

  def initialize
    puts "Creating Room..."
    @room_is           = {size: get_size, adjetive: get_adjetive, type: get_room_type,
                          content: get_content, room_number: get_new_room_number}
    puts "New room created"
  end

  def get_room_is
    @room_is
  end

  def print_room_status
    @room_is = self.get_room_is
    puts "You are in room number #{@room_is[:room_number]}."
    puts "You are in a #{@room_is[:adjetive]} room, that is roughly #{@room_is[:size]}."
    unless @room_is[:content][0].is_a? Symbol
      puts "Inside you find a #{(@room_is[:content][0]).name}! Oh Shit!"
    else
      puts "Inside is now #{@room_is[:content][1]}"
    end
  end

  def clear(monster, loot)
    @room_is[:content] = [:dead_monster, "a dead #{monster}",  loot]
  end
  private

  def get_new_room_number
    $dungeon_room_list.length
  end

  def get_content
#    Roll.item(30, 100)
    [[[FrogLizard, LizardFrog, GiantSpider, Shadeling, Spider, StoneGolem].sample.new, Roll.item(1, 100)].sample]
  end

  def get_size
    dimensions = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 10, 10, 10,
                 10, 10, 15, 15, 15, 20, 20, 40, 50, 75, 100, 200]
    "#{dimensions.sample}'x#{dimensions.sample}'"
  end

  def get_adjetive
    ["well-lit", "dim", "filthy", "suprisingly clean", "round", "muddy",
     "oppressive", "dusty", "slimy"].sample
  end

  def get_room_type
    "room type"
  end
end
