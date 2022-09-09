require 'rails_helper'

RSpec.describe 'Group model', type: :feature do
  before(:example) do
    @user = User.new(name: 'Tom', email: 'tom@mail.com', password: '123asd')
    @user.password_confirmation = '123asd'
    @user.save
    sign_in(@user)
    @group = Group.create(author_id: @user.id, name: 'Group 1', icon: 'icon_url')
    visit groups_path
  end

  after(:example) do
    @group.destroy
    @user.destroy
  end

  context 'When on group index page' do
    it 'All groups names should be showed' do
      expect(page).to have_content('Group 1')
    end

    it 'All groups icons should be showed' do
      expect(page).to have_content('icon_url')
    end

    it 'When I click on "Show this category", it should redirects me to that category show page.' do
      click_on 'Show this category'
      expect(page).to have_current_path group_path(@group.id)
    end
  end
end
