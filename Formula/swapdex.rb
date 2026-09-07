class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.149.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.149.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "31bbb776689058e3ea1321af64bdd98ff7d76e37610e22a5912cb8dc9b29309c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.149.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "a00662adcda80fd6cffff4db927fd7bcd7df73c9e2b50b1c1fffcccb97861d6e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.149.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ed606803e0d0b0b99613fd1cd6bf4aeb1c0f4af539b78828500f3f137095ab3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.149.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f07e99b936075d66d651a52b5d2d9c91f8b2fe91b61c1d6af9c275af4b71a85e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.149.0", shell_output("#{bin}/swapdex --version")
  end
end
