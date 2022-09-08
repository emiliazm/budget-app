class OperationsController < ApplicationController
  before_action :set_operation, only: %i[show edit update destroy]

  # GET /operations or /operations.json
  def index
    group_id = params[:group_id]
    @group = current_user.groups.find(group_id)
    @operations = @group.operations.order(id: :desc)
  end

  # GET /operations/1 or /operations/1.json
  def show
    group_id = params[:group_id]
    @group = current_user.groups.find(group_id)
  end

  # GET /operations/new
  def new
    group_id = params[:group_id]
    @group = current_user.groups.find(group_id)
    @operation = current_user.operations.new
  end

  # GET /operations/1/edit
  def edit; end

  # POST /operations or /operations.json
  def create
    group_id = params[:group_id]
    @group = current_user.groups.find(group_id)
    @operation = current_user.operations.new(operation_params)
    @group.operations.push(@operation)

    respond_to do |format|
      if @operation.save
        format.html do
          redirect_to group_operations_path(group_id: @group.id), notice: 'Operation was successfully created.'
        end
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: 'Operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to group_operations_url, notice: 'Operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount)
  end
end
