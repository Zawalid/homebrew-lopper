# Homebrew formula for the lop command line tool. Lives in the tap repository Zawalid/homebrew-lopper as
# Formula/lop.rb. `scripts/formula.sh <version>` prints this file with the version and checksum filled in.
class Lop < Formula
  desc "Find and safely remove the branches, worktrees and generated folders you no longer need"
  homepage "https://github.com/Zawalid/Lopper"
  version "0.2.0"
  license "MIT"

  depends_on macos: :sonoma

  url "https://github.com/Zawalid/Lopper/releases/download/v#{version}/lop-#{version}-macos.tar.gz"
  sha256 "4338b3f563cd9ec00e7103da8276ca715e10de03cd322859929263a1d6f172a0"

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
