tests: sort lint units

ci: bootstrap lint tests

units:
	@/usr/bin/xcodebuild -project TimeFrame.xcodeproj -scheme "TimeFrame" -destination "platform=iOS Simulator,OS=11.2,name=iPhone 8" test
bootstrap:
	@/usr/local/bin/carthage bootstrap --platform iOS --no-use-binaries

sort:
	/usr/bin/perl ./bin/sortXcodeProject TimeFrame.xcodeproj/project.pbxproj

update:
	@/usr/local/bin/carthage update --platform iOS --no-use-binaries

lint:
	/usr/local/bin/swiftlint autocorrect
