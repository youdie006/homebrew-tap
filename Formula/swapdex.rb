class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.146.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.146.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d6a7eca3b96112753019c8358838279ba07cda582b080844aadc40eae5b4bdda"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.146.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "28445d562a229ce2383d12e6eeaf75aac0a4739d166f4a7caa1079673bcf69b9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.146.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87a83d29ddd83ddafe669524e438b18b5cb9e00873ebe06274dab800cab10bc6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.146.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a8b3a84e878c58fc2f0781c2ef936f9a2e87b0720e53db147012eb385e85034"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.146.0", shell_output("#{bin}/swapdex --version")
  end
end
