module AttributeValidatorFinder
  def validators_for(attribute)
    validators.select{ |validator| validator.attributes.include?(attribute) }
  end
end

class Post < ActiveRecord::Base
  infer_validators :presence, :length

  extend AttributeValidatorFinder
end

class Contact < ActiveRecord::Base
  extend AttributeValidatorFinder

  class << self
    def infer_email_validations(attribute, metadata)
      validates attribute, email: true if attribute.to_s.end_with?("email")
    end

    def infer_phone_validations(attribute, metadata)
      validates attribute, phone: true if attribute.to_s.end_with?("phone")
    end
  end

  infer_validators :email, :phone

  validates :name, presence: true
  validates :name, length: { minimum: 10, maximum: 32 }
end
