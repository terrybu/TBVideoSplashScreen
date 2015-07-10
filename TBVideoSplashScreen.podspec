#
# Be sure to run `pod lib lint TBVideoSplashScreen.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TBVideoSplashScreen"
  s.version          = "0.1.0"
  s.summary          = "TBVideoSplashScreen allows you to create a splash screen using a video file"
  s.description      = <<-DESC
                       Tired of using static images as the launch screen? Many prefer an animated splash screen but GIF files are quite a pain. Make a cool animation, export it out to video, use this library to show it and then let your app start normally at video finish.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/terrybu/TBVideoSplashScreen"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Terry Bu" => "burea1124@gmail.com" }
  s.source           = { :git => "https://github.com/terrybu/TBVideoSplashScreen.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TBVideoSplashScreen' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
