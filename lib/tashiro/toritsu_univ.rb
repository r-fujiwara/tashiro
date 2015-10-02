require "logger"
require "yaml"
require "pathname"
require "fssm"

class Tashiro::ToritsuUniv
  class << self
    def execute!(f)
      config = YAML::load_file(Pathname.new(f).expand_path.to_s)
      config["path"].each do |dir|
        path = Pathname.new(dir).expand_path.to_s
        puts "watching....#{path}"
        FSSM.monitor("#{path}", "*.go") do
          create do |base, relative|
            puts "3"
          end
        end
      end
    end
  end
end
