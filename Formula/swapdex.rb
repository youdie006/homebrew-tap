class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c9572babb5db36c3a3686e5bafbab8c73eb6b74d5384a2a38f6af60916e7c78d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1b3590741a5510c0fa65a6c850dbdbe07f725ddbd1e18aa17e6a04447963d2d5"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e541c5e4f7b4e61ab5cc3ff3a4a578b9ed8aee706fac05f345086d39d86515c9"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "95336d533f139bf5fdd42e69f0bc5b4ce36b3b5d5d81c9eecf3e2587e400e3df"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.5", shell_output("#{bin}/swapdex --version")
  end
end
