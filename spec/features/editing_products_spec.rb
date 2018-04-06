require "rails_helper"

RSpec.feature "Users can edit exisiting products" do 
	scenario "with valid attributes" do
		FactoryBot.create(:product,name: "Sample Product",description: "Sample")

		visit "/" 

		click_link "Sample Product"
		click_link "Edit Product"

		fill_in "Name",with: "Sampel Product"

		click_button "Update Product"

		expect(page).to have_content "Product has been updated sucessfully"
		expect(page).to have_content "Sampel Product"

	end

	scenario "with invalid attributes" do 
		FactoryBot.create(:product,name: "Sample Product",description: "Sample")


		visit "/"

		click_link "Sample Product"
		click_link "Edit Product"

		fill_in "Name", with: ""

		click_button "Update Product"

		expect(page).to have_content "Product has not been updated"
	end
end
