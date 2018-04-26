Pod::Spec.new do |s|
s.name = 'JKNetWorking'
s.version = '1.1.3'
s.license = 'MIT'
s.summary = 'Simple NetWorking Kit'
s.homepage = 'https://github.com/lwq718691587/JKNetWorking'
s.authors = { '刘伟强' => '718691587@qq.com' }
s.source = { :git => "https://github.com/lwq718691587/JKNetWorking.git", :tag => s.version.to_s}
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.dependency 'AFNetworking'
s.source_files  = "JKNetWorking","*.{h,m}"


end

