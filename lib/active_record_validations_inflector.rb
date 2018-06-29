require "active_record_validations_inflector/version"
require "active_record_validations_inflector/inflector"

module ActiveRecordValidationsInflector
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.send :extend, ActiveRecordValidationsInflector::Inflector
end
