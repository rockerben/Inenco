platform :ios, '6.0'

pod 'AFNetworking', '~> 2.2'
pod 'WUEmoticonsKeyboard', '~> 0.3'
pod 'MagicalRecord/Shorthand', '~> 2.2'
pod 'INTULocationManager'


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ARCHS'] = "$(ARCHS_STANDARD_INCLUDING_64_BIT)"
        end
    end
    
end