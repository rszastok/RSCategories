Pod::Spec.new do |s|
  s.name                  = 'iOS-utilities'
  s.version               = '0.2.0'
  s.author                = {
    "Rafal Szastok" => "r.szastok@gmail.com"
    }
  s.source                = {
    :git => 'https://github.com/rszastok/iOS-utilities.git',
    :tag => s.version.to_s
}
  s.source_files          = 'lib/*.{h,m}'
  
  s.homepage              = 'https://github.com/rszastok/iOS-utilities/'
  s.summary 			  = 'Set of useful objC-Categories and Classes.'
  
  s.license               = 'MIT license'
  s.requires_arc          = true
  s.platform              = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.frameworks            = 'CoreLocation', 'MapKit', 'Foundation', 'UIKit'
end