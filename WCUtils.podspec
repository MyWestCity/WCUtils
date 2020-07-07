
Pod::Spec.new do |spec|

  spec.name         = "WCUtils"
  spec.version      = "0.0.2"
  spec.summary      = "WCUtils"

  spec.description  = <<-DESC
                        WCUtils -- 一个包含常用分类的开发工具包，加快开发速度
                      DESC

  spec.homepage     = "https://github.com/MyWestCity/WCUtils"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "WestCity" => "1034009721@qq.com" }

  spec.platform     = :ios, "8.0"

  spec.ios.deployment_target = "8.0"

  spec.source       = { :git => "https://github.com/MyWestCity/WCUtils.git", :tag => spec.version }

  spec.public_header_files = 'WCUtils/WCUtils.h'
  spec.source_files  = "WCUtils/WCUtils.h"

  spec.subspec 'WCCategory' do |category|
      category.source_files = 'WCUtils/WCCategory/*.{h,m}'
      category.public_header_files = 'WCUtils/WCCategory/*.h'
  end

  spec.subspec 'WCWidget' do |widget|
      widget.source_files = 'WCUtils/WCWidget/*.{h,m}'
      widget.public_header_files = 'WCUtils/WCWidget/*.h'
  end

end
