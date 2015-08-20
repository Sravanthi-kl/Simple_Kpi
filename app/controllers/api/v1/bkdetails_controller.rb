class Api::V1::BkdetailsController < ApplicationController
   respond_to :xml, :json
    
  def create   
    # @business = Business.find(params[:business_id])   
    
   #@kpi = Kpi.find(params[:details][:kpi_id]) 
   @bkdetail.kpi_id= Bkdetail.find(params[:details][:kpi_id])
   @bkdetail.branch_id= Bkdetail.find(params[:details][:branch_id])
   @bkdetail.logDate= Bkdetail.find(params[:details][:logDate])



     if @bkdetail.save        
        render :json => @bkdetail.to_json
      else        
        render :json => {:errors => @bkdetail.errors.full_messages }
      end
  end

end 
  


  
   