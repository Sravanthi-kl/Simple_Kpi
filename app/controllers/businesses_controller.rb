class BusinessesController < ApplicationController

	def index
	  @businesses = Business.all
    	respond_to do |format|
      	format.html # index.html.erb
      	format.xml  { render json: @businesses }
  	  end
  end

  def new
	  @business = Business.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @business }
      end
  end

  def show
    @business = Business.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @business }
      end
  end

  def create
    @business = Business.new(params[:business])
      respond_to do |format|
        if @business.save
          format.html { redirect_to @business, notice: 'Branch successfully added.' }
          format.json { render json: @business, status: :created, location: @business }
        else
          format.html { render action: "new" }
          format.json { render json: @business.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    @business = Business.find(params[:id])
      respond_to do |format|
        if @business.update_attributes(params[:business])
          format.html { redirect_to @business, notice: 'Branch Details successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @business.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
    @business = Business.find(params[:id])
  end


  def destroy
    @business = Business.find(params[:id])
    @business.destroy
      respond_to do |format|
        format.html { redirect_to @business }
        format.json { head :no_content }
      end
  end

  def businesslinkkpi
  @businesskpi = BusinessKpi.new
  @business = Business.find(params[:business_id])
  @mapped_kpi_ids = BusinessKpi.where(:business_id => @business.id).pluck('kpi_id')
  @kpi = Kpi.all
    respond_to do |format|
    format.html # index.html.erb
    format.xml  { render json: @businesskpi }
    end
  end  

  def savelinkkpi  
    @business = Business.find(params[:business_id])    
    BusinessKpi.where(:business_id => @business.id).destroy_all
    add_kpi_ids= params[:kpi_ids]
    add_kpi_ids.each do |kpi_id|
      bk=BusinessKpi.new
      bk.kpi_id = kpi_id.to_i
      bk.business_id = params[:business_id].to_i
      bk.save
    end   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render json: @businesskpi }
    end
  end

end
