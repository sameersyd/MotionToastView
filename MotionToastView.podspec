#
# Be sure to run `pod lib lint MotionToastView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MotionToastView'
  s.version          = '0.1.6'
  s.summary          = 'A Beautiful Toast Library for iOS Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'A Beautiful Motion Toast Library for iOS Swift'
                       DESC

  s.homepage         = 'https://github.com/sameersyd/MotionToastView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sameersyd' => 'sameer.nwaz@gmail.com' }
  s.source           = { :git => 'https://github.com/sameersyd/MotionToastView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/sameer-nawaz-linked/'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Source/**/**'
  s.swift_version = '5.0'
  s.platforms = {
    "ios": "13.0"
  }
  
  s.resource_bundles = {
    'MotionToastView' => ['MotionToastView/**']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
