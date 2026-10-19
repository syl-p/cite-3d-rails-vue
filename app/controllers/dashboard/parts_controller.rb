class Dashboard::PartsController < InertiaController
  before_action :set_part, only: [ :edit, :update, :destroy ]

  def index
    @parts = Part.all
  end

  def edit
    inertia_share part: @part
  end

  def update
    if @part.update(part_params)
      redirect_to dashboard_parts_path, notice: "Part updated successfully."
    else
      inertia_share part: @part
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to dashboard_parts_path, notice: "Part deleted successfully."
  end

  private
  def set_part
    @part = Part.find(params[:id])
  end
end
