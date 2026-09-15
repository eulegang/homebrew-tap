# frozen_string_literal: true

class GitEach < Formula
  desc "Broadcast commands to many local Git repositories"
  homepage "https://github.com/eulegang/git-each"
  url "https://github.com/eulegang/git-each/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "33cf07c018c7137cc9d27a00ae4063948bd1e58e056fb17b097f80be8f6a7e94"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "git"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "git each", shell_output("#{bin}/git-each --help")

    repo = testpath/"repo"
    repo.mkpath
    system "git", "-C", repo, "init"
    assert_match repo.to_s, shell_output("#{bin}/git-each -D -d #{testpath}")
  end
end
