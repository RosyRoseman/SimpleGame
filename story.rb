class Story

  def introduction
    while true
      puts "You stand at the entrance to a dungeon."
#      sleep(2)
      puts "Inside are monsters."
#      sleep(2)
      puts "Scary monsters."
#      sleep(2)
      puts "Wanna go in?"
      input = Game.get_input([:yes, :no])
        if input == :yes
          $dungeon = Dungeon.new
          puts "Remember to type Help if you ever dont know what to do!"
          break
        else
          puts "Well alright then, no treasure for you!"
          exit
        end
      end
  end

  def help
    puts "Type look, forward, backward, attack, loot, or inventory"
  end

end
