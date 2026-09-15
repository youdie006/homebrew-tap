class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.2/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a22efd97770f227f44afc8e750927e5e25b0934ea612b9a51dac4af9f761302b"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.2/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "44952dea98a5fefd087e3e1c46871c47e81097180387a4b6b4ee866da5aaa380"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.2/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "12fff6b55b316f5a81f82021090135cd2233d01e089b4352c85c51404270627e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.2/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5e567af2289cb16c9ef913d1b2eeb744e6a42dc091ce0a20675139c015e3dde"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.2", shell_output("#{bin}/swapdex --version")
  end
end
