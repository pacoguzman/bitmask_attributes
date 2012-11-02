ActiveSupport.on_load :active_record do
  ActiveRecord::Base.send(:include, BitmaskAttributes)
end