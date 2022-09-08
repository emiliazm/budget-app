require 'rails_helper'

RSpec.describe 'Operation pages', type: :feature do
  before(:example) do
    @user = User.new(name: 'Tom', email: 'tom@mail.com', password: '123asd')
    @user.password_confirmation = '123asd'
    @user.save
    sign_in(@user)
    @group = Group.create(author_id: @user.id, name: 'Group 1', icon: 'icon_url')
    @operation = Operation.create(author_id: @user.id, name: 'Transaction 1', amount: 120)
    @group.operations.push(@operation)
    p @operation
    visit group_operation_path(@group.id, @operation.id)
  end

  after(:example) do
    @operation.destroy
    @group.destroy
    @user.destroy
  end

  context 'When on operation show page' do
    it 'total amount should be showed' do
      expect(page).to have_content('Back to transactions')
    end

    it 'All operations icons should be showed' do
      expect(page).to have_content('$120.00')
    end

    it 'When I click on "Delete this transaction", it should redirects me to that category show page.' do
      click_on 'Delete this transaction'
      expect(page).to have_current_path group_operations_path(@group.id)
    end
  end
end
