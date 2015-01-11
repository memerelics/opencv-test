require 'bundler/setup'
Bundler.require

require 'opencv'
include OpenCV

# `convert pool201501.pdf out.png`

pin = CvMat.load 'test/pin.png'

target_page = Dir.glob('./test/out-*.png').map {|file|
  src = CvMat.load(file)
  res = src.match_template(pin, :sqdiff)
  [file, res.min_max_loc[0]]
}.min{|a, b| a.last <=> b.last }.first

