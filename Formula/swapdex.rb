class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.160.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.160.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "eea8a20ceaeff9d760b85b702a23863622de993a7f3d9e1eeee83feec3da44d1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.160.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c184a5b78061ffe68cd80b22955d350ee750194b902fce4b2881d8d3f3fc75ea"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.160.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f031d7324691ca0c78dae9c8e1384dfde586ce52c6acee3166ede0d8fc65c42e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.160.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "338c68c4e7b98cb372e88db7c1c2fc857b4dada223e8d7d2aaa23febeec2285c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.160.0", shell_output("#{bin}/swapdex --version")
  end
end
