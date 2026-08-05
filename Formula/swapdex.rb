class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.35.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "985c56aff57e258bbfcec9a2c34202590bbdbf8891c857172ee6cf8d404fcd8d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "79cd17af798adddcd48c2135e23117f068ced67e9f0b467d121b4e08f0e9387d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a0925b399043eb108caf26ff542cb6ac3626a71356fe5edd9edd38c472c919f5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.35.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7aa6adf82ecd37f22c8bc645257d51d27c005ae806c55f16df63fe2b2acc3088"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.35.4", shell_output("#{bin}/swapdex --version")
  end
end
