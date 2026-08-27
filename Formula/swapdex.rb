class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.114.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.114.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a3e3056e783b4bfd1f837654273f7318a501c70340325e545e57b01c32026915"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.114.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0002b34c0dc6bd52109f59b57160290b698c468c74cb37b3ca7290ba9d55656f"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.114.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f48f9d38353576d9a2344cb50d65a1266b411db5078dc5600f916f1952bedaa"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.114.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4ebe6b5731bb09874330a4ffffb4e13d9cfd52f4b0e6ae85ab720e1288e33af"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.114.0", shell_output("#{bin}/swapdex --version")
  end
end
