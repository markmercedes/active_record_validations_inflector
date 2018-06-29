RSpec.describe ActiveRecordValidationsInflector do
  describe "Inflect default supported validators [:presence, :length]" do
    describe Post do
      it "generates validators inferring column definition"  do
        expect(described_class.validators.count).to eq(6)
      end

      describe "attributes with default value" do
        it "inflects no validators" do
          expect(described_class.validators_for(:published)).to be_empty
        end
      end

      describe "attributes with a maximum length defined and presence required" do
        it "inflects a maximum length validator and a required presence validator" do
          expect(described_class.validators_for(:impressions).map(&:class)).to eq([ActiveRecord::Validations::PresenceValidator, ActiveRecord::Validations::LengthValidator])
        end
      end
    end
  end

  describe "Inflect custom validators [:email, :phone]" do
    describe Contact do
      it "generates validators inferring column definition"  do
        expect(described_class.validators.count).to eq(6)
      end
    end
  end
end
