require "rails_helper"


RSpec.feature "Users can create new products" do 
	scenario "with valid attributes" do 
		visit "/"

		click_link "New Product"

		fill_in "Name", with: "Sample Product"
		fill_in "Description", with: "Sample description"

		click_button "Create Product"

		expect(page).to have_content "Product has been created successfully"
		expect(page).to have_content "Sample Product"
		expect(page).to have_content "Sample description"
	end

	scenario "with invalid attributes" do 

		visit "/"

		click_link "New Product"

		fill_in "Name", with: ""
		fill_in "Description", with: ""

		click_button "Create Product"

		expect(page).to have_content "Product has not been created successfully"
		expect(page).to have_content "Name can't be blank"
	end
end