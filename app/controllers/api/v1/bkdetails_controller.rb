class Api::V1::BkdetailsController < ApplicationController
   respond_to :xml, :json
    
  def create   
    # @business = Business.find(params[:business_id])   
   @kpi = Kpi.find(params[:kpi_id])
   
  
    @bkdetail.businesskpi_id= "1019"
    @bkdetail.targetValue= "800"
    @bkdetail.targetPercentage="11.11"
    @bkdetail.notes= "testkpi"
    @bkdetail = Bkdetail.new(params[:details]) 
        
      if @bkdetail.save        
        render :json => @bkdetail.to_json
      else        
        render :json => {:errors => @bkdetail.errors.full_messages }
      end
  end

end 
  


  
   