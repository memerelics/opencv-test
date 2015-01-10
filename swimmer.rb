require 'bundler/setup'
Bundler.require

require 'opencv'

# `convert pool201501.pdf out.png`

# Dir.glob('./test/*.png').each do |file|
#   puts file
#   puts OpenCV::IplImage::load(file)
#   puts OpenCV::CvMat.load(file)
# end

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
