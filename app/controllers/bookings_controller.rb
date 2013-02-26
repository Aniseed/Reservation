class BookingsController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :show]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    @movie = Movie.find(params[:movie_id])
    @projection = Projection.find(params[:projection_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @cinema = Cinema.find(params[:cinema_id])
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:movie_id])
    @projection = Projection.find(params[:projection_id])
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(params[:booking].merge({:projection_id => params[:projection_id]}))

    respond_to do |format|
      if @booking.save
        format.html { redirect_to cinema_movie_projection_booking_url(params[:cinema_id], params[:movie_id],params[:projection_id],@booking), notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if cinema_movie_projection_booking_url(params[:cinema_id], params[:movie_id],params[:projection_id],@booking).update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to cinema_movie_projection_bookings_url }
      format.json { head :no_content }
    end
  end
end
