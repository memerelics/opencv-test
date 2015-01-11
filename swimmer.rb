require 'bundler/setup'
Bundler.require

require 'opencv'
include OpenCV

# `convert pool201501.pdf out.png`

# Dir.glob('./test/*.png').each do |file|
#   puts file
#   puts OpenCV::IplImage::load(file)
#   puts OpenCV::CvMat.load(file)
# end

=begin
cvmat = OpenCV::CvMat.load('./test/out-0.png')
cvmat = cvmat.BGR2GRAY
puts canny = cvmat.canny(50, 150)
puts contour = canny.find_contours(mode: OpenCV::CV_RETR_LIST,
                                   method: OpenCV::CV_CHAIN_APPROX_SIMPLE)

while contour
  unless contour.hole?
    box = contour.bounding_rect
    cvmat.rectangle! box.top_left, box.bottom_right, color: OpenCV::CvColor::Red
  end
  contour = contour.h_next
end

cvmat.save_image 'out.png'
=end

pin = CvMat.load 'test/pin.png'
src = CvMat.load 'test/out-4.png'

res = src.match_template(pin, :sqdiff) # :sqdiff_normed
# res_ng = CvMat.load('test/out-3.png').match_template(pin, :sqdiff)

# binding.pry

pt1 = res.min_max_loc[2] # minimum location
pt2 = CvPoint.new(pt1.x + pin.width, pt1.y + pin.height)
src.rectangle!(pt1, pt2, color: CvColor::Red, thickness: 2)

window = GUI::Window.new('Show...')
window.show(src)
GUI::wait_key
