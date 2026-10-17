# Homebrew formula for the lop command line tool. Lives in the tap repository Zawalid/homebrew-lopper as
# Formula/lop.rb. `scripts/formula.sh <version>` prints this file with the version and checksum filled in.
class Lop < Formula
  desc "Safely remove branches, worktrees and generated folders you no longer need"
  homepage "https://github.com/Zawalid/Lopper"
  url "https://github.com/Zawalid/Lopper/releases/download/v0.3.1/lop-0.3.1-macos.tar.gz"
  sha256 "322dd43fcc3f8152cd9f1558cf7befd9f7c9d4d080d22918c876e4f77b3598a7"
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
