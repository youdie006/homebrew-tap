class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.112.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.112.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "06a53e3f930851a91b3bdad1e0b481c1b6b6a0017865e40b64ff22496902023a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.112.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ab640840dd4675b2c69ea43b46906e6d7eb26e875428b53f2168a44dbe54bcdb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.112.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cff96a69feb1cb30e49279209513a807ac4c2fe5aba73bb91be4ec801d51ef16"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.112.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "373f094ff78f1c6e8be39aef382f5e157110ccaf3b102723d07ad326a510bd38"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.112.0", shell_output("#{bin}/swapdex --version")
  end
end
