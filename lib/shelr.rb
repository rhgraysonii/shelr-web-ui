module Shelr
  class Wrapper
    def help
      help = IO.popen(['shelr']).read
    end
  end
end
