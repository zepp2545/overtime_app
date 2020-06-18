require 'rails_helper'

RSpec.describe User, type: :model do

  describe "creation" do
    before do
      @user = User.create(email: 'zepp25458565@gmail.com', password: 'km25458565', password_confirmation: 'km25458565', first_name: 'Akio', last_name: 'Maruyo')
    end 

    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end
  







end
