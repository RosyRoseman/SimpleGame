class Story

  def self.introduction
=begin
      puts "You stand at the entrance to a dungeon."
      sleep(2)
      puts "Inside are monsters..."
      sleep(2)
      puts "...scary monsters..."
      sleep(2)
      puts "...but also treasure..."
      sleep(2)
      puts "...and riches..."
      sleep(2)
      puts "...and glory, wealth, and fame beyond your wildest dreams."
      sleep(2)
=end
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
      Story.say_red("Do you dare enter this dungeon? [y/n]", 0.04)
#      system("say ENTER")
      sleep(0.5)
      puts ""
      while true
      input = Parser.get_input([:yes, :no])
        if input == :yes
          $dungeon = Dungeon.new
          Story.say_blue("Remember to type Help if you ever dont know what to do!", 0.04)
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
    Story.say_red("You step inside the entrance to the dungeon.", 0.04)
  end

  def self.death_message(deceased)
    Story.say_green("The #{deceased.attributes[:name]} is dead, Jim.")
    Story.say_green("Take its #{deceased.attributes[:loot].attributes[:name]}.")
    $player.attributes[:exp] += deceased.attributes[:exp]
  end

  def self.fourohfour
    Story.say_yellow("This functionality hasn't been implimented yet... Sucks dude, we know.", 0.04)
  end

  def self.say_red(string, speed = 0.02)
    array = string.chars
    array.each {|e| print "#{e}".red; sleep(speed)}
    puts ""
  end

  def self.say_green(string, speed = 0.02)
    array = string.chars
    array.each {|e| print "#{e}".green; sleep(speed)}
    puts ""
  end

  def self.say_blue(string, speed = 0.02)
    array = string.chars
    array.each {|e| print "#{e}".blue; sleep(speed)}
    puts ""
  end

  def self.say_yellow(string, speed = 0.02)
    array = string.chars
    array.each {|e| print "#{e}".yellow; sleep(speed)}
    puts ""
  end

  def self.say(string, speed = 0.02)
    array = string.chars
    array.each {|e| print "#{e}"; sleep(speed)}
    puts ""
  end

end
