require 'pry'

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

    def play_last
      results = []
      IO.popen(['shelr', 'play', 'last']) do |process|
        results << process.read
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

    def play_last
      @menu.play_last
    end
  end
end
