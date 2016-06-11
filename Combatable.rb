module Combatable

  def Combatable.included(mod)
    attr_accessor :HP, :WepDmg
  end

  def initialize_stats(stats)
    @stats = stats

    @HP               = stats[:maxHP]
    @WepDmg           = stats[:WepDmg]
  end

  def alive?
    @HP > 0
  end

  def hp
    @HP
  end

  def TakeDmg(amount)
    @HP -= amount
  end

  def HealDmg(amount)
    @HP += amount
    @HP = [@HP, @stats[:maxHP]].min
  end
end
