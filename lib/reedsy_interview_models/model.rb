module ReedsyInterviewModels
  module Model
    
    def self.[](name)
      @mapper[name]
    end

    def self.mapper(mapper = nil)
      if mapper
        @mapper = mapper
      else
        @mapper
      end
    end
  end
end
