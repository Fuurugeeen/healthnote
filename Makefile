dir=${CURDIR}

# make 〇〇 でコマンド実行（make ff）

ff:
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

ffw:
	@fvm flutter pub run build_runner watch

fc:
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

oi:
	@open ios/Runner.xcworkspace

# リリース用
frelease:
	@fvm flutter run --release --flavor production -t lib/main_production.dart
