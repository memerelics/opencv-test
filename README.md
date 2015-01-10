OpenCV setup
======================
```````
$ brew install cmake
$ pip install numpy
$ brew install opencv
```````

OpenCV says `/usr/local/lib/libjpeg.8.dylib` not found, so I symlinked it.

``````
$ sudo find / -name libjpeg.8.dylib
$ sudo ln -s /usr/local/Cellar/jpeg/8d/lib/libjpeg.8.dylib /usr/local/lib/
`````

````ruby:Gemfile
gem 'ruby-opencv'
````


samples
========================

# ruby-opencv samples
https://github.com/ruby-opencv/ruby-opencv/tree/master/examples
