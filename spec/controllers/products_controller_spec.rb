require 'rails_helper'

RSpec.describe ProductsController,type: :controller do 
	it"handles a missing product correctly" do
		get :show, params: {id: "not-here"}

		expect(response).to redirect_to(products_path)

		message = "The product you were looking for could not be found"
		expect(flash[:alert]).to eq message
	end
end