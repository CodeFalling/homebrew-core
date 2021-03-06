class Zplug < Formula
  desc "The next-generation plugin manager for zsh"
  homepage "http://zplug.sh"
  url "https://github.com/zplug/zplug/archive/2.0.0.tar.gz"
  sha256 "4a8d3059f4a8c76a37dcb51b5fe14740554a192039f29e10eea53bbe0dbe8314"
  head "https://github.com/zplug/zplug.git"

  bottle :unneeded

  depends_on "zsh" => :optional

  def install
    bin.install Dir["bin/*"]
    man1.install "doc/man/man1/zplug.1"
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    In order to use zplug, please add the following to your .zshrc:
      export ZPLUG_HOME=#{opt_prefix}
      source $ZPLUG_HOME/init.zsh
    EOS
  end

  test do
    shell_output("zsh -c \"source #{opt_prefix}/init.zsh && (( $+functions[zplug] ))\"")
  end
end
