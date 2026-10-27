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
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.2/git-sweep-rs-macos-arm.tar.gz"
      sha256 "0ab0ef068f72c399c4be7761e4de36a8a1685d742fb2ffe9a8d570003368cf7a"
    end

    on_intel do
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.2/git-sweep-rs-macos-intel.tar.gz"
      sha256 "7bf45bfd8f7b07817e24fdc78da7b0cd604f5a1750d13d77333a6202df1c8a8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/leo-yi/git-sweep-rs/releases/download/v1.0.2/git-sweep-rs-linux-x86_64-musl.tar.gz"
      sha256 "0918ebe255758f41592557249c0b2e055237682ada6925995565c2c32e5cedec"
    end
  end

  def install
    bin.install "git-sweep-rs"
  end

  test do
    assert_match "git-sweep-rs", shell_output("#{bin}/git-sweep-rs --version")
  end
end
