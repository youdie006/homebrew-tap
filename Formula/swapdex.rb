class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.3/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "eaa40fa898cd84d40b6fcd2fa8271012f1ecc681522dd3e64083dd0e203a8a8c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.3/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "31cab08063b022df1fa7a7df227d3c9e5dd16620cad2e9f44c1192d92b647b91"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.3/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ae5ed5514b798c98003b382d7cf9d444a3eee5ff31ef4fb59bd4689024627b6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.3/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73e9b8739e475190c60d00c92aa941c8f3a576aab394a3796af6df8bede6b3f2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.3", shell_output("#{bin}/swapdex --version")
  end
end
