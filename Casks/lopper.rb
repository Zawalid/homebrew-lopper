# Homebrew cask for Lopper. Lives in the tap repository Zawalid/homebrew-lopper as Casks/lopper.rb.
# `scripts/cask.sh <version>` prints this file with the version and the DMG's SHA-256 filled in.
cask "lopper" do
  version "0.3.0"
  sha256 "97ec63c20b781a0f86ee896b8a23694469f1d47868df186c7ba8010ec66b57e0"

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
