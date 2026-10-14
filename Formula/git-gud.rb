# frozen_string_literal: true

class GitGud < Formula
  desc "Install Git hooks for repository automation"
  homepage "https://github.com/eulegang/git-gud"
  url "https://github.com/eulegang/git-gud/archive/cb77b31957d3716200624457822527b0423fcd3b.tar.gz"
  version "0.1.1"
  sha256 "130eaee6bdb31d6f34c51047867d495c3f17627c792bfaf0228a9172d5d15194"
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
