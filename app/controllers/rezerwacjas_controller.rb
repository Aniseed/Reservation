class RezerwacjasController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :show]

  # GET /rezerwacjas
  # GET /rezerwacjas.json
  def index
    @rezerwacje = Rezerwacja.all
    @film = Film.find(params[:film_id])
    @projekcja = Projekcja.find(params[:projekcja_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rezerwacjas }
    end
  end

  # GET /rezerwacjas/1
  # GET /rezerwacjas/1.json
  def show
    @kino = Kino.find(params[:kino_id])
    @rezerwacja = Rezerwacja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rezerwacja }
    end
  end

  # GET /rezerwacjas/new
  # GET /rezerwacjas/new.json
  def new
    @kino = Kino.find(params[:kino_id])
    @film = Film.find(params[:film_id])
    @projekcja = Projekcja.find(params[:projekcja_id])
    @rezerwacja = Rezerwacja.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rezerwacja }
    end
  end

  # GET /rezerwacjas/1/edit
  def edit
    @rezerwacja = Rezerwacja.find(params[:id])
  end

  # POST /rezerwacjas
  # POST /rezerwacjas.json
  def create
    @rezerwacja = Rezerwacja.new(params[:rezerwacja].merge({:projekcja_id => params[:projekcja_id]}))

    respond_to do |format|
      if @rezerwacja.save
        format.html { redirect_to kino_film_projekcja_rezerwacja_url(params[:kino_id], params[:film_id],params[:projekcja_id],@rezerwacja), notice: 'Rezerwacja was successfully created.' }
        format.json { render json: @rezerwacja, status: :created, location: @rezerwacja }
      else
        format.html { render action: "new" }
        format.json { render json: @rezerwacja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rezerwacjas/1
  # PUT /rezerwacjas/1.json
  def update
    @rezerwacja = Rezerwacja.find(params[:id])

    respond_to do |format|
      if @rezerwacja.update_attributes(params[:rezerwacja])
        format.html { redirect_to @rezerwacja, notice: 'Rezerwacja was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rezerwacja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rezerwacjas/1
  # DELETE /rezerwacjas/1.json
  def destroy
    @rezerwacja = Rezerwacja.find(params[:id])
    @rezerwacja.destroy

    respond_to do |format|
      format.html { redirect_to kino_film_projekcja_rezerwacjas_url }
      format.json { head :no_content }
    end
  end
end
