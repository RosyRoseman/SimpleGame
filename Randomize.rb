class Roll

  def self.room
    @choice = Array.new
    Room.descendants.each do |x|
        do_times = x.commonality
        do_times.times {@choice << x}
    end
    @choice.sample.new
  end

  def self.initiative(enemy)
    enemy.attributes[:initiative] = 0
    $player.attributes[:initiative] = 1
  end

  def self.damage(dmgarray)
    damage = Array.new
    for i in 1..(dmgarray.first) do
      damage << rand(1..(dmgarray.last))
    end
    damage = damage.inject(:+)
  end

  def self.to_hit?(target, source)
    puts "#{source.attributes[:name]} is attacking #{target.attributes[:name]}"
    roll = rand(1..20)
    unless target.attributes[:ac] then puts "auto-hit -no ac" and return TRUE end
    if target.attributes[:ac] && roll + source.attributes[:bab] >= target.attributes[:ac]
      puts "#{source.attributes[:name]} hits!"
      return TRUE
    elsif target.attributes[:ac] && roll + source.attributes[:bab] < target.attributes[:ac]
      puts "#{source.attributes[:name]} misses..."
      return FALSE
    else
      puts "auto-hit -else"
      return TRUE
    end
  end

  def self.item
    @choice = []
    Item.descendants.each do |x|
      if x.respond_to?(:primary)
        do_times = x.new.attributes[:commonality]
        do_times.times {@choice << x}
      end
    end
    @choice.sample.new
  end

  def self.monster
    @choice = []
    Monster.descendants.each do |x|
        do_times = x.commonality
        do_times.times {@choice << x}
    end
    @choice.sample.new
  end

end
