class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.4/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "292da1b9f6791493cf4a3f9b35f91e87d281c4553f686cc91c03a96dce3a58cd"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.4/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "7ad07eda0e3bbc608e36e72064dd6eb4f7c3a3f4bb2ba26691fadb3d13b9b6af"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.4/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4d52ae113959e8a08de70c95d5bc6fc2af1b517d2479dae72aadf0ac63a457fa"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.4/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61c4dbe65a777e0dd621ac86e229f25d42b65c538bbf97a0fbf18e6604a3b980"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.4", shell_output("#{bin}/swapdex --version")
  end
end
