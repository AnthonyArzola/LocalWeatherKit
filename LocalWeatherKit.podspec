Pod::Spec.new do |s|

  s.name         = "LocalWeatherKit"
  s.version      = "0.0.6"
  s.summary      = "LocalWeatherKit simplifies communication with OpenWeatherMap API."

  s.description  = <<-DESC
                    LocalWeatherKit simplifies communication with OpenWeatherMap API. Makes use of
                    AFNetworking and DCKeyValueObjectMapping.
                   DESC

  s.homepage     = "https://github.com/AnthonyArzola/LocalWeatherKit"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Anthony Arzola" => "AnthonyArzola@gmail.com" }

  s.source  = { :path => '.' }

  s.source_files  = "Classes/*.{h,m}", "Models/*.{h,m}"
  s.exclude_files = "LocalWeatherKitTests"

  s.requires_arc = true

  s.dependency "AFNetworking", "3.1.0"
  s.dependency "DCKeyValueObjectMapping", "1.5"

end
