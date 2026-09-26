class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1a278fa8ab4b76299ed6049ddf8dcfaa10f36afa565325111502a84c14f683ca"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "11db6bce97c59639a582fa8513a212064561385ee787cc0d9ec7c4477eeaf9b9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "037b307283542485d3558dd438c8d8529e06cb084484ac85f1050eb1861da707"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4c7eddb546f5179249537155e8bb1678f22412b86df894a7080291d5f19c6c7b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.2", shell_output("#{bin}/swapdex --version")
  end
end
