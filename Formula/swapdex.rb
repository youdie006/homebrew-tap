class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.42"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.42/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "894e7db9009696a29b8832c889734ffb9bf8772122691c1c8dea59db9ff26a03"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.42/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "436662a4c04027db8b99a89366e6f6c4ecd0bae7ed3029cf6423f7e930706ec8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.42/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e368885ca8388f1f1b90c09d395a235d9df1c132379cacc781a6938711f278d4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.42/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d11816c7173745be0ae685c5173ea777d9908126d23876f3a16b85774f517c12"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.42", shell_output("#{bin}/swapdex --version")
  end
end
