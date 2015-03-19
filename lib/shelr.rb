module Shelr
  class Wrapper
    def help
      IO.popen(['shelr', '--help'])
    end
  end
end
