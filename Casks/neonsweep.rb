cask "neonsweep" do
  version "0.8.3"
  sha256 "b6434260b40374b25ededee2afb7b5c925c616f1d8f950a18034566c39bcc9d3"

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

  caveats <<~EOS
    NeonSweep is open source and signed ad-hoc (not notarized), so on first
    launch macOS will say it "cannot be opened". This is expected. To allow it:

    EN  Open System Settings > Privacy & Security, scroll to the bottom, and
        next to the NeonSweep message click "Open Anyway", then confirm.
    ES  Abre Ajustes del Sistema > Privacidad y seguridad, baja del todo y,
        junto al mensaje de NeonSweep, pulsa "Abrir igualmente" y confirma.

    You only do this once. Or, from Terminal:
      xattr -dr com.apple.quarantine /Applications/NeonSweep.app
  EOS
end
