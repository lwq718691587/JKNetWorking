Pod::Spec.new do |s|
s.name = 'JKNetWorking'
s.version = '1.0.3'
s.license = 'MIT'
s.summary = 'Simple NetWorking Kit'
s.homepage = 'https://github.com/lwq718691587/JKNetWorking'
s.authors = { '刘伟强' => '718691587@qq.com' }
s.source = { :git => "https://github.com/lwq718691587/JKNetWorking.git", :tag => "1.0.3"}
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.dependency 'AFNetworking', '~> 3.0.2'
s.source_files  = "JKNetWorking","*.{h,m}"


end

