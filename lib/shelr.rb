module Shelr
  def self.wrapper(*args)
    Wrapper.new 
  end
  class Menu
    def help
      IO.popen(['shelr']) do |process|
        process.read
      end
    end
  end

  class Wrapper
    def initialize
      @menu = Menu.new
    end

    def help
      @menu.help
    end
  end
end
