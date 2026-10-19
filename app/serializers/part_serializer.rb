class PartSerializer < ApplicationSerializer
  attributes :id, :title, :description, :body, :object_name, :created_at, :updated_at
  many :media, resource: MediumSerializer
end
