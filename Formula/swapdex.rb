class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.164.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.164.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c62324e7f66f61ba32ff495fcc9a31aba1abc57e942f00d1de2211facdabf2be"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.164.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9ee948ab983764ccd7cab2f2527e3a3d0dccad78d51cebeaa9d51f93c3de1356"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.164.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "825b600d5ab3ef7b60b6334e27b20a4b16b6da71a8278cdde0309455b4fdb07f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.164.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7e5ef50009d5f0bb6babf466ef4f7b9c558b034027b90fca67f77745cdf897af"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.164.1", shell_output("#{bin}/swapdex --version")
  end
end
