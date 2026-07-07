class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.12.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "ba88b13e988b87135d93c528ad5f111d6f160952ffcedcc14b64525342d274db"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "83c46d154cfb14f8060b8a80dda360d1d20524744069c6c22eb97504a58ffb37"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd98f4baa033247e72f6879ed01f2b3d34d735896dbad5e5bd17cfe138eb9c65"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.12.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6aa87572a8e25cd725786c25bf80432f7f3a0dbd7ce11d064095cc078c19518b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.12.1", shell_output("#{bin}/swapdex --version")
  end
end
