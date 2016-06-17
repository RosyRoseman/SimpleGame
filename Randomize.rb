class Roll
GARBAGE                 = [Garbage, PointyStick, Butterknife]
COMMON                  = [HealthPotion, Dagger]
UNCOMMON                = [ShortSword, Hatchet, FryingPan]
RARE                    = [FirePotion, LongSword, Spear]

  def self.damage(dmgarray)
    damage = Array.new
    for i in 1..(dmgarray.first) do
      damage << rand(1..(dmgarray.last))
    end
    damage = damage.inject(:+)
  end

  def self.item(low, high)
    found = case rand(low..high)
    when (86..100);          RARE
    when (66..85);           UNCOMMON
    when (41..65);           COMMON
    when (1..40);            GARBAGE
    end
    found.sample
  end

  def self.gold(range)
    change = rand(range[0]..range[1])
    string = "#{change.to_s} #{range[2].to_s}"
    return [string, change, :copper]
  end

  def self.to_hit?(target, source)
    roll = rand(1..20)
    unless target.attributes[:ac] then puts "auto-hit -no ac" and return TRUE end
    if target.attributes[:ac] && roll + source.attributes[:bab] >= target.attributes[:ac]
      return TRUE
    elsif target.attributes[:ac] && roll + source.attributes[:bab] < target.attributes[:ac]
      puts "miss..."
      return FALSE
    else
      puts "auto-hit -else"
      return TRUE
    end
  end
end
