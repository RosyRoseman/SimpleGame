class TreasureRoom < Room
  def initialize
      @contents                 = Roll.item
      @attributes = {
        size:                   "10' X 15'",
        adjetive:               "well-kept",
        content:                @contents,
        loot:                   @contents,
        room_number:            $player.attributes[:room] +1
      }
  end
  def self.commonality
    8
  end
end

class MonsterDen < Room
    def initialize
      @contents                 = Roll.monster
      @attributes = {
        size:                   "20' X 25'",
        adjetive:               "filthy",
        content:                @contents,
        loot:                   @contents.attributes[:loot],
        room_number:            $player.attributes[:room] +1
      }
  end
  def self.commonality
    20
  end
end


=begin
def initialize
    @attributes = {
      size:                   ,
      adjetive:               ,
      content:                ,
      room_number:            @player.attributes[:room] +1
    }
end

=end
