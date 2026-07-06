class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.9"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.9/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "fe4da4d84ed44d154373c1bf7d03fd02ddcedcd4c7d559f403ec67e8829a92f3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.9/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a9e857ba891469c78e11f4a64b830b5b387b0421e6f45446ad89c8070cd18fcf"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.9/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d5ed1b2a031f215d39538ef1804445fa9249f76e730cd827662f3d520f8ce4f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.9/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "83acd3b283cb8239301983024309f3c8ac671ac1b44a66d790094161c719d281"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.1.9", shell_output("#{bin}/swapdex --version")
  end
end
