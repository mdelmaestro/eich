Pod::Spec.new do |s|
    s.name = 'eich'
    s.version = '1.0'
    s.license = 'MIT'
    s.summary = 'Thin and simple wrapper around URLSession'
    s.homepage = 'https://github.com/mdelmaestro/eich'
    s.authors = { 'mdelmaestro' => 'mdelmaestro@users.noreply.github.com.io' }
    s.source = { :git => 'https://github.com/mdelmaestro/eich.git', :tag => s.version }
    s.ios.deployment_target = '13.0'
    s.swift_versions = ['5.3']
    s.source_files = 'Sources/**/*.swift'
  end
