class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.130.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.130.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a378c44c3494f9529b3cfe07ec83c4e37aeb5941e6a899024597afe0f2b7998c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.130.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "d573b7504344ad661820d216a4f58410fd9c0e2fb0854d1dceeb163403e46580"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.130.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac271b26a134cf6833c3edb836221e5167ad275e6dcfae90b6102981eb5062d4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.130.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36594ca0411a86ccba7596c4c4cd31d235460bb1dbecbce9f586532005f231af"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.130.0", shell_output("#{bin}/swapdex --version")
  end
end
