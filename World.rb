class World

  def initialize
    puts 'World Initialized'
  end

end

#######################################################
class Dungeon

  def initialize
    @current_room = 0
    puts "Dungeon Initialized."
    puts "Set player flag to 'in dungeon'"
    enter_dungeon
    $dungeon_room_list  = [Room.new]
  end

  def enter_dungeon
    set_current_room_to(1)
    puts "You are standing at the entrance of the dungeon"
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
    @room_is           = {size: get_size, adjetive: get_adjetive, type: room_type,
                          content: get_content, room_number: get_room_number}
    puts "New room created"
  end

  def get_room_is
    @room_is
  end

  private
  def get_content
    [Monster, HealthPotion].sample.new
  end

  def get_size
    dimensions = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 10, 10, 10,
                 10, 10, 15, 15, 15, 20, 20, 40, 50, 75, 100, 200]
    "#{dimensions.sample}'x#{dimensions.sample}'"
  end

  def get_adjetive
    ["well-lit", "dim", "filthy", "suprisingly clean", "round", "muddy",
     "oppressive"].sample
  end

  def room_type
    "room type"
  end


end
