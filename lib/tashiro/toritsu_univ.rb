require "logger"
require "yaml"
require "pathname"

class Tashiro::ToritsuUniv
  class << self
    def execute!(f)
      config = YAML.load(Pathname.new(f).expand_path.to_s)
      config["path"].each do |dir|
        module_eval do <<-EOS
            FSSM.monitor("#{dir}", "**/*.go") do
              update do |base, relative|
                puts "3"
              end
            end
          EOS
        end
      end
    end
  end
end
