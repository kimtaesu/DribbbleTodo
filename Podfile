# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'
inhibit_all_warnings!

target 'DribbbleTodo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'Then'
  pod 'Fabric'
  pod 'Crashlytics'
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'ReactorKit'
  pod 'RxOptional'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'RxDataSources', '~> 3.0'
  pod 'GoogleSignIn'
  # Pods for DribbbleTodo

  target 'DribbbleTodoTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '~> 1.3'
    pod 'Nimble', '~> 7.3'
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
    
    pod 'RxExpect'
    pod 'Stubber'
  end

  post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      end
    end
  end
end
