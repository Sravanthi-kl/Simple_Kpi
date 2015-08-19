class FranchisemastersController < ApplicationController

  def index
    @franchisemasters = Franchisemaster.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render json: @franchisemasters }
	  end
  end

  def new
	  @franchisemaster = Franchisemaster.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @franchisemaster }
      end
  end

  def show
    @franchisemaster = Franchisemaster.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @franchisemaster }
    end
  end

  def create
    @franchisemaster = Franchisemaster.new(params[:franchisemaster])
      respond_to do |format|
        if @franchisemaster.save
          format.html { redirect_to @franchisemaster, notice: 'Franchise successfully added.' }
          format.json { render json: @franchisemaster, status: :created, location: @franchisemaster }
        else
          format.html { render action: "new" }
          format.json { render json: @franchisemaster.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
	  @franchisemaster = Franchisemaster.find(params[:id])
      respond_to do |format|
        if @franchisemaster.update_attributes(params[:franchisemaster])
          format.html { redirect_to @franchisemaster, notice: 'Franchise Details successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @franchisemaster.errors, status: :unprocessable_entity }
        end
      end
    end

  def edit
	  @franchisemaster = Franchisemaster.find(params[:id])
  end


  def destroy
    @franchisemaster = Franchisemaster.find(params[:id])
    @franchisemaster.destroy

      respond_to do |format|
        format.html { redirect_to @franchisemaster }
        format.json { head :no_content }
      end
  end

end
