class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.50.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.50.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "7923c2022d58a74423197ffdc60b8139e2ac5c0028ec9de5afe2c3d828dc94f0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.50.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "520d4f5692463f402dfcaf682eba6fad133f79cda4df986c0c9a408ff708fb57"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.50.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c991a8ed0c6c8592f539e447155546a4771efd286ba37ad5d71ece1efc522b9a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.50.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c35bbd15bdf928aefd225d7ec16245e6a35c8ddbd48d1c540ab0ada093d521a6"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.50.0", shell_output("#{bin}/swapdex --version")
  end
end
