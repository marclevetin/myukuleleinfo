class UkuleleSerializer < ActiveModel::Serializer
  attributes :id, :instrument_type, :ukulele_shape, :ukulele_size, :luthier,
    :model, :serial_number, :purchase_date, :body_top, :body_back, :body_neck,
    :body_sides, :body_fretboard, :body_binding, :tuner_type,
    :tuner_manufacture, :string_manufacture, :string_count, :string_tuning,
    :finish_type, :finish_look, :pickup, :nut_material, :saddle_material,
    :neck_width, :length_scale, :length_body, :width, :depth, :user_id
end
