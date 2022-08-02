Pod::Spec.new do |s|
  s.name             = "DTTJailbreakDetectionSTH"
  s.version          = "0.0.1"
  s.summary          = "iOS device jailbreak detection library"
  s.homepage         = "https://github.com/stevejubs/DTTJailbreakDetection"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Thi Doãn" => "t@thi.im" }
  s.source           = { :git => "https://github.com/stevejubs/DTTJailbreakDetection.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/DTTJailbreakDetection/**/*.{h,m}'
end
