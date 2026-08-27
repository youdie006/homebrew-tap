class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.120.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.120.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "07fa700a75713bf66bb1bd93396f8c9d65207bfe5dff8e914c7bd64726c1c65a"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.120.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "ed5e5b59da65fa248e26dde33f40a8582724a9d9104002d397581df4e0bfa282"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.120.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "76b530a0df11afe203dc807d5c5af3fbc68b849ef913ed8389d9d75199a0b9d0"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.120.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b56bd61401e1a74b8030ed7c5f4b179b3e42226ac35fad4d46250678da4e44af"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.120.0", shell_output("#{bin}/swapdex --version")
  end
end
