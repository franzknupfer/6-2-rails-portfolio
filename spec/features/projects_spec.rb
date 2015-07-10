require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the add a project process" do
  it "adds a project to a skill and then edits that project" do
    FactoryGirl.create(:skill)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skills_path
    click_on 'Ember'
    click_link "Add a project"
    fill_in 'Project name', :with => 'Big Tree'
    fill_in 'A short description for specific skill show pages', :with => 'short description'
    fill_in 'A longer description for the project show page', :with => 'long description'
    fill_in 'Add a link to the project', :with => 'link'
    click_on 'Add project'
    click_link 'Edit'
    fill_in "Project name", :with => 'Super Big Tree'
    click_on 'Add project'
    expect(page).to have_content 'Super Big Tree'
  end
end
