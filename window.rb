require 'bundler/setup'
Bundler.require

require 'opencv'
include OpenCV

pin = CvMat.load('test/pin.png')
src = CvMat.load('test/out-4.png')
res = src.match_template(pin, :sqdiff)

pt1 = res.min_max_loc[2] # minimum location
pt2 = CvPoint.new(pt1.x + pin.width, pt1.y + pin.height)
src.rectangle!(pt1, pt2, color: CvColor::Red, thickness: 2)

# src.save_image('result.png')

window = GUI::Window.new('show result')
window.show(src)
GUI::wait_key
