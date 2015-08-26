class Api::V1::BkdetailsController < ApplicationController
   respond_to :xml, :json
    
  def create   
   @bkdetail= Bkdetail.new(params[:details])
   @kpi=Kpi.find(params[:details][:kpi_id])
   #@businesskpi=BusinessKpi.where("kpi_id = ? and business_id = ? ",@bkdetail.kpi_id,@bkdetail.business_id)       
   @bkpi=BusinessKpi.where(kpi_id: @bkdetail.kpi_id, business_id: @bkdetail.business_id).first
   @bkdetail.businesskpi_id = @bkpi.id
   @bkdetail.targetValue=@kpi.KPITargetValue   
   @bkdetail.targetPercentage=( (@bkdetail.actualValue).to_f / (@bkdetail.targetValue).to_f * 100)-100
   
     if @bkdetail.save        
        render :json => @bkdetail.to_json
      else        
        render :json => {:errors => @bkdetail.errors.full_messages }
      end
    end 
end 
  


  
   