class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  Addrinfo = Addrinfo
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  BasicSocket = BasicSocket
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  ConditionVariable = ConditionVariable
  Config = RbConfig
  Data = Data
  Date = Date
  Delegator = Delegator
  Digest = Digest
  Dir = Dir
  ENV = {"GEM_PATH"=>"/home/saasbook/.rvm/gems/ruby-1.9.3-p448:/home/saasbook/.rvm/gems/ruby-1.9.3-p448@global", "DESKTOP_AUTOSTART_ID"=>"106d008cd642420b0513823096035636300000011390026", "GNOME_KEYRING_CONTROL"=>"/tmp/keyring-WlbAop", "XDG_SESSION_PATH"=>"/org/freedesktop/DisplayManager/Session0", "GTK_MODULES"=>"canberra-gtk-module:canberra-gtk-module", "SHLVL"=>"1", "SSH_AGENT_PID"=>"1239", "NODE_PATH"=>"/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript", "rvm_version"=>"1.22.3 (stable)", "SESSION_MANAGER"=>"local/saasbook:@/tmp/.ICE-unix/1139,unix/saasbook:/tmp/.ICE-unix/1139", "GNOME_DESKTOP_SESSION_ID"=>"this-is-deprecated", "GDMSESSION"=>"ubuntu-2d", "XDG_SESSION_COOKIE"=>"7ddb227f2429ba8bfd9554c90000000b-1382309601.701321-1352276700", "XDG_DATA_DIRS"=>"/usr/share/ubuntu-2d:/usr/share/gnome:/usr/local/share/:/usr/share/", "MANDATORY_PATH"=>"/usr/share/gconf/ubuntu-2d.mandatory.path", "PWD"=>"/home/saasbook", "rvm_prefix"=>"/home/saasbook", "IRBRC"=>"/home/saasbook/.rvm/rubies/ruby-1.9.3-p448/.irbrc", "GPG_AGENT_INFO"=>"/tmp/keyring-WlbAop/gpg:0:1", "RUBY_VERSION"=>"ruby-1.9.3-p448", "SSH_AUTH_SOCK"=>"/tmp/keyring-WlbAop/ssh", "LD_LIBRARY_PATH"=>"/usr/lib/jvm/java-6-openjdk/jre/lib/i386/client:/usr/lib/jvm/java-6-openjdk/jre/lib/i386:", "MY_RUBY_HOME"=>"/home/saasbook/.rvm/rubies/ruby-1.9.3-p448", "DBUS_SESSION_BUS_ADDRESS"=>"unix:abstract=/tmp/dbus-HfRAYLUIB6,guid=e5ec32a2fd009ea619a3942c00000024", "SHELL"=>"/bin/bash", "rvm_bin_path"=>"/home/saasbook/.rvm/bin", "XDG_CURRENT_DESKTOP"=>"Unity", "XDG_CONFIG_DIRS"=>"/etc/xdg/xdg-ubuntu-2d:/etc/xdg", "PATH"=>"/home/saasbook/.rvm/gems/ruby-1.9.3-p448/bin:/home/saasbook/.rvm/gems/ruby-1.9.3-p448@global/bin:/home/saasbook/.rvm/rubies/ruby-1.9.3-p448/bin:/home/saasbook/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", "GEM_HOME"=>"/home/saasbook/.rvm/gems/ruby-1.9.3-p448", "DESKTOP_SESSION"=>"ubuntu-2d", "APTANA_VERSION"=>"3.4.2.1368863613", "DISPLAY"=>":0.0", "UBUNTU_MENUPROXY"=>"libappmenu.so", "USER"=>"saasbook", "HOME"=>"/home/saasbook", "rvm_env_string"=>"ruby-1.9.3-p448", "rvm_path"=>"/home/saasbook/.rvm", "XAUTHORITY"=>"/home/saasbook/.Xauthority", "rvm_ruby_string"=>"ruby-1.9.3-p448", "DEFAULTS_PATH"=>"/usr/share/gconf/ubuntu-2d.default.path", "USERNAME"=>"saasbook", "XDG_SEAT_PATH"=>"/org/freedesktop/DisplayManager/Seat0", "LANG"=>"en_US.UTF-8"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fcntl = Fcntl
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IPSocket = IPSocket
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Monitor = Monitor
  MonitorMixin = MonitorMixin
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  Net = Net
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/home/saasbook/Documents/WisdomSun/.metadata/.plugins/com.aptana.ruby.core/-2069910353/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  OpenSSL = OpenSSL
  OptionParser = OptionParser
  Proc = Proc
  Process = Process
  Queue = Queue
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2013 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p448 (2013-06-27 revision 41675) [i686-linux]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 448
  RUBY_PLATFORM = "i686-linux"
  RUBY_RELEASE_DATE = "2013-06-27"
  RUBY_REVISION = 41675
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  Resolv = Resolv
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScriptError = ScriptError
  SecureRandom = SecureRandom
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  SimpleDelegator = SimpleDelegator
  SizedQueue = SizedQueue
  Socket = Socket
  SocketError = SocketError
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  Struct = Struct
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TCPServer = TCPServer
  TCPSocket = TCPSocket
  TOPLEVEL_BINDING = #<Binding:0x97eb02c>
  TRUE = true
  TSort = TSort
  Tempfile = Tempfile
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  Timeout = Timeout
  TimeoutError = Timeout::Error
  TrueClass = TrueClass
  TypeError = TypeError
  UDPSocket = UDPSocket
  UNIXServer = UNIXServer
  UNIXSocket = UNIXSocket
  URI = URI
  UnboundMethod = UnboundMethod
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib



  protected


  private

  def DelegateClass(arg0)
  end

  def Digest(arg0)
  end

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

  def timeout(arg0, arg1, arg2, *rest)
  end

end
