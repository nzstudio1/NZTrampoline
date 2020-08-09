#
# Be sure to run `pod lib lint NZTrampoline.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NZTrampoline'
  s.version          = '0.1.0'
  s.summary          = 'Allows having more than one delegate for a specific protocol.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 Instances of the classes inherited from NZTrampolineBase are able to implement some delegate methods while they are able to forward all other methods of the protocol to the delegate object.
                       DESC

  s.homepage         = 'https://github.com/nzstudio1/NZTrampoline'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'H. Vakilian' => 'hamid@nzstudio.dev' }
  s.source           = { :git => 'https://github.com/nzstudio1/NZTrampoline.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NZTrampoline/NZTrampoline/Classes/**/*'
  
  s.swift_versions = [ '5.0' ]
  
  # s.resource_bundles = {
  #   'NZTrampoline' => ['NZTrampoline/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
