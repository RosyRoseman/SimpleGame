class Bludgeon < Weapon

def initialize
  @name = "Bludgeon"
  @weight = 1
  @damage = [1, 6]
end
end
class ShortSword < Weapon
  def initialize
    @name = "Short Sword"
    @weight = 1
    @damage = [2, 4]
  end
end
