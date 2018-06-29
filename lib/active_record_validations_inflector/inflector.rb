module ActiveRecordValidationsInflector
  module Inflector
    module LengthValidatorInflector
      def infer_length_validations(attribute, metadata)
        return if metadata.limit.nil? || has_maximum_length_validator_for?(attribute)

        validates attribute, length: { maximum: metadata.limit }
      end

      def has_maximum_length_validator_for?(attribute)
        validators.any? do |validator|
          validator.kind_of?(ActiveRecord::Validations::LengthValidator) &&
          validator.attributes.include?(attribute) &&
          validator.options[:maximum]
        end
      end
    end

    module PresenceValidatorInflector
      def infer_presence_validations(attribute, metadata)
        return if metadata.null || metadata.default || has_presence_validator_for?(attribute)

        validates attribute, presence: true
      end

      def has_presence_validator_for?(attribute)
        validators.any? do |validator|
          validator.kind_of?(ActiveRecord::Validations::PresenceValidator) &&
          validator.attributes.include?(attribute)
        end
      end
    end

    include LengthValidatorInflector
    include PresenceValidatorInflector

    def infer_validators(*validation_types)
      columns_hash.reject{ |column, _| column == primary_key }.each do |key, metadata|
        attribute = key.to_sym

        validation_types.each do |validation_type|
          public_send("infer_#{validation_type}_validations", attribute, metadata)
        end
      end
    end
  end
end
