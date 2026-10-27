# frozen_string_literal: true

class GitGud < Formula
  desc "Install Git hooks for repository automation"
  homepage "https://github.com/eulegang/git-gud"
  url "https://github.com/eulegang/git-gud/archive/e6339129060f4c68bc83d4edd2de21e2e449af5b.tar.gz"
  version "0.5.1"
  sha256 "63647080cda9d261e140a3be4c4b9377918dcd8ae7c71169754b9f744f49eff7"
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
