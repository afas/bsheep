class TopLevelsController < ApplicationController
  # GET /top_levels
  # GET /top_levels.json
  def index
    @top_levels = TopLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @top_levels }
    end
  end

  # GET /top_levels/1
  # GET /top_levels/1.json
  def show

    if params[:short_url].nil?
      @top_level = TopLevel.find(params[:id])
    else
      @top_level = TopLevel.find_by_short_url(params[:short_url])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @top_level }
    end
  end

  # GET /top_levels/new
  # GET /top_levels/new.json
  def new
    @top_level = TopLevel.new

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @top_level }
    end
  end

  # GET /top_levels/1/edit
  def edit
    @top_level = TopLevel.find(params[:id])
    render layout: "editor"
  end

  # POST /top_levels
  # POST /top_levels.json
  def create
    @top_level = TopLevel.new(params[:top_level])

    respond_to do |format|
      if @top_level.save
        format.html { redirect_to @top_level, notice: 'Top level was successfully created.' }
        format.json { render json: @top_level, status: :created, location: @top_level }
      else
        format.html { render action: "new", layout: "editor" }
        format.json { render json: @top_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /top_levels/1
  # PUT /top_levels/1.json
  def update
    @top_level = TopLevel.find(params[:id])

    respond_to do |format|
      if @top_level.update_attributes(params[:top_level])
        format.html { redirect_to @top_level, notice: 'Top level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor" }
        format.json { render json: @top_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_levels/1
  # DELETE /top_levels/1.json
  def destroy
    @top_level = TopLevel.find(params[:id])
    @top_level.destroy

    respond_to do |format|
      format.html { redirect_to top_levels_url }
      format.json { head :no_content }
    end
  end
end
