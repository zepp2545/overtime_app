require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'zepp25458565@gmail.com', password: 'km25458565', password_confirmation: 'km25458565', first_name: 'Konan', last_name: 'Maruyama')
  end 

  describe "creation" do

    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end


  describe "custom name method" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq('MARUYAMA, KONAN')
    end
  end
  
end
