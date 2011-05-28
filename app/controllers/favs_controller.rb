class FavsController < ApplicationController
  # GET /favs
  # GET /favs.xml
  def index
    @favs = Fav.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favs }
    end
  end

  # GET /favs/1
  # GET /favs/1.xml
  def show
    @fav = Fav.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fav }
    end
  end

  # GET /favs/new
  # GET /favs/new.xml
  def new
    @fav = Fav.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fav }
    end
  end

  # GET /favs/1/edit
  def edit
    @fav = Fav.find(params[:id])
  end

  # POST /favs
  # POST /favs.xml
  def create
    @fav = Fav.new(params[:fav])

    respond_to do |format|
      if @fav.save
        format.html { redirect_to(@fav, :notice => 'Fav was successfully created.') }
        format.xml  { render :xml => @fav, :status => :created, :location => @fav }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fav.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favs/1
  # PUT /favs/1.xml
  def update
    @fav = Fav.find(params[:id])

    respond_to do |format|
      if @fav.update_attributes(params[:fav])
        format.html { redirect_to(@fav, :notice => 'Fav was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fav.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favs/1
  # DELETE /favs/1.xml
  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy

    respond_to do |format|
      format.html { redirect_to(favs_url) }
      format.xml  { head :ok }
    end
  end
end
