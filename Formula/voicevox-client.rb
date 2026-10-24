class VoicevoxClient < Formula
  desc "Unofficial VOICEVOX CLI for macOS"
  homepage "https://github.com/tattn/voicevox-client"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tattn/voicevox-client/releases/download/1.4.0/voicevox-client-1.4.0-macos-arm64.tar.gz"
      sha256 "5cfac5fc0be39d9deb2fe97ea209e481c6a821f17b456e73d36b4f43350c4aaa"
    end

    on_intel do
      url "https://github.com/tattn/voicevox-client/releases/download/1.4.0/voicevox-client-1.4.0-macos-x86_64.tar.gz"
      sha256 "39253973b7ce8c070ea851b349a309b012cecdfc936aaf678cee9f154a62933d"
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
