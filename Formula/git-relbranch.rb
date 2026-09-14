# frozen_string_literal: true

class GitRelbranch < Formula
  desc "Find the relative position between different branches"
  homepage "https://github.com/eulegang/git-relbranch"
  url "https://github.com/eulegang/git-relbranch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ff33af35bb154d87fcf63bffcb02ce1945f30ead833315afccfd4f0220a0b398"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"

  def fetch
    system "cargo", "fetch", "--locked"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "git", "init"
    system "git", "config", "user.email", "brew-test@example.com"
    system "git", "config", "user.name", "Homebrew Test"
    touch "README.md"
    system "git", "add", "README.md"
    system "git", "commit", "-m", "initial"
    default_branch = shell_output("git branch --show-current").strip
    system "git", "checkout", "-b", "feature"
    touch "feature.txt"
    system "git", "add", "feature.txt"
    system "git", "commit", "-m", "feature"
    assert_match default_branch, shell_output("#{bin}/git-relbranch")
  end
end
