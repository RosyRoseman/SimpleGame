class HealthPotion < Potion
  def initialize
    @name = "Health Potion"
  end
  def give_effect(target)
    target.HealDmg(10)
    puts "You feel reinvigorated and ready for more combat!"
    sleep(1)
    puts "Drink any more of this and you might just grow an extra limb!"
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
    target.TakeDmg(Roll.damage(@damage))
    puts "*whoosh*"
#    sleep(1)
    puts "He's dead, Jim." unless target.alive?
  end
end

class PoisonPotion < Potion
  def initialize
    @name = "Potion of Poison"
    @damage = [1, 8]
  end
  def give_effect(target)
    target.TakeDmg(Roll.damage(@damage))
    puts "*cough* *cough*"
#    sleep(1)
    puts "He's dead, Jim." unless target.alive?
  end
end

class AcidPotion < Potion
  def initialize
    @name = "Potion of Burning Acid"
    @damage = [2, 4]
  end
  def give_effect(target)
    target.TakeDmg(Roll.damage(@damage))
    puts "It burnssss usss"
#    sleep(1)
    puts "He's dead, Jim." unless target.alive?
  end
end
