class KpisController < ApplicationController
  
  def index
    @kpis = Kpi.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render json: @kpis }
	   end
  end  
  
  def new
    @kpi = Kpi.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @kpi  }
      end
  end
 
  def show
    @kpi = Kpi.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: kpis}
      end
  end

  def create
    @kpi = Kpi.new(params[:kpi])
      respond_to do |format|
        if @kpi.save
          format.html { redirect_to action:"index", notice: 'Successfully added.' }
          format.json { render json: @kpi, status: :created, location: @kpi }
        else
          format.html { render action: "new" }
          format.json { render json: @kpi.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
	  @kpi = Kpi.find(params[:id])
      respond_to do |format|
        if @kpi.update_attributes(params[:kpi])
          format.html { redirect_to @kpi, notice: 'successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @kpi.errors, status: :unprocessable_entity }
        end
      end
  end

  def edit
	  @kpi = Kpi.find(params[:id])
  end


  def destroy
    @kpi = Kpi.find(params[:id])
    @kpi.destroy
      respond_to do |format|
        format.html { redirect_to @kpi }
        format.json { head :no_content }
      end
  end  
end   











