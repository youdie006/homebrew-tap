class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.56.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.56.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "d9c77ebda62079ec67f4f0a8eedc98a95c373d42b1bd301e7d474c841ed7af8f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.56.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "c02a97a1e39a7dcb053f7c272f9f509810b7621818822c2ff75afcb43ab53235"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.56.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ca23648f82c2efc0156b56973402c650467a443fb53b1698d896273ff46c0df"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.56.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da6afd31e5a08c33a32d36e93a9b99ae61cb1a77948eef7090872a597b17402f"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.56.0", shell_output("#{bin}/swapdex --version")
  end
end
