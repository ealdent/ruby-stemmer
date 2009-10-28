require "mkmf"

# build libstemmer_c
ENV['ARCHFLAGS']= "-arch x86_64" if Config::CONFIG['host_cpu'] == 'i686' && RUBY_PLATFORM =~ /darwin/
system "cd libstemmer_c; make libstemmer.o; cd #{File.dirname(__FILE__)};"

$CFLAGS  += " -I#{File.join(File.dirname(__FILE__),'libstemmer_c','include')} "
$libs    += " -L#{File.join(File.dirname(__FILE__),'libstemmer_c')} #{File.join(File.dirname(__FILE__),'libstemmer_c','libstemmer.o')} "

if have_header("libstemmer.h")
  create_makefile("lingua/stemmer")
end
