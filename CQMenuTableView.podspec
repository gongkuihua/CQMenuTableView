Pod::Spec.new do |spec|

  spec.name         = "CQMenuTableView"
  spec.version      = "0.0.4"
  spec.summary      = "一个横向选择的菜单"

  spec.description  = <<-DESC 
  						"可以简单的实现横向选择菜单,实现滑动和均分"
                   	  DESC

  spec.homepage     = "https://github.com/1174117917/CQMenuTableView"
  
  spec.author             = { "GKH" => "gkh60@foxmail.com" }
  
  spec.source       = { :git => "https://github.com/1174117917/CQMenuTableView.git", :tag => "#{spec.version}" }

  spec.source_files  = "CQMenuTableView/CQMenuTable/*"
  spec.public_header_files = "CQMenuTableView/CQMenuTable/*.h"

  spec.license      = "MIT"
  spec.platform     = :ios, "7.0"
  spec.ios.deployment_target = "7.0"
end
