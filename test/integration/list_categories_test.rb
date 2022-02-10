require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: 'Bill Williams', email: 'bwilliams@email.com', password: 'password', admin: true)
    sign_in_as(@admin_user)
  end
  
  def setup
    @category = Category.create(name: 'Sports')
    @category2 = Category.create(name: 'Travel')
  end

  test 'should show categories listing' do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
