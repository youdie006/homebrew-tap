class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.64.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.64.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "9fe27d216d007e5265cae87793c9c1d4b4e3258fb8d2368e2460be6f913fba57"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.64.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3c69fc30872e31d527e38151f8447c8c926e93dc5eca7c40d9ad3e99a21e401b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.64.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0d258a66190e0fbf9213c5b463c44a4d6eecdf0530709b2ea93a5ddcfaa48baf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.64.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f462968178edf1eda9c0c3ea0e6c557a7ef425d65590ba4934a4bd0cdd03247f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.64.0", shell_output("#{bin}/swapdex --version")
  end
end
