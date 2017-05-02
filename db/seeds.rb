# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
InstrumentType.create!(instrument_type: 'ukulele')
InstrumentType.create!(instrument_type: 'u-bass')
InstrumentType.create!(instrument_type: 'banjolele')
InstrumentType.create!(instrument_type: 'guitalele')
UkuleleShape.create!(ukulele_shape: 'double bout')
UkuleleShape.create!(ukulele_shape: 'pineapple')
UkuleleShape.create!(ukulele_shape: 'archtop')
UkuleleShape.create!(ukulele_shape: 'fluke')
UkuleleShape.create!(ukulele_shape: 'flea')
UkuleleShape.create!(ukulele_shape: 'bell')
UkuleleShape.create!(ukulele_shape: 'pear')
UkuleleShape.create!(ukulele_shape: 'cigar box')
UkuleleShape.create!(ukulele_shape: 'harp')
UkuleleShape.create!(ukulele_shape: 'paddle')
UkuleleSize.create!(ukulele_size: 'soprano')
UkuleleSize.create!(ukulele_size: 'concert')
UkuleleSize.create!(ukulele_size: 'tenor')
UkuleleSize.create!(ukulele_size: 'baritone')
UkuleleSize.create!(ukulele_size: 'guitalele')
UkuleleSize.create!(ukulele_size: 'sopranino')
Ukulele.create!(instrument_type: 'ukulele', ukulele_shape: 'double bout', ukulele_size: 'soprano')
