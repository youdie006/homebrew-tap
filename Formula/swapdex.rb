class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.16.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "41b6a99b3ce9662a40490cf43586549f96c41b136e960f2d79d266487a676e83"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "45c331b35f6dd160abc715eddf54a6cf59d579f28df144a7d9164515120b7b74"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "75731ca87927e273e3f4ad50df1ce60f1327238f12f31c51faed3bdba266a052"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.16.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "99f2d541426117682723988cd213c4754d26fa82c704a0d037305364877f7cd5"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.16.0", shell_output("#{bin}/swapdex --version")
  end
end
