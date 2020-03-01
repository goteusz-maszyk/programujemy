require 'rails_helper'

describe User do
  describe "validations" do
    let(:user) { FactoryBot.build(:user) }

    it "user without username is not valid" do
      user.username = nil
      expect(user).not_to be_valid
    end

    it "user without email is not valid" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "user without password is not valid" do
      user.password = nil
      expect(user).not_to be_valid
    end
  end
end
