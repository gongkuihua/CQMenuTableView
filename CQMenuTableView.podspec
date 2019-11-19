Pod::Spec.new do |s|

  s.name         = "CQMenuTableView"
  s.version      = "0.0.9"
  s.summary      = "一个横向选择的菜单"

  s.description  = <<-DESC 
  						"可以简单的实现横向选择菜单,实现滑动和均分"
                   	  DESC

  s.homepage     = "https://github.com/gongkuihua"
  
  s.author       = { "GKH" => "gkh60@foxmail.com" }
  
  # s.source       = { :git => "https://github.com/gongkuihua/CQMenuTableView.git", :tag => "#{spec.version}" }
  s.source       = { :git => "https://github.com/gongkuihua/CQMenuTableView.git", :tag => "#{s.version}" }

  s.source_files  = "CQMenuTableView/CQMenuTable/*"
  s.public_header_files = "CQMenuTableView/CQMenuTable/*.h"

  s.license      = "MIT"
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
