require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome" do
    let(:membership) { create(:membership) }
    let(:mail) { UserMailer.welcome(membership) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq([membership.user.email])
      expect(mail.from).to eq(["info@pokerleague.app"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hey friend")
    end
  end
end
