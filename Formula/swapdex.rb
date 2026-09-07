class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.151.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.151.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "339243f11f303f324a566f3af54e4e6ec2136687e22daa4507de6e3c06ecd718"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.151.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c202d06371bb1f3db984be5721645b24a6c8f18fc377b3313ffa045253854a03"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.151.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2903245139e4d0db3664fa355f88d35d27ec40a9764dd63c341265e0c1bc8033"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.151.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ddc5b83121017c6beb1f1f264088daa92372e711299c009c226a46494d83e4b6"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.151.0", shell_output("#{bin}/swapdex --version")
  end
end
