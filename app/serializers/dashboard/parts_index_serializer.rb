# frozen_string_literal: true

module Dashboard
  class PartsIndexSerializer < ApplicationSerializer
    has_many :parts
  end
end