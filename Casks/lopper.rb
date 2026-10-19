# Homebrew cask for Lopper. Lives in the tap repository Zawalid/homebrew-lopper as Casks/lopper.rb.
# `scripts/cask.sh <version>` prints this file with the version and the DMG's SHA-256 filled in.
cask "lopper" do
  version "0.5.2"
  sha256 "e28ec6cc48b5d074d045d5146d0328a38af0d24550f51d465ca6b8c9fb9398e1"

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
