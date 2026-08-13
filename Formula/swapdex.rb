class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.60.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.60.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "3e918d5aa74c7d44acd7ac6d4597255d8525fb81ccedb2c1376416a2584b3fe4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.60.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "9bb29dcb3895093185fdc1117bfc258703bc3b3e537b4103222f93926e68652d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.60.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f22752862dd2c4b054612215129e125830c2bfbe7a2e051ddd71aeeb182c707f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.60.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67fbf5465dc650ae9c1449e0cce256ff71374a403aec3a8f5c2fe60db9212c77"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.60.0", shell_output("#{bin}/swapdex --version")
  end
end
