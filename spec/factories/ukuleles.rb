FactoryGirl.define do
  factory :ukulele do
    instrument_type 'ukulele'
    ukulele_shape 'double bout'
    ukulele_size 'soprano'
    string_count '4'

    user
  end
end
