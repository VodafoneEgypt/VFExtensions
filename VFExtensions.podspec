Pod::Spec.new do |s|
  s.name             = 'VFExtensions'
  s.version          = '0.1.2'
  s.summary          = 'AVFExtensions is extensions pod.'
  s.description      = 'AVFExtensions is extensions pod which contains UIImage, UIView, Sring, Float, Double extensions'

  s.homepage         = 'https://github.com/VodafoneEgypt/VFExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'VodafoneEgypt' => 'egypt.apps@vodafone.com' }
  s.source           = { :git => 'https://github.com/VodafoneEgypt/VFExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'VFExtensions/Classes/**/*.{swift}'
  
  s.dependency 'Languagehandlerpod'
end
