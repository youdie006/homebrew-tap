class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.23"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.23/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "c5506e079b1965c96ab3e45a33640e65cd618304bfb2fec5b9e77644af4dbcd3"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.23/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "fb1d99579db92b476297e7895c676d0770178121ed49bc14e6d837b5b3469449"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.23/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4b060498b9e73048366c5da2bbe7aaa386d9fb25fde97b1c58fae3595cb1052e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.23/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "259bceb4d832294a7a3669968197e6c8ab3703bfdbdd775fcfeef5b14b0dee91"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.23", shell_output("#{bin}/swapdex --version")
  end
end
