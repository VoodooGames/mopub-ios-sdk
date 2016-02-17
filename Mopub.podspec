Pod::Spec.new do |s|
  
  s.name = "mopub-ios-sdk"
  s.version = "4.3.0"
  s.summary = "The Official MoPub Client SDK allows developers to easily monetize their apps by showing banner, interstitial, and native ads."
  s.description  = <<-DESC
  MoPub is a hosted ad serving solution built specifically for mobile publishers.
  Grow your mobile advertising business with powerful ad management, optimization 
  and reporting capabilities, and earn revenue by connecting to the world's largest 
  mobile ad exchange. 

  To learn more or sign up for an account, go to http://www.mopub.com.
                     DESC

  s.homepage = "https://github.com/mopub/mopub-ios-sdk"
  s.license = { :type => "New BSD", :file => "LICENSE" }
  s.authors = { "MoPub" => "support@mopub.com" }
  s.social_media_url = "http://twitter.com/mopub"

  s.platform = :ios, "6.0"
  
  s.source = { :git => "https://github.com/VoodooGames/mopub-ios-sdk.git", :branch => "master" }

  s.frameworks = "CoreGraphics", "CoreLocation", "CoreMedia", "CoreTelephony", "EventKit", "EventKitUI", "Foundation", "MediaPlayer", "QuartzCore", "SystemConfiguration", "UIKit"
  s.weak_frameworks = "AdSupport", "StoreKit"

  s.requires_arc = true

  s.default_subspecs = "MoPubSDK"

  s.subspec "MoPubSDK" do |sm|
    sm.source_files = "MoPubSDK/**/*.{h,m}"
    sm.resources = "MoPubSDK/**/*.{png,bundle,xib,nib}"
  end

  s.subspec "iAd" do |si|
    si.source_files = "AdNetworkSupport/iAd/*.{h,m}"
    si.dependency 'mopub-ios-sdk/MoPubSDK'
    si.frameworks = "iAd"
  end

  s.subspec "AdMob" do |sa|
    sa.source_files = "AdNetworkSupport/GoogleAdMob/*.{h,m}"
    sa.dependency 'mopub-ios-sdk/MoPubSDK'
    sa.dependency 'Google-Mobile-Ads-SDK', '7.1.0'
    sa.pod_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/Google-Mobile-Ads-SDK/GoogleMobileAdsSdkiOS-7.1.0"' }
   end

end