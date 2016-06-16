class Story

  def self.introduction
#      puts "You stand at the entrance to a dungeon."
#      sleep(2)
#      puts "Inside are monsters..."
#      sleep(2)
#      puts "...scary monsters..."
#      sleep(2)
#      puts "...but also treasure..."
#      sleep(2)
#      puts "...and riches..."
#      sleep(2)
#      puts "...and glory, wealth, and fame beyond your wildest dreams."
#      sleep(2)

      puts "Do you dare enter this dungeon?"
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
          puts "Error: invalid entry, seriously, what the hell did you type?"
          puts "You entered: #{input}"
          sleep(1)
        end
      end
  end

end
