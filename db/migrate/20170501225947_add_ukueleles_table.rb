class AddUkuelelesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ukuleles do |t|
      t.string :instrument_type, null: false
      t.string :ukulele_shape, null: false
      t.string :ukulele_size, null: false
      t.string :luthier
      t.string :model
      t.integer :serial_number
      t.date :purchase_date

      t.string :body_top
      t.string :body_sides
      t.string :body_back
      t.string :body_neck
      t.string :body_fretboard
      t.string :body_binding

      t.string :tuner_type
      t.string :tuner_manufacture

      t.string :string_manufacture
      t.integer :string_count
      t.string :string_tuning

      t.string :finish_type
      t.string :finish_look

      t.string :pickup
      t.string :nut_material
      t.string :saddle_material

      t.integer :neck_width
      t.integer :length_scale
      t.integer :length_body
      t.integer :width
      t.integer :depth

      t.belongs_to :users

      t.timestamps null: false
    end

    create_table :instrument_types do |t|
      t.string :instrument_type, null: false, unique: true
    end

    create_table :ukulele_shapes do |t|
      t.string :ukulele_shape, null: false, unique: true
    end

    create_table :ukulele_sizes do |t|
      t.string :ukulele_size, null: false, unique: true
    end
  end
end
