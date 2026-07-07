class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.13.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.13.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "334d665617b47cd6007ba7fa9b264657a6394b0797f6242ffb9dab5d253f90c7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.13.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "80948d006160151c9561ba5b42559629f3cb2dae9b5945c90e5998cb1c7fb665"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.13.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2bf66d74bc6d28ce2d8f5f45e060397a4c8b4f5e378a00c9045807a5286397e2"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.13.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc8472b3d6d83b2ca62436fb1fd4b7d15408fcbf0cf7f766223523ee78087656"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.13.0", shell_output("#{bin}/swapdex --version")
  end
end
