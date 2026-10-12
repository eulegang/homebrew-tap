# frozen_string_literal: true

class GitGud < Formula
  desc "Install Git hooks for repository automation"
  homepage "https://github.com/eulegang/git-gud"
  url "https://github.com/eulegang/git-gud/archive/367d438e10a4e06ca39ffec8f70fec4b2e66fd86.tar.gz"
  version "0.1.0"
  sha256 "bfba0650db0e6dc99168600e61d7aba639081c54f5446e49c24f3db4aaacfbb3"
  license :cannot_represent

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "git"
  depends_on "libgit2"
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/git-gud"
  end

  test do
    system "git", "init"
    assert_match "cmd: #{version}", shell_output("#{bin/"git-gud"} version")

    cp bin/"git-gud", testpath/"git-gud"
    system testpath/"git-gud", "install"
    assert_path_exists testpath/".git/hooks/git-gud"
    assert_path_exists testpath/".git/hooks/post-checkout"
  end
end
