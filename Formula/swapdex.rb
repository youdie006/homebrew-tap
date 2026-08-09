class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.40.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "7b744f3eba0e48ff747abe873701bc2d14bc055f041d0e537f758512f4b8603d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "80efec8fe928a25fcd9d6080eeed0629b32be66384ba9efc063e84fddc86ca89"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5bb95ff114b62dbb389ae2c5fb2ea5b20a5c7e25370cbc9e1abb30d2a80d1382"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.40.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "340e34889b1ee35057533c3b44f749f8f65d49d95548594fe05616b58d15ba46"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.40.1", shell_output("#{bin}/swapdex --version")
  end
end
