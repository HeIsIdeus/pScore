require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
      first_name: "Clark",
      last_name: "Kent",
      email: "superman@gmail.com",
      password: "bighead1234",
      password_confirmation: "bighead1234"
    }
  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }
    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    before do
      User.create(valid_attributes)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "SUPERMAN@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end
  end

#  it "requires the email address to look like an email" do
#    user.email = "superman"
#    expect(user).to_not be_valid
#  end

    describe "#downcase_email" do
      it "makes the email attribute lower case" do
        user = User.new(valid_attributes.merge(email: "SUPERMAN@GMAIL.COM"))
        expect{ user.downcase_email }.to change{ user.email }.
          from("SUPERMAN@GMAIL.COM").
          to("superman@gmail.com")
      end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "SUPERMAN@GMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("superman@gmail.com")

    end
  end
end
