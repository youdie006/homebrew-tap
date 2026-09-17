class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.7/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "efd761708628fbda1033d36cabe297d281fa72d20459b50d1e023ee406f4828d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.7/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0b3e84771fe8d085586459ed20d7396b4b54f26661aa9b6ef21df19be065c3d9"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.7/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "95479af0f8657f163c09b49cd0bf3dc4831cb046d3aff51383577868aaa5da9d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.7/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f66848e6f8724277c382eafdc2af7ba37721d010e274b7683d69702582bffc3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.7", shell_output("#{bin}/swapdex --version")
  end
end
