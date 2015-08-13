require 'rails_helper'

RSpec.describe KpisController, :type => :controller do

   describe "Get #index" do 

   		it "responds sucessfully with an http 200 status code" do
  
        get :index
        
        expect(response).to be_success

    end

   end 		

end
