class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.25"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.25/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "4c979e02aea9d6e98c6c25ec884a82b8f6ebf0f53dda05359688267ab8f6944c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.25/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c5163ff2597fa076bee04a989d82fb2bc8b681b4a34483d6b323cae76aa85a17"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.25/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa6fc323799188adc915f557bd7719330715e2a2c4461979740ac578a326ffb4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.25/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2f6d2401c2dc9c9c7927b5c18ccccd29f6e7308900092ce86faf0f5595bdd20e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.25", shell_output("#{bin}/swapdex --version")
  end
end
