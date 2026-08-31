class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.131.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.131.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "75f70487b93f3666847db3610afea53d976535c9bfda390a46d79cf52e7fa602"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.131.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "36189db7a19d89faf48b0be4e32d70e50a68f1b776000bf34c3bf389ae138c9c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.131.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "353f5d02a39c4ad8c8d3466784ab75086e6812db94a9080efd1c36cc38c9f3e5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.131.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eb3a3de185d7e346c2bb4a50dde90a2e567e49ba832d6ca6af7c2539c46ae967"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.131.0", shell_output("#{bin}/swapdex --version")
  end
end
