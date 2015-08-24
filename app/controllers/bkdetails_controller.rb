class BkdetailsController < ApplicationController

	def index
     @bks = Bkdetail.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render json: @bks }
      end
  end   

  def new
    @business = Business.find(params[:business_id])   
    @kpi = Kpi.find(params[:kpi_id])
    @bkpi = BusinessKpi.find(params[:businesskpi_id])
    @bks = Bkdetail.where("kpi_id = ? and business_id = ? and businesskpi_id =? ",@kpi.id,@business.id,@bkpi.id)    
    @bkdetail = Bkdetail.new
    
    respond_to do |format|
        format.html # new.html.erb
        format.json { render :text => @bkdetail.to_json }
    end
  end
    
  def show
    @bkdetail = Bkdetail.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @bkdetail}
      end
  end

  def create   
    @bkdetail = Bkdetail.new(params[:bkdetail])     
    @bks = Bkdetail.where("kpi_id = ? and business_id = ? and businesskpi_id =? ",@bkdetail.kpi_id,@bkdetail.business_id,@bkdetail.businesskpi_id)        
    @business = Business.find(@bkdetail.business_id)       
    @bkpi = BusinessKpi.find(@bkdetail.businesskpi_id)
    @kpi = Kpi.find(@bkdetail.kpi_id)
    
    respond_to do |format|
      if @bkdetail.save
        format.html { redirect_to action:"index", notice: 'Successfully added.' }
        format.json { render json: @bkdetail, status: :created, location: @bkdetail }
      else
        format.html { render action: "new" }
        format.json { render json: @bkdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bkdetail = Bkdetail.find(params[:id])
      respond_to do |format|
        if @bkdetail.update_attributes(params[:bkdetail])
          format.html { redirect_to @bkdetail, notice: 'successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @bkdetail.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
    @bkdetail = Bkdetail.find(params[:id])
    @kpi = Kpi.find(@bkdetail.kpi_id) 
    @business = Business.find(@bkdetail.business_id)
    @bkpi = BusinessKpi.find(@bkdetail.businesskpi_id)  
  end

  def destroy
    @bkdetail = Bkdetail.find(params[:id])
    @bkdetail.destroy
      respond_to do |format|
        format.html { redirect_to @bkdetail }
        format.json { head :no_content }
      end
  end 

  def get_target_percentage
    actual_value = params[:actual_value]
    target_value = params[:target_value]
    percet =( (actual_value).to_f / (target_value).to_f * 100)-100
    render :text => percet
  end
  
  def dataEntry    
    freq = params[:KPIEntryPeriod] || "DAILY"
    @business = Business.find(params[:business_id]) 
    @mapped_kpi_ids = BusinessKpi.where(:business_id => @business.id,:kpi_id => Kpi.where(:KPIEntryPeriod => freq))
    @bkpi=BusinessKpi.new      
    respond_to do |format|
      format.html
      format.js
    end
end 

  def dataFeed
    @business = Business.find(params[:business_id])    
    @mapped_kpi_ids = BusinessKpi.where(:business_id => @business.id)    
  end  

end
