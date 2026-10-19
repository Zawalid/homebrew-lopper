# Homebrew formula for the lop command line tool. Lives in the tap repository Zawalid/homebrew-lopper as
# Formula/lop.rb. `scripts/formula.sh <version>` prints this file with the version and checksum filled in.
class Lop < Formula
  desc "Safely remove branches, worktrees and generated folders you no longer need"
  homepage "https://github.com/Zawalid/Lopper"
  url "https://github.com/Zawalid/Lopper/releases/download/v0.5.1/lop-0.5.1-macos.tar.gz"
  sha256 "b9d37f7a29f3ef4f50649262996551b328a94cf6975a3c82b6ebd14958df0425"
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
