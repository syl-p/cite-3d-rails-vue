class PartsController < InertiaController
  before_action :set_part, only: [ :show ]

  skip_before_action :authenticate, only: [ :show ]
  before_action :perform_authentication

  def show
    inertia_share part: @part
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end
end
