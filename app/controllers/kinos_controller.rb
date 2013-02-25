class KinosController < ApplicationController
  # GET /kinos
  # GET /kinos.json
  def index
    @kinos = Kino.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kinos }
    end
  end

  # GET /kinos/1
  # GET /kinos/1.json
  def show
    @kino = Kino.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kino }
    end
  end

  # GET /kinos/new
  # GET /kinos/new.json
  def new
    @kino = Kino.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kino }
    end
  end

  # GET /kinos/1/edit
  def edit
    @kino = Kino.find(params[:id])
  end

  # POST /kinos
  # POST /kinos.json
  def create
    @kino = Kino.new(params[:kino])

    respond_to do |format|
      if @kino.save
        format.html { redirect_to @kino, notice: 'Kino was successfully created.' }
        format.json { render json: @kino, status: :created, location: @kino }
      else
        format.html { render action: "new" }
        format.json { render json: @kino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kinos/1
  # PUT /kinos/1.json
  def update
    @kino = Kino.find(params[:id])

    respond_to do |format|
      if @kino.update_attributes(params[:kino])
        format.html { redirect_to @kino, notice: 'Kino was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kinos/1
  # DELETE /kinos/1.json
  def destroy
    @kino = Kino.find(params[:id])
    @kino.destroy

    respond_to do |format|
      format.html { redirect_to kinos_url }
      format.json { head :no_content }
    end
  end
end
