class Part < ApplicationRecord
  composed_of :offset, class_name: "Point", mapping: { offset_x: :x, offset_y: :y, offset_z: :z }

  has_many :media, dependent: :destroy
end
