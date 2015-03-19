module Shelr
  class Menu
    def help
      IO.popen(['shelr']).read
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
