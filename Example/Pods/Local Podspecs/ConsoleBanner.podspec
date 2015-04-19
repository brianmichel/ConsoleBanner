#
# Be sure to run `pod lib lint ConsoleBanner.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ConsoleBanner"
  s.version          = "0.1.0"
  s.summary          = "A small library to print a debug banner in your Xcode console"
  s.homepage         = "https://github.com/brianmichel/ConsoleBanner"
  s.license          = 'MIT'
  s.author           = { "Brian Michel" => "brian.michel@gmail.com" }
  s.source           = { :git => "https://github.com/brianmichel/ConsoleBanner.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/brianmichel'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ConsoleBanner' => ['Pod/Assets/*.png']
  }
end
