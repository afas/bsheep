class WelcomesController < ApplicationController

  def set_lang
    raise NotFound unless Language.include?(params[:lang_cut])
    redirect_to "/?locale=#{params[:lang_cut]}"
  end

  # GET /welcomes
  # GET /welcomes.json
  def index
    @works = Work.where("lang = ? AND published = ?", I18n.locale, true).paginate(:page => params[:page])

    render :layout => "welcome"

    #@welcomes = Welcome.all
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @welcomes }
    #end
  end

  # GET /welcomes/1/edit
  def edit
    @edit_action = true
    #@welcome = Welcome.find(params[:id])
  end

  # PUT /welcomes/1
  # PUT /welcomes/1.json
  def update
    #@welcome = Welcome.find(params[:id])
    respond_to do |format|
      if @welcome.update_attributes(params[:welcome])
        format.html { redirect_to root_url, notice: 'Welcome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end
end
