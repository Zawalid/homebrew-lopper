# Homebrew cask for Lopper. Lives in the tap repository Zawalid/homebrew-lopper as Casks/lopper.rb.
# `scripts/cask.sh <version>` prints this file with the version and the DMG's SHA-256 filled in.
cask "lopper" do
  version "0.6.1"
  sha256 "9ba489f317d6728a784fd8176bc31ba006c82525d8f047e42aab6b7bfd708d67"

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
    Lopper is not signed with an Apple Developer ID, so macOS blocks it the first time you open it.
    Choose Open Anyway in System Settings, Privacy & Security, or run:
      xattr -dr com.apple.quarantine #{appdir}/Lopper.app
  EOS
end
