class HabrausersController < ApplicationController
  # GET /habrausers
  # GET /habrausers.xml
  def index
    @habrausers = Habrauser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @habrausers }
    end
  end

  # GET /habrausers/1
  # GET /habrausers/1.xml
  def show
    @habrauser = Habrauser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @habrauser }
    end
  end

  # GET /habrausers/new
  # GET /habrausers/new.xml
  def new
    @habrauser = Habrauser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @habrauser }
    end
  end

  # GET /habrausers/1/edit
  def edit
    @habrauser = Habrauser.find(params[:id])
  end

  # POST /habrausers
  # POST /habrausers.xml
  def create
    @habrauser = Habrauser.new(params[:habrauser])

    respond_to do |format|
      if @habrauser.save
        format.html { redirect_to(@habrauser, :notice => 'Habrauser was successfully created.') }
        format.xml  { render :xml => @habrauser, :status => :created, :location => @habrauser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @habrauser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /habrausers/1
  # PUT /habrausers/1.xml
  def update
    @habrauser = Habrauser.find(params[:id])

    respond_to do |format|
      if @habrauser.update_attributes(params[:habrauser])
        format.html { redirect_to(@habrauser, :notice => 'Habrauser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @habrauser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /habrausers/1
  # DELETE /habrausers/1.xml
  def destroy
    @habrauser = Habrauser.find(params[:id])
    @habrauser.destroy

    respond_to do |format|
      format.html { redirect_to(habrausers_url) }
      format.xml  { head :ok }
    end
  end
end
