class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.111.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.111.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e210e9e3ca261bab64c9b8e3133ca811b27276343b22770b5d6aaac841720fd8"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.111.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c383d47dc844466791a8600393e897e371266c27cee11254ece776b93ada9287"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.111.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "233391d289955cd78739807ea3830271ef089bd057810496bf7293a53155abdf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.111.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8967d63faa1961fbd3e8f796f1a649b876d8f37fdb7ea440d99ad50f40781ad7"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.111.0", shell_output("#{bin}/swapdex --version")
  end
end
