class ProjectionsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  # GET /projections
  # GET /projections.json
  def index
    @movie = Movie.find(params[:movie_id])
    @cinema = Cinema.find(params[:cinema_id])
    @projections = Projection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projections }
    end
  end

  # GET /projections/1
  # GET /projections/1.json
  def show
    @movie = Movie.find(params[:movie_id])
    @projection = Projection.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @projection }
    end
  end

  # GET /projections/new
  # GET /projections/new.json
  def new
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:movie_id])
    @projection = Projection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @projection }
    end
  end

  # GET /projections/1/edit
  def edit
    @projection = Projection.find(params[:id])
  end

  # POST /projections
  # POST /projections.json
  def create
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:movie_id])
    @projection = Projection.new(:data => params[:projection][:data].to_date,
                                 :godzina => Time.parse(params[:projection][:godzina]).strftime("%I:%M %P"),
                                 :movie_id => @movie.id)

    respond_to do |format|
      if @projection.save
        format.html { redirect_to cinema_movie_projections_url, notice: 'Projection was successfully created.' }
        format.json { render json: @projection, status: :created, location: @projection }
      else
        format.html { render action: "new" }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projections/1
  # PUT /projections/1.json
  def update
    @projection = Projection.find(params[:id])

    respond_to do |format|
      if @projection.update_attributes(params[:projection])
        format.html { redirect_to @projection, notice: 'Projection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projections/1
  # DELETE /projections/1.json
  def destroy
    @projection = Projection.find(params[:id])
    @projection.destroy

    respond_to do |format|
      format.html { redirect_to projections_url }
      format.json { head :no_content }
    end
  end
end
