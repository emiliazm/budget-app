require 'rails_helper'

RSpec.describe 'Operation pages', type: :feature do
  before(:example) do
    @user = User.new(name: 'Tom', email: 'tom@mail.com', password: '123asd')
    @user.password_confirmation = '123asd'
    @user.save
    sign_in(@user)
    @group = Group.create(author_id: @user.id, name: 'Group 1', icon: 'icon_url')
    @operation = Operation.create(author_id: @user.id, name: 'Transaction 1', amount: 120.00)
    visit group_operations_path(@group.id)
  end

  after(:example) do
    @operation.destroy
    @group.destroy
    @user.destroy
  end

  context 'When on operation index page' do
    it 'total amount should be showed' do
      expect(page).to have_content('Total amount:')
    end

    it 'All operations amount should be showed' do
      expect(page).to have_content('$0.00')
    end

    it 'When I click on "New transaction", it should redirects me to that category show page.' do
      click_on 'New transaction'
      expect(page).to have_current_path new_group_operation_path(@group.id)
    end
  end
end
