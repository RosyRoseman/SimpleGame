class World

  def initialize
    @current_room = 0
    puts 'World Initialized'
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

end

#####################################################

class Room
  attr_accessor :size, :content, :adjetive, :content_name

  def initialize
    puts "Creating Room..."
    @content           = get_content
    @content_name      = @content.name
    @room_size         = get_size
    @room_adjetive     = get_adjetive
    puts "New room created"
  end

  def get_room_size
    @room_size
  end

  def get_room_adjetive
    @room_adjetive
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




end
