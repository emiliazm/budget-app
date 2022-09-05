class GroupOperacionsController < ApplicationController
  before_action :set_group_operacion, only: %i[show edit update destroy]

  # GET /group_operacions or /group_operacions.json
  def index
    @group_operacions = GroupOperacion.all
  end

  # GET /group_operacions/1 or /group_operacions/1.json
  def show; end

  # GET /group_operacions/new
  def new
    @group_operacion = GroupOperacion.new
  end

  # GET /group_operacions/1/edit
  def edit; end

  # POST /group_operacions or /group_operacions.json
  def create
    @group_operacion = GroupOperacion.new(group_operacion_params)

    respond_to do |format|
      if @group_operacion.save
        format.html do
          redirect_to group_operacion_url(@group_operacion), notice: 'Group operacion was successfully created.'
        end
        format.json { render :show, status: :created, location: @group_operacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_operacions/1 or /group_operacions/1.json
  def update
    respond_to do |format|
      if @group_operacion.update(group_operacion_params)
        format.html do
          redirect_to group_operacion_url(@group_operacion), notice: 'Group operacion was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @group_operacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_operacions/1 or /group_operacions/1.json
  def destroy
    @group_operacion.destroy

    respond_to do |format|
      format.html { redirect_to group_operacions_url, notice: 'Group operacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group_operacion
    @group_operacion = GroupOperacion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_operacion_params
    params.require(:group_operacion).permit(:group_id, :operation_id)
  end
end
