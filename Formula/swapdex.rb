class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.165.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1049c37d9bbd1457510d8dad00bc8f4e3804b098af24805ab1a695deeeb05777"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "341a391d8d26497f3b03fe010b3af1688903f8ddfeddfa54891189179436a181"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "715d1db2e1170d58ce152d5a62d44efe5c8c6a4d02a634b237f09d8916867643"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.165.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b947d58905c29955181e4d043a36329c4d165ff002d08955f61b067a3c7f745"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.165.1", shell_output("#{bin}/swapdex --version")
  end
end
