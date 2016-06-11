class Roll

  def self.damage(dmgarray)
    (dmgarray.first).times {rand(1..(dmgarray.last))}
  end

end
