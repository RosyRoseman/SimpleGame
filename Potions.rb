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
    @damage = [3, 4]
  end
  def give_effect(target)
    target.TakeDmg(@damage)
  end
end
