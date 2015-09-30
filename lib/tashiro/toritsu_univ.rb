require "logger"
require "yaml"
require "pathname"
require "fssm"

class Tashiro::ToritsuUniv
  class << self
    def execute!(f)
      config = YAML::load_file(Pathname.new(f).expand_path.to_s)
      config["path"].each do |dir|
        FSSM.monitor("#{dir}", "**/*.go") do
          update do |base, relative|
            puts "3"
          end
        end
      end
    end
  end
end
