class Story

  def self.introduction
#      puts "You stand at the entrance to a dungeon."
#      sleep(2)
#      puts "Inside are monsters."
#      sleep(2)
#      puts "Scary monsters."
#      sleep(2)
      puts "Wanna go get started?"
      while true
      input = Parser.get_input([:yes, :no])
        if input == :yes
          $dungeon = Dungeon.new
          puts "Remember to type Help if you ever dont know what to do!"
          break
        elsif input == :no
          puts "Well alright then, no treasure for you!"
          exit
        else
          puts "Try again."
          puts "#{input}"
          sleep(1)
        end
      end
  end

end
