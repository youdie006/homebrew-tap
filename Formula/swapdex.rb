class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.33"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.33/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "10174e3b2770eadb559ca1e33b1c5f3253e42732c82234bdb28b9d5e552ac694"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.33/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "959863f28c003b26fc77e12143100784ad1d2f93c0dd631892e61a55ebdee0b2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.33/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51fd6bdcdf5a4031df313a27f76abaecdde591cf823052ce397b0e99ac0671d1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.33/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "65ad9a47e05e721b4330af8bcc6f865f7f28903365a9128fb65ca9f6949c75dc"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.33", shell_output("#{bin}/swapdex --version")
  end
end
