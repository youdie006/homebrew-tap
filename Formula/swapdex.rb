class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.24.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.5/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "faccbe115dbbf2a2b096bfbe9a405ee428c5a15d98bc38bd078590bff059a853"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.5/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "41e1a31d1bd07bc401eea50cb7b87a9315aab7af6ebe1e288ab4da72ef9c9669"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.5/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c1625db3d91fe5c933ba81de29b7645791659361e3c696e0acd471585bf075b1"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.24.5/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5a1c626606f282f8e89e0173398247a078defdb1ea0fc83471e3546caf5b4a3a"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.24.5", shell_output("#{bin}/swapdex --version")
  end
end
