class Api::V1::KpisController < ApplicationController

  respond_to :xml, :json
    
  def create
    @kpi = Kpi.new(params[:kpi_data])  
    @businesskpi = BusinessKpi.new(params[:kpi_data])       
        if @kpi.save
          render :json => @kpi.to_json
          else
          render :json => {:errors => @kpi.errors.full_messages }
        end
  end  
end 