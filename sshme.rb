class Sshme < Formula
  homepage "https://github.com/trntv/sshme"
  url "https://github.com/trntv/sshme.git", :tag => "0.4.3"
  version "0.4.3"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/trntv/sshme").install buildpath.children
    cd "src/github.com/trntv/sshme" do
      system "dep ensure -vendor-only"
      system "make"
      bin.install Dir["build/sshme"]
      prefix.install Dir["completions"]
    end
  end

end
