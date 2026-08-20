class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.73.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.73.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "29cf9bf1bca6cce3b515e9a218831204484e62b9c6ccd6561fc0b0a05c62dbdb"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.73.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "08d6305d4e2f5c62ed08fa5cf11a88008e3d581ceba7267892dff68b79dc474a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.73.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "792397c86e564ffb5b8f60ddb657d389a55bb877b1974bb42d16a18e50b0d117"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.73.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "330f35090c0ab147b170166d9319147bfca565fa8ef921138fa4c32368600ef2"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.73.0", shell_output("#{bin}/swapdex --version")
  end
end
