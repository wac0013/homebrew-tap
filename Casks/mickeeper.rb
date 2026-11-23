cask "mickeeper" do
  version "0.1.0"
  sha256 "442068cbb4b4fe4ba67d726d936eb5c44fa2f22666feb8b98c40c089c7049fb5"

  url "https://github.com/wac0013/mickeeper/releases/download/v#{version}/MicKeeper-#{version}.zip"
  name "MicKeeper"
  desc "Menu bar app that keeps Bluetooth devices from hijacking the default microphone"
  homepage "https://github.com/wac0013/mickeeper"

  depends_on macos: ">= :ventura"

  app "MicKeeper.app"

  # App com assinatura ad-hoc (sem notarização): remove a quarentena para o Gatekeeper não bloquear.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MicKeeper.app"]
  end

  uninstall quit: "io.github.wac0013.mickeeper"

  zap trash: "~/Library/Preferences/io.github.wac0013.mickeeper.plist"
end
