#
# Be sure to run `pod lib lint TKMiddleware.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKMiddleware'
  s.version          = '0.0.1db'
  s.summary          = '组件开发的中间件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS组件开发的中间件，所有组件都必须依赖的一个组件，它是所有组件的核心组件，以Target-Action模式
创建。
                       DESC

  s.homepage         = 'https://github.com/512869343@qq.com/TKMiddleware'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '512869343@qq.com' => '512869343@qq.com' }
  s.source           = { :git => 'https://github.com/myiOSComponent/TKMiddleware.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

    s.public_header_files = 'TKMiddleware/Classes/TKMiddleWare.h'
    s.source_files = 'TKMiddleware/Classes/TKMiddleWare.m'
    s.subspec 'Extend' do |es|
        es.source_files = 'TKMiddleware/Classes/Extend/**'
    end

  # s.resource_bundles = {
  #   'TKMiddleware' => ['TKMiddleware/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
