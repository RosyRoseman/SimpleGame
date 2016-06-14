class HealthPotion < Potion
  def initialize
    @name = "Health Potion"
  end
  def give_effect(target)
    target.HealDmg(10)
    #remove from inventory
  end
end
#######################################################
class FirePotion < Potion
  def initialize
    @name = "Potion of Liquid Fire"
  end
  def give_effect(target)
    target.TakeDmg(10)
  end
end
