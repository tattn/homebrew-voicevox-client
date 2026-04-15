class VoicevoxClient < Formula
  desc "Unofficial VOICEVOX CLI for macOS"
  homepage "https://github.com/tattn/voicevox-client"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.2/voicevox-client-1.2.2-macos-arm64.tar.gz"
      sha256 "9b39bc52d5e47d9fdc539cfdfa47f860b48a1cae310bb74604d497dee3f06c7f"
    end

    on_intel do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.2/voicevox-client-1.2.2-macos-x86_64.tar.gz"
      sha256 "a0233944cf8934642e0af92a4f19cc122df7f9688345e0e5d4fb5ff63f7be2d3"
    end
  end

  def install
    bin.install "voicevox-client"
    bin.install "libvoicevox_core.dylib"
    bin.install "libvoicevox_onnxruntime.1.17.3.dylib"
  end

  test do
    output = shell_output("#{bin}/voicevox-client --help")
    assert_match "VOICEVOX text-to-speech CLI tool", output
    assert_match "setup", output
  end
end
