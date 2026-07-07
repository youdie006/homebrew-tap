class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.11.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.11.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "7fdba8e32af7bc454fcefb563b32e661f3e030fad6b9fc94bc7bf27efe7cb439"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.11.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "30fc991e47c3442962fd80cb3f3e8a69687b1d2aa8474ff2a83addf90dea70e1"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.11.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a27ae760ca93ba466a3de72b517cbd768bb53ef778db6191c8f7dbf834ad0ae3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.11.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8683d61a21f29055cddd5efa3eba31c1b1b31e6a849e71ccdf749ae42b5211c3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.11.0", shell_output("#{bin}/swapdex --version")
  end
end
