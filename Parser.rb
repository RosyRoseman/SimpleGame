class Parser
  PERM_OPT        = [:quit, :help, :game_info, :cancel]
  TAKE            = [:take, :loot, :t, :grab, :pick_up]
  INVENTORY       = [:inventory, :i]
  LOOK            = [:look, :l, :loo, :ook, :look_around]
  ATTACK          = [:attack, :a, :attack, :atack, :attac, :attak, :atac, :atak]
  RUN             = [:run, :r, :ru, :un]
  STATUS          = [:status, :stat, :stats]
  USE_ITEM        = [:use_item, :use, :u, :item]
  FORWARD         = [:forward, :f]
  BACKWARD        = [:backward, :b]
  QUIT            = [:quit, :exit, :esc, :end, :q]
  HELP            = [:help, :h]
  GAME_INFO       = [:game_info, :info, :gi]
  YES             = [:yes, :y, :ye, :es, :yeah, :yeha]
  NO              = [:no, :n,]
  ALL             = [YES, NO, GAME_INFO, HELP, QUIT, BACKWARD, FORWARD, USE_ITEM,
                    STATUS, RUN, ATTACK, LOOK, INVENTORY, TAKE]
# Single letters already taken a, b, f, h, i, l, n, q, r, t, u
 def self.get_specific(options)
   input = :nil
   until options.include? input
     print ">>"
     input = gets.chomp.tr(" ", "_").downcase.to_sym
     unless options.include? input
       unless PERM_OPT.include? input
         puts "That command wont work here... #{input} #{options}"
       end
     end
     breakout_commands(input, options)
     if :break; break end
   end
   return input
 end



  def  self.get_input(options)
    parse = :nil
    until options.include? parse
      print ">>"
      input = gets.chomp.downcase.tr(" ", "_").to_sym
      parse = sort(input)
      unless options.include? parse
        unless PERM_OPT.include? parse
          puts "That command wont work here..."
        end
      end
      breakout_commands(parse, options)
    end
    return @parse
  end

  def self.sort(input)
    ALL.each do |x|
      if x.include? input
        #puts "Found #{x.first}!"
        @parse = x.first
      end
    end
    @parse
  end

  def self.breakout_commands(input, options)
    case input
    when :quit
      exit
    when :game_info
      puts "#{Story.game_info}"
    when :help
      puts "The game is looking for one of these commands right now: #{options}"
      puts "If this doesn't help, try our wiki! 'wiki wiki wak'..."
    when :cancel
      return :break
    end
  end

end
