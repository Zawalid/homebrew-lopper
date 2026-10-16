# Homebrew cask for Lopper. Lives in the tap repository Zawalid/homebrew-lopper as Casks/lopper.rb.
# `scripts/cask.sh <version>` prints this file with the version and the DMG's SHA-256 filled in.
cask "lopper" do
  version "0.1.0"
  sha256 "96b8fba5d8eff0efd3375220cb5552adaf31c494faedeb68acfe8a357e1650df"

  url "https://github.com/Zawalid/Lopper/releases/download/v#{version}/Lopper-#{version}.dmg"
  name "Lopper"
  desc "Removes branches, worktrees and generated folders you no longer need"
  homepage "https://github.com/Zawalid/Lopper"

  depends_on macos: :sonoma

  app "Lopper.app"

  zap trash: [
    "~/Library/Application Support/Lopper",
    "~/Library/Caches/com.zawalid.lopper",
    "~/Library/Preferences/com.zawalid.lopper.plist",
  ]

  caveats <<~EOS
    Lopper is not notarized yet, so macOS asks you to confirm it the first time you open it.
    Right-click Lopper in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine #{appdir}/Lopper.app
  EOS
end
