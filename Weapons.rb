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
    @name = "Pointy Stick"
    @weight = 1
    @damage = [1, 2]
  end
end

class LongSword < Weapon
  def initialize
    @name = "Longsword"
    @weight = 2
    @damage = [1, 8]
  end
end

class Hatchet < Weapon
  def initialize
    @name = "Hatchet"
    @weight = 1
    @damage = [2, 5]
  end
end

class Dagger < Weapon
  def initialize
    @name = "Dagger"
    @weight = 1
    @damage = [1, 4]
  end
end

class Butterknife < Weapon
  def initialize
    @name = "Butter knife"
    @weight = 1
    @damage = [1, 2]
  end
end

class Spear < Weapons
  def initialize
    @name = "Spear"
    @weight = 2
    @damage = [2, 6]
  end
end

class FryingPan < Weapons
  def initialize
    @name = "Frying Pan"
    @weight = 1
    @damage = [2, 3]
  end
end
