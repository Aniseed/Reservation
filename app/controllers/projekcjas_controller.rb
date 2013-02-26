class ProjekcjasController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  # GET /projekcjas
  # GET /projekcjas.json
  def index
    @projekcje = Projekcja.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projekcjas }
    end
  end

  # GET /projekcjas/1
  # GET /projekcjas/1.json
  def show
    @projekcja = Projekcja.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @projekcja }
    end
  end

  # GET /projekcjas/new
  # GET /projekcjas/new.json
  def new
    @kino = Kino.find(params[:kino_id])
    @film = Film.find(params[:film_id])
    @projekcja = Projekcja.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @projekcja }
    end
  end

  # GET /projekcjas/1/edit
  def edit
    @projekcja = Projekcja.find(params[:id])
  end

  # POST /projekcjas
  # POST /projekcjas.json
  def create
    @projekcja = Projekcja.new(params[:projekcja])

    respond_to do |format|
      if @projekcja.save
        format.html { redirect_to @projekcja, notice: 'Projekcja was successfully created.' }
        format.json { render json: @projekcja, status: :created, location: @projekcja }
      else
        format.html { render action: "new" }
        format.json { render json: @projekcja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projekcjas/1
  # PUT /projekcjas/1.json
  def update
    @projekcja = Projekcja.find(params[:id])

    respond_to do |format|
      if @projekcja.update_attributes(params[:projekcja])
        format.html { redirect_to @projekcja, notice: 'Projekcja was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @projekcja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projekcjas/1
  # DELETE /projekcjas/1.json
  def destroy
    @projekcja = Projekcja.find(params[:id])
    @projekcja.destroy

    respond_to do |format|
      format.html { redirect_to projekcjas_url }
      format.json { head :no_content }
    end
  end
end
