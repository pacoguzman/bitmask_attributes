module BitmaskAttributes
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'bitmask_attributes.insert_into_active_record' do |app|
      ActiveSupport.on_load :active_record do
        BitmaskAttributes::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      if defined?(ActiveRecord)
        ActiveRecord::Base.send(:include, BitmaskAttributes)
      end
    end
  end
end