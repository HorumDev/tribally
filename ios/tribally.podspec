#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint tribally.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'tribally'
  s.version          = '0.0.1'
  s.summary          = 'Tribally SDKs enable your users to create communities and bring in more people to talk about the things they love.'
  s.description      = <<-DESC
Tribally SDKs enable your users to create communities and bring in more people to talk about the things they love.
                       DESC
  s.homepage         = 'https://horum.co'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Horum' => 'contact@horum.co' }
  s.source           = { :git => 'https://github.com/HorumDev/tribally.git' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Tribally'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
