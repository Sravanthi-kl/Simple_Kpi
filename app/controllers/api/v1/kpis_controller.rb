class Api::V1::KpisController < ApplicationController

  respond_to :xml, :json
    
  def create
    
    @kpi= Kpi.new
    @kpi.KPIName = params[:kpi_data][:KPIName]
    @kpi.KPIEntryPeriod = params[:kpi_data][:KPIEntryPeriod]
    @kpi.KPICategory = params[:kpi_data][:KPICategory]
    @businesskpi = BusinessKpi.new
    if Kpi.exists?(KPIName: @kpi.KPIName)
      @businesskpi.business_id = params[:kpi_data][:BusinessID] 
      @businesskpi.kpi_id = @kpi.id

    else      
    @kpi.KPIDirection ="None"  
    @kpi.KPIUnitName="1,234"
    @kpi.KPITargetValue=900
    if @kpi.save
      @businesskpi.business_id = params[:kpi_data][:BusinessID]   
      @businesskpi.kpi_id = @kpi.id
          else
       render :json => {:errors => @kpi.errors.full_messages }
       end
    end 


    if @businesskpi.save
       render :json => @businesskpi.to_json
     else
       render :json => {:errors => @businesskpi.errors.full_messages }
       end  
  end 

end 