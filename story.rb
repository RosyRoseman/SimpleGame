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
=begin
      100.times do
        string = []
        100.times {string << [0, 1].sample}
        puts "#{string.join.to_s}"
        sleep(0.01)
      end
=end
      system("clear")
      sleep(0.75)
      Story.say_slow("Do you dare enter this dungeon?")
      sleep(0.5)
      puts ""
      while true
      input = Parser.get_input([:yes, :no])
        if input == :yes
          $dungeon = Dungeon.new
          Story.say_slow("Remember to type Help if you ever dont know what to do!")
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

  def self.enter_dungeon
    Story.say_slow("You step inside the entrance to the dungeon.")
  end

  def self.death_message(deceased)
    Story.say("The #{deceased.attributes[:name]} is dead, Jim.")
    Story.say("Take its #{deceased.attributes[:loot].attributes[:name]}.")
  end

  def self.fourohfour
    Story.say("This functionality hasn't been implimented yet... Sucks dude, we know.")
  end

  def self.say_slow(string)
    array = string.chars
    array.each {|e| print "#{e}"; sleep(0.04)}
    puts ""
  end

  def self.say(string)
    array = string.chars
    array.each {|e| print "#{e}"; sleep(0.02)}
    puts ""
  end
end
