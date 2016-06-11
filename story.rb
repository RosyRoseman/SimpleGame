class Story

  def introduction
    puts "You stand at the entrance to a dungeon."
    sleep(2)
    puts "Inside are monsters."
    sleep(2)
    puts "Scary monsters."
    sleep(2)
    puts "Wanna go in?"
    input = Game.get_input([:yes, :no])
  end
end
