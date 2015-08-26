require 'rails_helper'

RSpec.describe KpisController, :type => :controller do

   describe "Get #index" do 

   		it "responds sucessfully with an http 200 status code" do
  
        get :index
        
        expect(response).to be_success
        expect(response).to have_http_status(200)
    end

   end 		

end
