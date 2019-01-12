#
# Be sure to run `pod lib lint HandyExtensionsPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CocoaExtensions'
  s.version          = '0.1.9'
  s.summary          = 'Some useful extensions which I use everyday.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
There are so many code I'm repeating everyday. So I decided to put some of this code to the repo so I can plug it in my projects. Maybe you find it helpful too.
                       DESC

  s.homepage         = 'https://github.com/Jauzee/CocoaExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abdurahim Jauzee' => 'a.jauzee@gmail.com' }
  s.source           = { :git => 'https://github.com/Jauzee/CocoaExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/abdurahimjauzee'

  s.ios.deployment_target = '8.0'  
  s.tvos.deployment_target = '10.1'
  s.osx.deployment_target = '10.10'

  s.default_subspec = 'Core'
  s.frameworks  = 'Foundation'

  s.subspec 'Core' do |core|
    core.source_files = 'CocoaExtensions/Core/**/*'
  end

  s.subspec 'Rx' do |rx|
    rx.dependency 'RxSwift', '~> 4.0'
    rx.dependency 'RxCocoa', '~> 4.0'
    rx.source_files = 'CocoaExtensions/Rx/**/*'
  end

  s.subspec 'UI' do |ui|
    ui.source_files = 'CocoaExtensions/UI/**/*.swift'
  end

  s.subspec 'Foundation' do |fn|
    fn.source_files = 'CocoaExtensions/Foundation/**/*.swift'
  end

  s.subspec 'Texture+Rx' do |texture|
    texture.source_files = 'CocoaExtensions/Texture/Rx/**/*.swift'
    texture.dependency 'Texture'
    texture.dependency 'RxSwift', '~> 4.0'
    texture.dependency 'RxCocoa', '~> 4.0'
    texture.platform = :ios
    texture.platform = :tvos
  end

end
