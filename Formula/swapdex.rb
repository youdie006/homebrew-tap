class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.3.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "a3325a3eb8d1cd752e117a102a08d1e2f7f9b6ad2de8ee6274c361fee9a3aec4"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "6d39b6e41077f85b83e0eabc7db2ffff2c0af5354fb937976554f9b7af8d6156"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e99dc2be1bb6718905fa279318b4b1784056836b138a9713772002daa23afa5"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.3.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a88ccf86a3666c48b6dd3ef9e4364c9ac6b6e7e4caf4d021fee1fdd5fc54257e"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.3.1", shell_output("#{bin}/swapdex --version")
  end
end
