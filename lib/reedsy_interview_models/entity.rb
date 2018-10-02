module ReedsyInterviewModels
  module Entity
    attr_accessor :id

    def self.included(base)
      base.extend ClassMethods
    end

    def initialize(attributes={})
      attributes.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    module ClassMethods
      def attributes(*args)
        attr_accessor(*args)
      end
    end
  end
end
