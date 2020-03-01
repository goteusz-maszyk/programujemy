require 'rails_helper'

describe UserMailer do
   describe "welcome email" do

     let(:user){ FactoryBot.create :user, password: "test12", password_confirmation: "test12" }
     let(:mail){ UserMailer.welcome_email(user, user.password).deliver_now}

     it "renders the headers" do
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq([""])
     end
  end
end
