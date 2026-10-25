class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.27"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.27/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d59714c3cd4f0c861748e04e243965a819c1529fa225800fd63509eed427da9c"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.27/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "78fa461f987601abc76a38bbb945ccdd006c040ab3bd9c4457fa7875c79504bc"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.27/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "290fa50eaf52964ffa022ddab6384784dba628a95a4f976d2c703bbefc80a995"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.27/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae70c9cf6cb36bff2b559ea1fd9bd5550c9a1ed536ff0e438cc9da0a9e89a2a0"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.27", shell_output("#{bin}/swapdex --version")
  end
end
