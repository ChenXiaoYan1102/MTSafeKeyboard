Pod::Spec.new do |s|

  s.name         = "MTSafeKeyboard"
  s.version      = "0.0.8"
  s.summary      = "MTSafeKeyboard的一个简单示范工程."

  s.description  = <<-DESC
                   自定义安全键盘，带符号键盘，字母键盘，数字键盘.
                   DESC

  s.homepage     = "https://github.com/ChenXiaoYan1102/MTSafeKeyboard"

  s.license      = "MIT"

  s.author       = { "Author" => "624122929@qq.com" }

  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/ChenXiaoYan1102/MTSafeKeyboard.git", :tag => "#{s.version}" }

  s.dependency "Masonry", "~> 1.1.0"

  s.public_header_files = "#{s.name}/*.h", "#{s.name}/include/**/*.h"
  s.source_files = "#{s.name}/**/*.{h,m}"
  s.resource_bundles = {
    "#{s.name}Bundle" => ["#{s.name}Bundle/*"]
  }

end
