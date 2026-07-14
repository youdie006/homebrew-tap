class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f07c962b371af52f0a2f3fc56146df1a54e05aa773013947ae9d7da0f7052e2e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "11f0c21a8368cd21f1f2b5d245686c19378ac6364dd29efe2157fc8ca1248c27"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "075e2a3bc3a82c609dad44bb4c8ff06607691cff0bf9a6a94120c79ae5ea4357"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "09926c5ec3e16fd41e875bddfb993c52a450f62133825bca7999576a60705937"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.3", shell_output("#{bin}/swapdex --version")
  end
end
