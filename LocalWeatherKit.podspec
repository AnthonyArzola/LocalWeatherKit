

Pod::Spec.new do |s|

  s.name         = "LocalWeatherKit"
  s.version      = "0.0.3"
  s.summary      = "LocalWeatherKit simplifies communication with OpenWeatherMap API."

  s.description  = <<-DESC
                    LocalWeatherKit simplifies communication with OpenWeatherMap API. Makes use of
                    AFNetworking and DCKeyValueObjectMapping.
                   DESC

  s.homepage     = "http://EXAMPLE/LocalWeatherKit"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = { "Anthony Arzola" => "AnthonyArzola@gmail.com" }

  #s.source       = { :git => "http://EXAMPLE/LocalWeatherKit.git", :tag => "#{s.version}" }
  s.source  = { :path => '.' }

  s.source_files  = "Classes/*.{h,m}", "Models/*.{h,m}"
  s.exclude_files = "LocalWeatherKitTests"
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.platform     = :ios
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "AFNetworking", "~> 3.0"
  s.dependency "DCKeyValueObjectMapping", "~> 1.5"

end
