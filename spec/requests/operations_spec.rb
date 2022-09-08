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

  context 'When testing GET #index' do
    before(:example) { get group_operations_path(@group.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('New transaction')
    end
  end

  context 'When testing GET #show' do
    before(:example) { get group_operation_path(@group.id, @operation.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Back to transactions')
    end
  end

  context 'When testing GET #create' do
    before(:example) { get group_operations_path(@group.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('New transaction')
    end
  end
end
# rubocop:enable Metrics/BlockLength