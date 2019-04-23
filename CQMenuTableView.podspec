Pod::Spec.new do |spec|

  spec.name         = "CQMenuTableView"
  spec.version      = "0.0.2"
  spec.summary      = "一个横向选择的菜单"

  spec.description  = <<-DESC 
  						"可以简单的实现横向选择菜单,实现滑动和均分"
                   	  DESC

  spec.homepage     = "https://github.com/1174117917/CQMenuTableView"
  spec.platform     = :ios
  
  spec.author             = { "GKH" => "gkh60@foxmail.com" }
  
  spec.source       = { :git => "https://github.com/1174117917/CQMenuTableView.git", :tag => "#{spec.version}" }

  spec.source_files  = "CQMenuTableView/CQMenuTable/*"
  spec.public_header_files = "CQMenuTableView/CQMenuTable/*.h"
  spec.license      = "MIT"
  spec.ios.deployment_target = '7.0'
end
