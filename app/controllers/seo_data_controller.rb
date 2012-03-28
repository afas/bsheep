class SeoDataController < ApplicationController
  # GET /seo_data
  # GET /seo_data.json
  def index
    @seo_data = SeoDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seo_data }
    end
  end

  # GET /seo_data/1
  # GET /seo_data/1.json
  def show
    @seo_datum = SeoDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seo_datum }
    end
  end

  # GET /seo_data/new
  # GET /seo_data/new.json
  def new
    @seo_datum = SeoDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seo_datum }
    end
  end

  # GET /seo_data/1/edit
  def edit
    @seo_datum = SeoDatum.find(params[:id])
  end

  # POST /seo_data
  # POST /seo_data.json
  def create
    @seo_datum = SeoDatum.new(params[:seo_datum])

    respond_to do |format|
      if @seo_datum.save
        format.html { redirect_to @seo_datum, notice: 'Seo datum was successfully created.' }
        format.json { render json: @seo_datum, status: :created, location: @seo_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @seo_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seo_data/1
  # PUT /seo_data/1.json
  def update
    @seo_datum = SeoDatum.find(params[:id])

    respond_to do |format|
      if @seo_datum.update_attributes(params[:seo_datum])
        format.html { redirect_to @seo_datum, notice: 'Seo datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seo_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seo_data/1
  # DELETE /seo_data/1.json
  def destroy
    @seo_datum = SeoDatum.find(params[:id])
    @seo_datum.destroy

    respond_to do |format|
      format.html { redirect_to seo_data_url }
      format.json { head :no_content }
    end
  end
end
