class WorksController < ApplicationController

  def page
    @works = Work.where(:lang => I18n.locale).paginate(:page => params[:page])

    render :layout => false

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @works }
    #end
  end

  # GET /works
  # GET /works.json
  def index
    @works = Work.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @works }
    end
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @work = Work.find(params[:id]) if params[:id]
    @work = Work.find_by_short_url(params[:short_url]) if params[:short_url]

    respond_to do |format|
      format.html { render layout: "promo_page" if @work.with_web_page }
      format.json { render json: @work }
    end
  end

  # GET /works/new
  # GET /works/new.json
  def new
    @work = Work.new
    @edit_action = true

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @work }
    end
  end

  # GET /works/1/edit
  def edit
    @edit_action = true
    @work = Work.find(params[:id])
    render layout: "editor"
  end

  # POST /works
  # POST /works.json
  def create
    @edit_action = true
    @work = Work.new(params[:work])

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render json: @work, status: :created, location: @work }
      else
        format.html { render action: "new", layout: "editor"  }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /works/1
  # PUT /works/1.json
  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor"  }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end
end
