require 'rails_helper'

RSpec.describe 'Group model', type: :request do
  before(:example) do
    @user = User.new(name: 'Tom', email: 'tom@mail.com', password: '123asd')
    @user.password_confirmation = '123asd'
    @user.save
    sign_in(@user)
    @group = Group.create(author_id: @user.id, name: 'Group 1', icon: 'icon_url')
  end

  after(:example) do
    @group.destroy
    @user.destroy
  end

  context 'When name must not be blank' do
    it 'name should be present.' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'name should be valid.' do
      expect(@group).to be_valid
    end
  end

  context 'When icon must not be blank' do
    it 'icon should be present.' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'icon should be valid.' do
      expect(@group).to be_valid
    end
  end
end
