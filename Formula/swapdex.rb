class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.74.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.74.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6fcaa79dfba7a07fabbecb03f2d6544089ded45de6fa437d34f8b840b8bff587"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.74.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0199762110c50e92e48c26f9bc38b6a835a374f3fafc5c4415442e4366525f4d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.74.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6d22708b3cf1c1837dc5abe3f22f0a947daa43dc20a96ffafe504586c1da9662"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.74.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f7708dd4d716cba7e82e47d1c00030b9662e2e53851d53b3cb3b7ef9bc83317c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.74.0", shell_output("#{bin}/swapdex --version")
  end
end
