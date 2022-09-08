require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Group pages', type: :request do
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

  context 'When testing GET #index' do
    before(:example) { get groups_path(user_id: @user.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Add new category')
    end
  end

  context 'When testing GET #show' do
    before(:example) { get group_path(@user.id, @group.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Delete this category')
    end
  end

  context 'When testing GET #new' do
    before(:example) { get new_group_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'new' template" do
      expect(response).to render_template('new')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('icon')
    end
  end
end
# rubocop:enable Metrics/BlockLength
