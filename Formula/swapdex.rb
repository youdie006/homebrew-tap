class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.28.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.28.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a2b656cf7b49ce6d7718209e7a2ee91e432b0349ce370c3b4e5ff2bb98480841"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.28.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c0a0da34d95962aeed029668adeba3ef935192cac10ac714eb40f7acdc461067"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.28.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2856d8553ea90fdea13c7f29d3195c08b828d905639e6186560056c8da0e56ad"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.28.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4bc9c5ed6e5579f5e421b9592ef2005fc89a136b832502d938f81cd61c54b04b"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.28.0", shell_output("#{bin}/swapdex --version")
  end
end
