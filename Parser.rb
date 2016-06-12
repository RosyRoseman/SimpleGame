class Parser
  PERM_OPT        = [:quit, :help, :game_info]
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
  YES             = [:yes, :y, :ye, :es, :yeah]
  NO              = [:no, :n,]
  ALL             = [YES, NO, GAME_INFO, HELP, QUIT, BACKWARD, FORWARD, USE_ITEM,
                    STATUS, RUN, ATTACK, LOOK]

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
      case parse
      when :quit
        exit
      when :game_info
        puts "#{Story.game_info}"
      when :help
        puts "The game is looking for one of these commands right now: #{options}"
        puts "If this doesn't help, try our wiki! 'wiki wiki wak'..."
      end
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



end
