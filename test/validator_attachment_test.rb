require 'test_helper'

class ValidatorAttachmentTest < ActiveSupport::TestCase

  class SampleModel
    include ActiveModel::Validations
    include ActiveRecord::Validations

    validates :acceptance_attr_1, :acceptance => true
    validates :acceptance_attr_2, :acceptance => { :allow_nil => true }
    validates :acceptance_attr_3, :acceptance => { :allow_nil => false }
    validates :acceptance_attr_4, :acceptance => { :accept => 'sure' }
    validates :acceptance_attr_5, :acceptance => { :allow_nil => true, :accept => 'sure' }

    validates :email_1, :confirmation => true
    validates :email_2, :confirmation => true, :presence => true

    validates :exclusion_1, :exclusion => { :in => %w(ab cd ef), :message => 'not allowed' }

    validates :legacy_code, :format => { :with => /^a.+\d$/, :message => 'wrong format' }

    validates :size, :inclusion => { :in => %w(small medium large),
                                     :message => "%{value} is not a valid size" }

    validates :name,                :length => { :minimum => 2 }
    validates :bio,                 :length => { :maximum => 500 }
    validates :password,            :length => { :in => 6..20 }
    validates :registration_number, :length => { :is => 6 }
    validates :account_number,      :length => { :minimum => 2, :maximum => 6, :wrong_length => 'wrong length, please try again' }
    validates :student_id,          :length => { :maximum => 10, :too_long => 'sorry, too long', :too_short => 'sorry, too short' }
    validates :mama_telephone,      :length => { :is => 8 }

    validates :points, :numericality => true
    validates :games_played, :numericality => { :only_integer => true }
    validates :num_1, :numericality => { :greater_than => 1 }
    validates :num_2, :numericality => { :greater_than_or_equal_to => 2 }
    validates :num_3, :numericality => { :equal_to => 3 }
    validates :num_4, :numericality => { :less_than => 4 }
    validates :num_5, :numericality => { :less_than_or_equal_to => 5 }
    validates :num_6, :numericality => { :odd => true }
    validates :num_7, :numericality => { :even => true }

    validates :identity_number, :uniqueness => true
    validates :identity_number_1, :uniqueness => { :scope => :num_7 }
    validates :identity_number_2, :uniqueness => { :case_sensitive => true}

    validates :num_8, :presence => true, :if => :paid_with_card?

    with_options :if => :is_admin? do |admin|
      admin.validates :num_9, :length => { :minimum => 10 }
      admin.validates :num_10, :presence => true
    end

    validates :my_facebook_email, :presence => true, :dummy => true

    def persisted?
      false
    end

  end

  test "validator attachment" do
    assert ActiveModel::EachValidator.respond_to?(:is_attached?)
    assert ActiveModel::EachValidator.respond_to?(:attached?)
  end

  test "acceptance validator" do
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_1)
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_2, {:allow_nil => true})
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_3, {:allow_nil => false})
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_4, {:accept => 'sure'})
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_5, {:accept => 'sure'})
    assert !ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_5, {:accept => 'sure'}, true)
    assert ActiveModel::Validations::AcceptanceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_5, {:accept => 'sure', :allow_nil => true}, true)
  end

  test "confirmation validator" do
    assert ActiveModel::Validations::ConfirmationValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :email_1)
    assert !ActiveModel::Validations::ConfirmationValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :acceptance_attr_1)
    assert ActiveModel::Validations::ConfirmationValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :email_2)
  end

  test "presence validator" do
    assert ActiveModel::Validations::PresenceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :email_2)
    assert ActiveModel::Validations::PresenceValidator.attached?(ValidatorAttachmentTest::SampleModel, :email_2)
  end

  test "exclusion validator" do
    assert !ActiveModel::Validations::ExclusionValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :email_2)
    assert ActiveModel::Validations::ExclusionValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :exclusion_1, {:in => %w(ab cd ef)})
    assert !ActiveModel::Validations::ExclusionValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :exclusion_1, {:in => %w(ab cd ef gh)})
  end

  test "format validator" do
    assert ActiveModel::Validations::FormatValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :legacy_code)
    assert ActiveModel::Validations::FormatValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :legacy_code, {:message => 'wrong format'})
    assert ActiveModel::Validations::FormatValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :legacy_code, {:with => /^a.+\d$/})
    assert ActiveModel::Validations::FormatValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :legacy_code, {:message => 'wrong format', :with => /^a.+\d$/})
    assert !ActiveModel::Validations::FormatValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :legacy_code, {:with => /^a.+$/})
  end

  test "inclusion validator" do
    assert ActiveModel::Validations::InclusionValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :size, {:in => %w(small medium large)})
    assert ActiveModel::Validations::InclusionValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :size, {:message => "%{value} is not a valid size"})
  end

  test "length validator" do
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :name)
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :name, {:minimum => 2})
    assert !ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :name, {:maximum => 2})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :bio, {:maximum => 500})
    # watch out how :in has been interpreted to :minimum .. :maximum
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :password, {:minimum => 6})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :password, {:maximum => 20})
    assert !ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :registration_number, {:is => 2})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :registration_number, {:is => 6})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :account_number, {:wrong_length => 'wrong length, please try again', :minimum => 2})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :student_id, {:too_long => 'sorry, too long', :maximum => 10})
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :mama_telephone, {:is => 8})
  end

  test "numericality" do
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :points)
    assert !ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :points, { :only_integer => true })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :games_played, { :only_integer => true })

    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_1, { :greater_than => 1 })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_2, { :greater_than_or_equal_to => 2 })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_3, { :equal_to => 3 })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_4, { :less_than => 4 })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_5, { :less_than_or_equal_to => 5 })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_6, { :odd => true })
    assert ActiveModel::Validations::NumericalityValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_7, { :even => true })
  end

  test "uniqueness" do
    assert ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number)
    assert ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number_1)
    assert !ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number_1, { :scope => :num_1 })
    assert ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number_1, { :scope => :num_7 })
    assert ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number_2)
    assert ActiveRecord::Validations::UniquenessValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :identity_number_2, { :case_sensitive => true})
  end

  test "conditional validation" do
    assert ActiveModel::Validations::PresenceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_8, { :if => :paid_with_card? })
    assert ActiveModel::Validations::LengthValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_9, { :minimum => 10, :if => :is_admin? })
    assert ActiveModel::Validations::PresenceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :num_10, { :if => :is_admin? })
  end

  test "custom validator" do
    assert DummyValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :my_facebook_email)
    assert ActiveModel::Validations::PresenceValidator.is_attached?(ValidatorAttachmentTest::SampleModel, :my_facebook_email)
  end
end
