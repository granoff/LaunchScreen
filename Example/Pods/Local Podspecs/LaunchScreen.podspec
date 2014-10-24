#
# Be sure to run `pod lib lint LaunchScreen.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LaunchScreen"
  s.version          = "0.1.0"
  s.summary          = "View controller class providing interactive & dynamic splash screens"
  s.description      = <<-DESC
LaunchScreen is a UIViewController class that exposes your LaunchScreen.xib as a view controller
for your use as an interactive/dynamic splash screen, or simply as a snapshot image for a static
splash screen.
                       DESC
  s.homepage         = "https://github.com/granoff/LaunchScreen"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mark H. Granoff" => "mark@granoff.net" }
  s.source           = { :git => "https://github.com/granoff/LaunchScreen.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hawkimedia'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'LaunchScreen' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
