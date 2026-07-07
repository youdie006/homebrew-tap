class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.6.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.6.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "6508649b4e9cb39fce16fc02d66652eff31c62859304fb66a15409fdd04447af"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.6.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "b1dbf46e598713d4c9059e10615339b2cd1400b5a60fa4367d0046fa8879dcc9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.6.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fc41dc5e76976ea372bf8abd9f15f3e3639ff49d53ab5ba2fef071c02c95a8b0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.6.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b481beb860935c04eff79569d1600118f175869ed68b2c26f78852a2b8fad08c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.6.0", shell_output("#{bin}/swapdex --version")
  end
end
