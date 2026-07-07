class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.4.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f84309960058037152120f858e81acb6687fa8920545fc349644ebd79a358fae"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "24430a52ffc83b8e2baab2e583e6575383f71de024fb3f5843863bfe045a27c5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e66be3957f79ed3ed64b897414cc61a16e4cd190e8a157c54e74a84d02ba5145"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.4.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec3c75e231effdc15cacd0ececdabe34095be53b2f54f622131ed9fe6f542be6"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.4.1", shell_output("#{bin}/swapdex --version")
  end
end
