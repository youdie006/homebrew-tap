class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.37"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.37/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d9a2d9a4a21a2f3d50ccd9b47f344e61732f412eeda47efd13c80bd2253150f2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.37/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "30ac12703c11b404a8e0dc78bee1aa8b356164ca0a208a7d2a03bb243e5f7ad0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.37/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d3b31344b00362ff94c3c0352c3b58b94e7238d2c1764559d3aca0c536179b0e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.37/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d9c3f0658cc49020ef30f430f76b9efd3ec5d7415e4ed61105f0a3e1aee6778"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.37", shell_output("#{bin}/swapdex --version")
  end
end
