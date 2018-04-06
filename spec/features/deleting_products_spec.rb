require "rails_helper"

RSpec.feature "User can delete products" do 
	scenario "successfully" do 
		FactoryBot.create(:product,name: "product",description: "desc")

		visit "/"

		click_link "product"
		click_link "Delete Product"

		expect(page).to have_content "Product has been deleted"
		expect(page.current_url).to eq products_url
		expect(page).to have_no_content "product"
	end
end