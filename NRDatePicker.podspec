Pod::Spec.new do |s|
  s.name         = "NRDatePicker"
  s.version      = "0.0.1"
  s.summary      = "Simple Date Only Picker."
  s.description  = <<-DESC
                    - Simple Date Only Picker.
                   DESC
  s.homepage     = "https://github.com/nrikiji/NRDatePicker"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.platform     = :ios, "11.0"
  s.author       = { "nrikiji" => "nrikiji@gmail.com" }
  s.source       = { :git => "https://github.com/nrikiji/NRDatePicker.git", :commit => "89f65301555570cebf8a1f893b2ce26587fa7960" }
  s.source_files  = "NRDatePicker/**/*.swift"
end
