class CinemasController < ApplicationController
  before_filter :authenticate, :except => [:index, :post_coordinates, :posted_coordinates]

  # GET /cinemas
  # GET /cinemas.json
  def index
	# przechowuje współrzędne użytkownika, aby nie podawał szerokości geograficznej za każdym razem
    if cookies[:szer].nil?
      cookies[:szer] = params[:szer]
    end

	# przechowuje współrzędne użytkownika, aby nie podawał dłgości gepgraficznej za każdym razem
    if cookies[:dlu].nil?
      cookies[:dlu] = params[:dlu]
    end
    
	# posortowanie listy kin po odległości
    @cinemas = Cinema.posortowane_po_odleglosci(cookies[:szer],cookies[:dlu])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cinemas }
    end
  end

  # GET /cinemas/1
  # GET /cinemas/1.json
  def show
    @cinema = Cinema.find(params[:id])
    @movies = Movie.find_all_by_cinema_id(@cinema.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cinema }
    end
  end

  # GET /cinemas/new
  # GET /cinemas/new.json
  def new
    @cinema = Cinema.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cinema }
    end
  end

  # GET /cinemas/1/edit
  def edit
    @cinema = Cinema.find(params[:id])
  end

  # POST /cinemas
  # POST /cinemas.json
  def create
    @cinema = Cinema.new(:nazwa => params[:cinema][:nazwa],
                         :szerokosc => params[:cinema][:szerokosc],
                         :dlugosc => params[:cinema][:dlugosc])

    respond_to do |format|
      if @cinema.save
        format.html { redirect_to @cinema, notice: 'Cinema was successfully created.' }
        format.json { render json: @cinema, status: :created, location: @cinema }
      else
        format.html { render action: "new" }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cinemas/1
  # PUT /cinemas/1.json
  def update
    @cinema = Cinema.find(params[:id])

    respond_to do |format|
      if @cinema.update_attributes(params[:cinema])
        format.html { redirect_to @cinema, notice: 'Cinema was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cinemas/1
  # DELETE /cinemas/1.json
  def destroy
    @cinema = Cinema.find(params[:id])
    @cinema.destroy

    respond_to do |format|
      format.html { redirect_to cinemas_url }
      format.json { head :no_content }
    end
  end

	# nie wiem czy to użyjemy gdzieś
  def post_coordinates
  end

	# przekierowanie na listę kin, po naciśnięciu przycisku wypełnienia lokalizacji
  def posted_coordinates
    address = params[:address]
    wspolrzedne = Geocoder.coordinates(address) # wykonanie metody coordinates z modułu Geocoder, który implementuje google maps api - ! uwaga tylko 2500 zapytań dziennie można!

	# przekazanie współrzędnych do url do metody 'index'
    respond_to do |format|
      format.html { redirect_to cinemas_path({ :szer => wspolrzedne[0], :dlu => wspolrzedne[1] }) }
    end
  end
end
