cask "neonsweep" do
  version "0.8.2"
  sha256 "2e7b2cdb817111f50169a55bc6a78d8112810354406103fce100e949ffc6e93a"

  url "https://github.com/davic80/neonsweep/releases/download/v#{version}/NeonSweep-v#{version}.dmg"
  name "NeonSweep"
  desc "Retro neon-terminal cleaner — free, open source, no telemetry"
  homepage "https://github.com/davic80/neonsweep"

  auto_updates false
  depends_on :macos

  app "NeonSweep.app"

  zap trash: [
    "~/Library/Application Support/NeonSweep",
    "~/Library/Logs/NeonSweep.log",
    "~/Library/Preferences/com.davidcornejo.neonsweep.plist",
  ]

  caveats do
    <<~EOS
      NeonSweep is signed ad-hoc (not yet notarized). If macOS blocks it on
      first launch, right-click NeonSweep.app in /Applications and choose
      "Open", or run:
        xattr -dr com.apple.quarantine /Applications/NeonSweep.app
    EOS
  end
end
