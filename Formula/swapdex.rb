class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.136.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.136.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "cc2f5d442b8026d64cd4cf4f3a9d75bd4bcaa41abf27ef432ada2ab7529c3125"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.136.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "345d5220b646bf2a9b0db85dbe437d70fbde5980cafd718ced4d5b0797ec9e82"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.136.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "217ada49005ebe5823295da8ffbd0412e0bc2bc6c28a45fc2c8bdf9d791b61ba"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.136.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "08fc975c069504936790eb2784a83a826f52e5d029724a6e20dfae830c1e840f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.136.0", shell_output("#{bin}/swapdex --version")
  end
end
