class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.65.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d6d4149eef8bab39f1c48f5287b549ae9b53db72be0a6953c6d3bb56b42fc9c6"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4600b70cb55ff24f45279e7a75c736fc6584ffe23a20419d967742814a12611a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c0d4424d670608dd30b340bc281d01083ea0ec774b236ac8f73a45e4f8f677c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.65.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0c295d8e9d972d01348a84dbc506f6697336a5ff27bed517386c42acba834feb"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.65.1", shell_output("#{bin}/swapdex --version")
  end
end
