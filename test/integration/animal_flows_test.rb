require 'test_helper'

class AnimalFlowsTest < Capybara::Rails::TestCase
  def setup
    @one = animals :one
    @two = animals :two
  end

  test 'animals index' do
    visit animals_path

    assert page.has_content?(@one.name)
    assert page.has_content?(@two.name)
  end

  test 'creating a new animal' do
    visit animals_path

    click_on 'New Animal'

    fill_in 'Name', with: 'Muffin'
    fill_in 'Species',  with: 'Dog'

    click_on 'Create Animal'

    assert_current_path animal_path(Animal.last)
    assert page.has_content?('Muffin')
    assert page.has_content?('Dog')
  end
end
