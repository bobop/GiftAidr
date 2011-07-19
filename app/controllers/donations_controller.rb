class DonationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  # GET /donations
  # GET /donations.xml
  def index
    @donations = current_user.donations if current_user
    @total = Donation.sum(:amount, :conditions =>['user_id = ?', current_user.id]) if current_user
    @welcome = true if !current_user
    
    @overall = Donation.sum(:amount)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.xml
  def show
    @donation = current_user.donations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.xml
  def new
    @donation = Donation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = current_user.donations.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    @donation = current_user.donations.new(params[:donation])
    @donation.donation_date = Time.now

    respond_to do |format|
      if @donation.save
        format.html { redirect_to(donations_path, :notice => 'Donation was successfully created.') }
        format.xml  { render :xml => @donation, :status => :created, :location => @donation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.xml
  def update
    @donation = current_user.donations.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to(root_url, :notice => 'Donation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.xml
  def destroy
    @donation = current_user.donations.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to(donations_url) }
      format.xml  { head :ok }
    end
  end
end
