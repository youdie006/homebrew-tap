class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.44"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.44/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c550457bb3ba8b134b3ceffe6ff59cb8fef461465ee898339aa9905ea7f5d271"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.44/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "31a1bb39cb5ecd94313920c4c9110abe0d84ed31f599fdd56d27792365df8b77"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.44/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "342d659cb4d1c7f4f9792f82b8314d6ecf5a704bb2ba2869ec2e1adfaa097b23"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.44/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "15398a6d6ef3186a630e7e6c545be2510b214b451beb1d78f71dfa213bb382c0"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.44", shell_output("#{bin}/swapdex --version")
  end
end
