# frozen_string_literal: true

class HomeController < InertiaController
  skip_before_action :authenticate
  before_action :perform_authentication

  def index
    inertia_share parts: -> { Part.all }
  end
end
