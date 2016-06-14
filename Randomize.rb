class Roll
GARBAGE                 = [Garbage]
COMMON                  = [HealthPotion]
RARE                    = [FirePotion, ShortSword]

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
    when (51..85);           COMMON
    when (1..50);            GARBAGE
    end
    found.sample.new
  end

  def self.gold(range)
    change = rand(range[0]..range[1])
    string = "#{change.to_s} #{:copper.to_s}"
    return [string, change, :copper]
  end

  def self.to_hit?(target, source)
    roll = rand(1..20)
    if target.ac && roll + source.bonus_to_hit > target.ac
      return TRUE
    elsif target.ac && roll + source.bonus_to_hit >= target.ac
      puts "miss..."
      return FALSE
    else
      puts "auto-hit"
      return TRUE
    end
  end
end
