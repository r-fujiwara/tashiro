require "thor"
require "tashiro/toritsu_univ"

module Tashiro
  class CLI < Thor

    desc "peep", "mini ni tako ga dekita"
    option :file, aliases: "f", required: true
    def peep
      f = options[:file]
      fail unless File.exist?(f)
      Tashiro::ToritsuUniv.execute!(f)
    end
    default_task :peep

  end
end
