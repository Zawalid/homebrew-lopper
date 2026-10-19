# Homebrew formula for the lop command line tool. Lives in the tap repository Zawalid/homebrew-lopper as
# Formula/lop.rb. `scripts/formula.sh <version>` prints this file with the version and checksum filled in.
class Lop < Formula
  desc "Safely remove branches, worktrees and generated folders you no longer need"
  homepage "https://github.com/Zawalid/Lopper"
  url "https://github.com/Zawalid/Lopper/releases/download/v0.5.2/lop-0.5.2-macos.tar.gz"
  sha256 "173274e4f8a689928377fa07d8bfbc8ec3548721d1f6d1caf92bddb0a80019d1"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "lop"
    zsh_completion.install "completions/_lop"
    bash_completion.install "completions/lop.bash" => "lop"
    fish_completion.install "completions/lop.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lop --version")
  end
end
