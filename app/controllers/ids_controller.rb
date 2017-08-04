class IdsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  # GET /ids
  # GET /ids.json
  def index
    @id = Id.first
  end

  # GET /ids/1
  # GET /ids/1.json
  def show
  end

  # GET /ids/new
  def new
    @id = Id.new
  end

  # GET /ids/1/edit
  def edit
  end

  # POST /ids
  # POST /ids.json
  def create
    @id = Id.new(id_params)

    respond_to do |format|
      if @id.save
        format.html { redirect_to @id, notice: 'Id was successfully created.' }
        format.json { render :show, status: :created, location: @id }
      else
        format.html { render :new }
        format.json { render json: @id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ids/1
  # PATCH/PUT /ids/1.json
  def update
    respond_to do |format|
      if @id.update(id_params)
        format.html { redirect_to @id, notice: 'Id was successfully updated.' }
        format.json { render :show, status: :ok, location: @id }
      else
        format.html { render :edit }
        format.json { render json: @id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ids/1
  # DELETE /ids/1.json
  def destroy
    @id.destroy
    respond_to do |format|
      format.html { redirect_to ids_url, notice: 'Id was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_id
      @id = Id.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def id_params
      params.require(:id).permit(:first_name, :second_name, :sir_name, :other_name, :dob, :bio)
    end
end
