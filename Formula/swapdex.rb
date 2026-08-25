class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.102.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.102.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "01d1f9fec932dda5cf9ca7478863d33864eb163d572e80c5ea493aaf57290800"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.102.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "337f438770a598d4b429beead2c091f20479ff07dff94cc31949de3122b24b4a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.102.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ec1be4ff0bb0cf937b72e869def5f99a4e74ad6ef040f4574c390dd5768ec89"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.102.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "635967f5085c042b8c5a68c258ff08053c0bc6de0fea330918d58509614cacd4"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.102.0", shell_output("#{bin}/swapdex --version")
  end
end
