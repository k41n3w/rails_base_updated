# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it do
    should validate_length_of(:password).is_at_least(6).on(:create)
  end

  describe '#email' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    context 'with valid e-mail' do
      let!(:user) { create(:user, email: 'valid@email.com') }

      it 'return a valid object' do
        expect(user).to be_valid
      end
    end

    context 'with invalid e-mail' do
      let!(:user) { build(:user, email: 'valid') }

      it 'return a invalid object' do
        expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email is invalid')
      end
    end
  end
end
