require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Operation pages', type: :request do
  before(:example) do
    @user = User.new(name: 'Tom', email: 'tom@mail.com', password: '123asd')
    @user.password_confirmation = '123asd'
    @user.save
    sign_in(@user)
    @group = Group.create(author_id: @user.id, name: 'Group 1', icon: 'icon_url')
    @operation = Operation.create(author_id: @user.id, name: 'Transaction 1', amount: 120)
  end

  after(:example) do
    @operation.destroy
    @group.destroy
    @user.destroy
  end


  context 'When name must not be blank' do
    it 'name should be present.' do
      @operation.name = nil
      expect(@operation).to_not be_valid
    end

    it 'name should be valid.' do
      expect(@operation).to be_valid
    end
  end

  context 'When amount must not be blank' do
    it 'amount should be present.' do
      @operation.amount = nil
      expect(@operation).to_not be_valid
    end

    it 'amount should be valid.' do
      expect(@operation).to be_valid
    end
  end

  context 'When amount must be an integer greater than or equal to zero.' do
    it 'amount should not be valid when negative numbers.' do
      @operation.amount = -1
      expect(@operation).to_not be_valid
    end

    it 'amount should not be valid when null' do
      @operation.amount = nil
      expect(@operation).to_not be_valid
    end

    it 'amount should be valid with numbers greater that or equal to zero' do
      expect(@operation).to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength