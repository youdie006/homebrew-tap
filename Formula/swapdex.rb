class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.147.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.147.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "216658363908dc34a029e009fe556b6fed1f12de9f771093106e94c1a48edcd8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.147.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "1ba36fab34d9116e9e2db5cbd1579ade60271b87b5ed5b53f8f0b8988c94d70c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.147.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d307fdef59defded98f81f2d5a9d42cfb5338aa02bcd1a66421ba8d796ce2c7d"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.147.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b6a5c545e8c2b969d9a9cceee62bf5d9a994f026bf78b612a4cf8eb84e03294c"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.147.0", shell_output("#{bin}/swapdex --version")
  end
end
