class GitSweepRs < Formula
  desc "Clean up merged Git branches locally and on the remote"
  homepage "https://github.com/leo-yi/git-sweep-rs"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.3/git-sweep-rs-macos-arm.tar.gz"
      sha256 "3ee470ca441f8e65e67dc9c471c0283fc5622e79e07a996f4000490d1ed1ee3c"
    end

    on_intel do
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.3/git-sweep-rs-macos-intel.tar.gz"
      sha256 "54160dc3f4c12b78c7ceef30c1f1b2a1ce0aa863280bdf3bd78b3723a29e2d4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.3/git-sweep-rs-linux-x86_64-musl.tar.gz"
      sha256 "8bb822348c8a625207d64ee7ada132f8811e0009422da495ed29c8cd3de91889"
    end

    # 上游暂未提供 Linux arm64 预编译包，回退到源码构建
    on_arm do
      url "https://github.com/leo-yi/git-sweep-rs/archive/refs/tags/v1.0.3.tar.gz"
      sha256 "795d727dddd673ca2a2c1d2a728a7a0dd786a505ba0257c1e65d40bfe536b10a"

      depends_on "rust" => :build
    end
  end

  def install
    if OS.linux? && Hardware::CPU.arm?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "git-sweep-rs"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-sweep-rs --version")
  end
end
