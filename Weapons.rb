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

class Banana < Weapon
  def initialize
    @name = "Banana"
    @weight = 1
    @damage = [2, 8]
  end
end

class PointyStick < Weapon
  def initialize
    @name = "Pointy Sword"
    @weight = 1
    @damage = [1, 2]
  end
end
