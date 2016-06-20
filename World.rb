#Must add Roll.room
class Dungeon

  def initialize
    $dungeon_map = [Roll.room]
    enter_dungeon
  end

  def enter_dungeon
    Story.enter_dungeon
    move_player(0)
  end

  def forward
#    if Monster === $player.attributes[:location][:content] && $player.attributes[:location][:content].alive?
#      puts "You can't just jetpack away from your problems, Brian!"
    if $player.attributes[:location] == $dungeon_map.last
      $dungeon_map << Roll.room
      move_player(:forward)
    else
      move_player(:forward)
    end
  end

  def backward
    if $player.attributes[:location] == $dungeon_map.first
      Story.leave_dungeon
      $player.attributes[:location] = :dungeon_entrance
    else
      move_player(:backward)
    end
  end

  def move_player(arg)
      case arg
      when :forward
        $player.attributes[:room] +=1
      when :backward
        $player.attributes[:room] -=1
      when Integer
        $player.attributes[:room] = arg
      end
      $player.attributes[:location] = $dungeon_map[$player.attributes[:room]]
  end
end
###############################################################################
class Room
  attr_accessor :attributes
  def attributes
    @attributes
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def status
    content = @attributes[:content]
    Story.say("You are in room number #{@attributes[:room_number]}.")
    Story.say("You are in a #{@attributes[:adjetive]} room, that is roughly #{@attributes[:size]}.")
    if Monster === content && content.alive? || Item === content
      Story.say("Inside you see a #{content.attributes[:name]}.")
    elsif Monster === content && !content.alive?
      Story.say("Inside you see a dead #{content.attributes[:name]}.")
    else
      Story.say("Look, I'm gonna level with you here, we have no clue what this #{content} is.")
    end
  end

  def loot
    if Item === @attributes[:content] || !@attributes[:content].alive?
      if @attributes[:loot] == :gone
        Story.say("You have already looted this room. Stupid.")
      elsif @attributes[:loot]
         $player.attributes[:inventory].add(@attributes[:loot])
         Story.say("You take the #{@attributes[:loot].attributes[:name]}")
         @attributes[:loot] = :gone
      else Story.say("Error: What the Fuck?")
      end
    else
      Story.say("Maybe try killing the monster before you take its stuff...")
    end
  end
end
