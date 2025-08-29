Pod::Spec.new do |spec|
  spec.name         = 'LaunchAlertKit'
  spec.version      = '0.0.1'
  spec.summary      = 'A short description of LaunchAlertKit.'

  spec.license = 'MIT'
  spec.summary = 'The launch alert in all app is handled easily.'
  spec.homepage = 'https://github.com/ControlKit/LaunchAlertKit'
  spec.source = { :git => 'https://github.com/ControlKit/LaunchAlertKit.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '13.0'
  spec.source_files = 'Sources/*.swift', 'Sources/**/*.swift', 'Sources/**/**/*.swift'
  spec.resources = 'Sources/LaunchAlertKit/Resources/*.xcassets'
  spec.authors = { 'Maziar Saadatfar' => 'maziar.saadatfar@gmail.com' }
  spec.swift_versions = ['5.0']
end
