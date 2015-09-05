require 'test_helper'

class UserCanCreatePractice < Capybara::Rails::TestCase
  def test_render_top
    visit root_path
    assert page.has_content?('Maintained by highwide & ta1kt0me')
  end
end
