Pod::Spec.new do |s|
  s.name             = 'UILayoutSpec'
  s.version          = '1.0.0'
  s.summary          = 'UIKit flexBox framework for iOS built on YogaKit'

  s.description      = 'Texture LayoutSpec mechanism inspired UIKit flexBox framework for iOS and built on Facebook YogaKit'

  s.homepage         = 'https://github.com/Geektree0101/UILayoutSpec'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Geektree0101' => 'h2s1880@gmail.com' }
  s.source           = { :git => 'https://github.com/Geektree0101/UILayoutSpec.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'UILayoutSpec/Classes/**/*'
  s.dependency 'YogaKit'
end
