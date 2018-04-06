require "rails_helper"

RSpec.feature "Users can view products" do 
	scenario "with product details" do 
		product = FactoryBot.create(:product, name: "Sample Product",description: "Sample Description")

		visit "/"

		click_link "Sample Product"
		expect(page.current_url).to eq product_url(product)
	end
end