# frozen_string_literal: true

class GitGud < Formula
  desc "Install Git hooks for repository automation"
  homepage "https://github.com/eulegang/git-gud"
  url "https://github.com/eulegang/git-gud/archive/a9f1f5c34f313ef39a144f5d187ee09dc38ca303.tar.gz"
  version "0.2.0"
  sha256 "10ba3f33f23c008529d9bd03fb9f072eb71a7da2aea26a507f1169f5a36c73f1"
  license :cannot_represent

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "git"
  depends_on "libgit2"
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
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
