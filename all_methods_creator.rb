require 'open-uri'
require 'nokogiri'


doc = Nokogiri::HTML(open("http://ruby-doc.org/core-1.9.3"))
method_array = doc.css('a').collect {|i| i.content.split[0]}
method_array.slice!(0,109)
method_array.slice!(-5,5)
method_array.uniq!
p method_array


METHODS = {}
doc = Nokogiri::HTML(open("http://ruby-doc.org/core-1.9.3"))
method_array = doc.css('a').collect {|i| i.content.split}
method_array.slice!(0,109)
method_array.slice!(-5,5)
method_array.each do |key,value|
   key_sym = key.to_sym
   METHODS[key_sym] = [] if METHODS[key_sym] == nil
   METHODS[key_sym] << value.gsub(/[()]/, '')
end


METHODS = {:====>["SystemCallError", "Bignum", "Fixnum", "Float", "Module", "Object", "Proc", "Range", "Regexp", "String", "Symbol"], :DEBUG=>["Thread"], :"DEBUG="=>["Thread"], :[]=>["Array", "Dir", "ENV", "Hash", "Array", "Bignum", "Continuation", "Fixnum", "Hash", "MatchData", "Method", "Proc", "String", "Struct", "Symbol", "Thread"], :[]==>["ENV", "Array", "Hash", "String", "Struct", "Thread"], :_id2ref=>["ObjectSpace"], :_load=>["Time"], :abort=>["Process", "Kernel"], :abort_on_exception=>["Thread", "Thread"], :abort_on_exception==>["Thread", "Thread"], :absolute_path=>["File"], :acos=>["Math"], :acosh=>["Math"], :aliases=>["Encoding"], :all_symbols=>["Symbol"], :asciicompat_encoding=>["Encoding::Converter"], :asin=>["Math"], :asinh=>["Math"], :assoc=>["ENV", "Array", "Hash"], :at=>["Time", "Array"], :atan=>["Math"], :atan2=>["Math"], :atanh=>["Math"], :atime=>["File", "File", "File::Stat"], :basename=>["File"], :binread=>["IO"], :binwrite=>["IO"], :blockdev?=>["File", "File::Stat", "FileTest"], :cbrt=>["Math"], :change_privilege=>["Process::GID", "Process::UID"], :chardev?=>["File", "File::Stat", "FileTest"], :chdir=>["Dir"], :chmod=>["File", "File"], :chown=>["File", "File"], :chroot=>["Dir"], :clear=>["ENV", "GC::Profiler", "Array", "Hash", "String"], :compatible?=>["Encoding"], :compile=>["Regexp", "RubyVM::InstructionSequence"], :compile_file=>["RubyVM::InstructionSequence"], :compile_option=>["RubyVM::InstructionSequence"], :compile_option==>["RubyVM::InstructionSequence"], :constants=>["Module", "Module"], :copy_stream=>["IO"], :cos=>["Math"], :cosh=>["Math"], :count=>["GC", "Array", "Enumerable", "String"], :count_objects=>["ObjectSpace"], :ctime=>["File", "File", "File::Stat", "Time"], :current=>["Fiber", "Thread"], :daemon=>["Process"], :default_external=>["Encoding"], :default_external==>["Encoding"], :default_internal=>["Encoding"], :default_internal==>["Encoding"], :define_finalizer=>["ObjectSpace"], :delete=>["Dir", "ENV", "File", "Array", "Hash", "String"], :delete_if=>["ENV", "Array", "Hash"], :detach=>["Process"], :directory?=>["File", "File::Stat", "FileTest"], :dirname=>["File"], :disable=>["GC", "GC::Profiler"], :disasm=>["RubyVM::InstructionSequence", "RubyVM::InstructionSequence"], :disassemble=>["RubyVM::InstructionSequence", "RubyVM::InstructionSequence"], :dump=>["Marshal", "String"], :each=>["ENV", "ARGF", "Array", "Dir", "Enumerator", "Hash", "IO", "Range", "Struct"], :each_key=>["ENV", "Hash"], :each_object=>["ObjectSpace"], :each_pair=>["ENV", "Hash", "Struct"], :each_value=>["ENV", "Hash"], :egid=>["Process"], :egid==>["Process"], :eid=>["Process::GID", "Process::UID"], :empty?=>["ENV", "Array", "Hash", "String", "Symbol"], :enable=>["GC", "GC::Profiler"], :enabled?=>["GC::Profiler"], :entries=>["Dir", "Enumerable"], :erf=>["Math"], :erfc=>["Math"], :escape=>["Regexp"], :euid=>["Process"], :euid==>["Process"], :exception=>["Exception", "Exception"], :exclusive=>["Thread"], :exec=>["Process", "Kernel"], :executable?=>["File", "File::Stat", "FileTest"], :executable_real?=>["File", "File::Stat", "FileTest"], :exist?=>["Dir", "File", "FileTest"], :exists?=>["Dir", "File", "FileTest"], :exit=>["Process", "Thread", "Kernel", "Thread"], :exit!=>["Process", "Kernel"], :exp=>["Math"], :expand_path=>["File"], :extname=>["File"], :fetch=>["ENV", "Array", "Hash"], :file?=>["File", "File::Stat", "FileTest"], :find=>["Encoding", "Enumerable"], :fnmatch=>["File"], :fnmatch?=>["File"], :for_fd=>["IO"], :foreach=>["Dir", "IO"], :fork=>["Process", "Thread", "Kernel"], :frexp=>["Math"], :ftype=>["File", "File::Stat"], :gamma=>["Math"], :garbage_collect=>["ObjectSpace", "GC"], :getegid=>["Process::Sys"], :geteuid=>["Process::Sys"], :getgid=>["Process::Sys"], :getpgid=>["Process"], :getpgrp=>["Process"], :getpriority=>["Process"], :getrlimit=>["Process"], :getuid=>["Process::Sys"], :getwd=>["Dir"], :gid=>["Process", "File::Stat"], :gid==>["Process"], :glob=>["Dir"], :gm=>["Time"], :grant_privilege=>["Process::GID", "Process::UID"], :groups=>["Process"], :groups==>["Process"], :grpowned?=>["File", "File::Stat", "FileTest"], :has_key?=>["ENV", "Hash"], :has_value?=>["ENV", "Hash"], :home=>["Dir"], :hypot=>["Math"], :identical?=>["File", "FileTest"], :include?=>["ENV", "Array", "Enumerable", "Hash", "Module", "Range", "String"], :index=>["ENV", "Array", "String"], :initgroups=>["Process"], :inspect=>["ENV", "Array", "Complex", "Dir", "Encoding", "Encoding::Converter", "Enumerator", "Exception", "File::Stat", "Hash", "IO", "MatchData", "Method", "NilClass", "Object", "Process::Status", "Range", "Rational", "Regexp", "RubyVM::InstructionSequence", "String", "Struct", "Symbol", "Thread", "Time", "UnboundMethod"], :invert=>["ENV", "Hash"], :issetugid=>["Process::Sys"], :join=>["File", "Array", "Thread"], :keep_if=>["ENV", "Array", "Hash"], :key=>["ENV", "Hash"], :key?=>["ENV", "Hash", "Thread"], :keys=>["ENV", "Hash", "Thread"], :kill=>["Process", "Thread", "Thread"], :last_match=>["Regexp"], :lchmod=>["File"], :lchown=>["File"], :ldexp=>["Math"], :length=>["ENV", "Array", "Hash", "MatchData", "String", "Struct", "Symbol"], :lgamma=>["Math"], :link=>["File"], :list=>["Encoding", "Signal", "Thread", "ThreadGroup"], :load=>["Marshal", "RubyVM::InstructionSequence", "Kernel"], :local=>["Time"], :locale_charmap=>["Encoding"], :log=>["Math"], :log10=>["Math"], :log2=>["Math"], :lstat=>["File", "File"], :main=>["Thread"], :malloc_allocated_size=>["GC"], :malloc_allocations=>["GC"], :maxgroups=>["Process"], :maxgroups==>["Process"], :member?=>["ENV", "Enumerable", "Hash", "Range"], :mkdir=>["Dir"], :mktime=>["Time"], :mtime=>["File", "File", "File::Stat"], :name_list=>["Encoding"], :nesting=>["Module"], :new=>["Array", "BasicObject", "Class", "Dir", "Encoding::Converter", "Enumerator", "Exception", "File", "File::Stat", "Hash", "IO", "Module", "Mutex", "NameError", "NoMethodError", "Proc", "Random", "Range", "Regexp", "RubyVM::InstructionSequence", "SignalException", "String", "Struct", "SystemCallError", "SystemExit", "Time", "Class"], :new_seed=>["Random"], :now=>["Time"], :open=>["Dir", "File", "IO", "Kernel"], :owned?=>["File", "File::Stat", "FileTest"], :pass=>["Thread"], :path=>["File", "ARGF", "Dir", "File"], :pid=>["Process", "IO", "Process::Status"], :pipe=>["IO"], :pipe?=>["File", "File::Stat", "FileTest"], :polar=>["Complex", "Complex", "Numeric"], :popen=>["IO"], :ppid=>["Process"], :pwd=>["Dir"], :quote=>["Regexp"], :rand=>["Random", "Kernel", "Random"], :rassoc=>["ENV", "Array", "Hash"], :re_exchange=>["Process::GID", "Process::UID"], :re_exchangeable?=>["Process::GID", "Process::UID"], :read=>["IO", "ARGF", "Dir", "IO"], :readable?=>["File", "File::Stat", "FileTest"], :readable_real?=>["File", "File::Stat", "FileTest"], :readlines=>["IO", "ARGF", "IO", "Kernel"], :readlink=>["File"], :realdirpath=>["File"], :realpath=>["File"], :rect=>["Complex", "Complex", "Numeric"], :rectangular=>["Complex", "Complex", "Numeric"], :rehash=>["ENV", "Hash"], :reject=>["ENV", "Array", "Enumerable", "Hash"], :reject!=>["ENV", "Array", "Hash"], :rename=>["File"], :replace=>["ENV", "Array", "Hash", "String"], :report=>["GC::Profiler"], :restore=>["Marshal"], :result=>["GC::Profiler", "StopIteration"], :rid=>["Process::GID", "Process::UID"], :rmdir=>["Dir"], :search_convpath=>["Encoding::Converter"], :select=>["ENV", "IO", "Array", "Enumerable", "Hash", "Kernel", "Struct"], :select!=>["ENV", "Array", "Hash"], :setegid=>["Process::Sys"], :seteuid=>["Process::Sys"], :setgid=>["Process::Sys"], :setgid?=>["File", "File::Stat", "FileTest"], :setpgid=>["Process"], :setpgrp=>["Process"], :setpriority=>["Process"], :setregid=>["Process::Sys"], :setresgid=>["Process::Sys"], :setresuid=>["Process::Sys"], :setreuid=>["Process::Sys"], :setrgid=>["Process::Sys"], :setrlimit=>["Process"], :setruid=>["Process::Sys"], :setsid=>["Process"], :setuid=>["Process::Sys"], :setuid?=>["File", "File::Stat", "FileTest"], :shift=>["ENV", "Array", "Hash"], :sid_available?=>["Process::GID", "Process::UID"], :sin=>["Math"], :sinh=>["Math"], :size=>["ENV", "File", "Array", "Bignum", "File", "File::Stat", "FileTest", "Fixnum", "Hash", "MatchData", "String", "Struct", "Symbol"], :size?=>["File", "File::Stat", "FileTest"], :socket?=>["File", "File::Stat", "FileTest"], :spawn=>["Process", "Kernel"], :split=>["File", "String"], :sqrt=>["Math"], :srand=>["Random", "Kernel"], :start=>["GC", "Thread"], :stat=>["File", "GC", "IO"], :sticky?=>["File", "File::Stat", "FileTest"], :stop=>["Thread"], :store=>["ENV", "Hash"], :stress=>["GC"], :stress==>["GC"], :switch=>["Process::GID", "Process::UID"], :symlink=>["File"], :symlink?=>["File", "File::Stat", "FileTest"], :sysopen=>["IO"], :tan=>["Math"], :tanh=>["Math"], :times=>["Process", "Integer"], :to_a=>["ENV", "ARGF", "Array", "Enumerable", "Hash", "MatchData", "NilClass", "RubyVM::InstructionSequence", "Struct", "Time"], :to_hash=>["ENV", "Hash"], :to_s=>["ENV", "ARGF", "Array", "Bignum", "Complex", "Encoding", "Exception", "FalseClass", "Fixnum", "Float", "Hash", "MatchData", "Method", "Module", "NameError", "NilClass", "Object", "Proc", "Process::Status", "Range", "Rational", "Regexp", "String", "Struct", "Symbol", "Time", "TrueClass", "UnboundMethod"], :total_time=>["GC::Profiler"], :trap=>["Signal", "Kernel"], :truncate=>["File", "File", "Float", "Integer", "Numeric", "Rational"], :try_convert=>["Array", "Hash", "IO", "Regexp", "String"], :uid=>["Process", "File::Stat"], :uid==>["Process"], :umask=>["File"], :undefine_finalizer=>["ObjectSpace"], :union=>["Regexp"], :unlink=>["Dir", "File"], :update=>["ENV", "Hash"], :utc=>["Time", "Time"], :utime=>["File"], :value?=>["ENV", "Hash"], :values=>["ENV", "Hash", "Struct"], :values_at=>["ENV", "Array", "Hash", "MatchData", "Struct"], :wait=>["Process"], :wait2=>["Process"], :waitall=>["Process"], :waitpid=>["Process"], :waitpid2=>["Process"], :world_readable?=>["File", "File::Stat", "FileTest"], :world_writable?=>["File", "File::Stat", "FileTest"], :writable?=>["File", "File::Stat", "FileTest"], :writable_real?=>["File", "File::Stat", "FileTest"], :write=>["IO", "ARGF", "IO"], :yield=>["Fiber", "Proc"], :zero?=>["File", "File::Stat", "FileTest", "Fixnum", "Float", "Numeric"], :!=>["BasicObject"], :!==>["BasicObject"], :!~=>["Object"], :%=>["Bignum", "Fixnum", "Float", "Numeric", "String"], :&=>["Array", "Bignum", "FalseClass", "Fixnum", "NilClass", "Process::Status", "TrueClass"], :*=>["Array", "Bignum", "Complex", "Fixnum", "Float", "Rational", "String"], :**=>["Bignum", "Complex", "Fixnum", "Float", "Rational"], :+=>["Array", "Bignum", "Complex", "Fixnum", "Float", "Rational", "String", "Time"], :+@=>["Numeric"], :-=>["Array", "Bignum", "Complex", "Fixnum", "Float", "Rational", "Time"], :-@=>["Bignum", "Complex", "Fixnum", "Float", "Numeric"], :/=>["Bignum", "Complex", "Fixnum", "Float", "Rational"], :<=>["Bignum", "Comparable", "Fixnum", "Float", "Module"], :<<=>["Array", "Bignum", "Fixnum", "IO", "String"], :<==>["Bignum", "Comparable", "Fixnum", "Float", "Module"], :<=>=>["Array", "Bignum", "File::Stat", "Fixnum", "Float", "Module", "Numeric", "Object", "Rational", "String", "Symbol", "Time"], :===>["Array", "BasicObject", "Bignum", "Comparable", "Complex", "Encoding::Converter", "Exception", "Fixnum", "Float", "Hash", "MatchData", "Method", "Module", "Proc", "Process::Status", "Random", "Range", "Rational", "Regexp", "String", "Struct", "Symbol", "UnboundMethod"], :=~=>["Object", "Regexp", "String", "Symbol"], :>=>["Bignum", "Comparable", "Fixnum", "Float", "Module"], :>==>["Bignum", "Comparable", "Fixnum", "Float", "Module"], :>>=>["Bignum", "Fixnum", "Process::Status"], :Array=>["Kernel"], :Complex=>["Kernel"], :Float=>["Kernel"], :Integer=>["Kernel"], :Rational=>["Kernel"], :String=>["Kernel"], :^=>["Bignum", "FalseClass", "Fixnum", "NilClass", "TrueClass"], :__callee__=>["Kernel"], :__id__=>["BasicObject"], :__method__=>["Kernel"], :__send__=>["BasicObject"], :_dump=>["Time"], :`=>["Kernel"], :abs=>["Bignum", "Complex", "Fixnum", "Float", "Numeric"], :abs2=>["Complex", "Numeric"], :add=>["ThreadGroup"], :add_trace_func=>["Thread"], :advise=>["IO"], :alias_method=>["Module"], :alive?=>["Fiber", "Thread"], :all?=>["Enumerable"], :allocate=>["Class"], :ancestors=>["Module"], :angle=>["Complex", "Float", "Numeric"], :any?=>["Enumerable"], :append_features=>["Module"], :arg=>["Complex", "Float", "Numeric"], :args=>["NoMethodError"], :argv=>["ARGF"], :arity=>["Method", "Proc", "UnboundMethod"], :ascii_compatible?=>["Encoding"], :ascii_only?=>["String"], :asctime=>["Time"], :at_exit=>["Kernel"], :attr=>["Module"], :attr_accessor=>["Module"], :attr_reader=>["Module"], :attr_writer=>["Module"], :autoclose==>["IO"], :autoclose?=>["IO"], :autoload=>["Kernel", "Module"], :autoload?=>["Kernel", "Module"], :backtrace=>["Exception", "Thread"], :begin=>["MatchData", "Range"], :between?=>["Comparable"], :bind=>["UnboundMethod"], :binding=>["Kernel", "Proc"], :binmode=>["ARGF", "IO"], :binmode?=>["ARGF", "IO"], :blksize=>["File::Stat"], :block_given?=>["Kernel"], :blocks=>["File::Stat"], :bytes=>["ARGF", "IO", "Random", "String"], :bytesize=>["String"], :byteslice=>["String"], :call=>["Continuation", "Method", "Proc"], :callcc=>["Kernel"], :caller=>["Kernel"], :capitalize=>["String", "Symbol"], :capitalize!=>["String"], :captures=>["MatchData"], :casecmp=>["String", "Symbol"], :casefold?=>["Regexp"], :catch=>["Kernel"], :ceil=>["Float", "Integer", "Numeric", "Rational"], :center=>["String"], :chars=>["ARGF", "IO", "String"], :chomp=>["Kernel", "String"], :chomp!=>["String"], :chop=>["Kernel", "String"], :chop!=>["String"], :chr=>["Integer", "String"], :chunk=>["Enumerable"], :class=>["Object"], :class_eval=>["Module"], :class_exec=>["Module"], :class_variable_defined?=>["Module"], :class_variable_get=>["Module"], :class_variable_set=>["Module"], :class_variables=>["Module"], :clone=>["Method", "Object", "UnboundMethod"], :close=>["ARGF", "Dir", "IO"], :close_on_exec==>["IO"], :close_on_exec?=>["IO"], :close_read=>["IO"], :close_write=>["IO"], :closed?=>["ARGF", "IO"], :codepoints=>["IO", "String"], :coerce=>["Bignum", "Float", "Numeric"], :collect=>["Array", "Enumerable"], :collect!=>["Array"], :collect_concat=>["Enumerable"], :combination=>["Array"], :compact=>["Array"], :compact!=>["Array"], :compare_by_identity=>["Hash"], :compare_by_identity?=>["Hash"], :concat=>["Array", "String"], :conj=>["Complex", "Numeric"], :conjugate=>["Complex", "Numeric"], :const_defined?=>["Module"], :const_get=>["Module"], :const_missing=>["Module"], :const_set=>["Module"], :convert=>["Encoding::Converter"], :convpath=>["Encoding::Converter"], :coredump?=>["Process::Status"], :cover?=>["Range"], :crypt=>["String"], :curry=>["Proc"], :cycle=>["Array", "Enumerable"], :day=>["Time"], :default=>["Hash"], :default==>["Hash"], :default_proc=>["Hash"], :default_proc==>["Hash"], :define_method=>["Module"], :define_singleton_method=>["Object"], :delete!=>["String"], :delete_at=>["Array"], :denominator=>["Complex", "Float", "Integer", "Numeric", "Rational"], :destination_encoding=>["Encoding::Converter", "Encoding::InvalidByteSequenceError", "Encoding::UndefinedConversionError"], :destination_encoding_name=>["Encoding::InvalidByteSequenceError", "Encoding::UndefinedConversionError"], :detect=>["Enumerable"], :dev=>["File::Stat"], :dev_major=>["File::Stat"], :dev_minor=>["File::Stat"], :display=>["Object"], :div=>["Bignum", "Fixnum", "Numeric"], :divmod=>["Bignum", "Fixnum", "Float", "Numeric"], :downcase=>["String", "Symbol"], :downcase!=>["String"], :downto=>["Integer"], :drop=>["Array", "Enumerable"], :drop_while=>["Array", "Enumerable"], :dst?=>["Time"], :dummy?=>["Encoding"], :dup=>["Object"], :each_byte=>["ARGF", "IO", "String"], :each_char=>["ARGF", "IO", "String"], :each_codepoint=>["IO", "String"], :each_cons=>["Enumerable"], :each_entry=>["Enumerable"], :each_index=>["Array"], :each_line=>["ARGF", "IO", "String"], :each_slice=>["Enumerable"], :each_with_index=>["Enumerable", "Enumerator"], :each_with_object=>["Enumerable", "Enumerator"], :enclose=>["ThreadGroup"], :enclosed?=>["ThreadGroup"], :encode=>["String"], :encode!=>["String"], :encoding=>["Regexp", "String", "Symbol"], :end=>["MatchData", "Range"], :end_with?=>["String"], :enum_for=>["Object"], :eof=>["ARGF", "IO"], :eof?=>["ARGF", "IO"], :eql?=>["Array", "Bignum", "Float", "Hash", "MatchData", "Method", "Numeric", "Object", "Proc", "Range", "Regexp", "String", "Struct", "Time", "UnboundMethod"], :equal?=>["BasicObject"], :errno=>["SystemCallError"], :error_bytes=>["Encoding::InvalidByteSequenceError"], :error_char=>["Encoding::UndefinedConversionError"], :eval=>["Binding", "Kernel", "RubyVM::InstructionSequence"], :even?=>["Bignum", "Fixnum", "Integer"], :exclude_end?=>["Range"], :exit_value=>["LocalJumpError"], :exited?=>["Process::Status"], :exitstatus=>["Process::Status"], :extend=>["Object"], :extend_object=>["Module"], :extended=>["Module"], :external_encoding=>["ARGF", "IO"], :fail=>["Kernel"], :fcntl=>["IO"], :fdatasync=>["IO"], :fdiv=>["Bignum", "Complex", "Fixnum", "Float", "Numeric", "Rational"], :feed=>["Enumerator"], :file=>["ARGF"], :filename=>["ARGF"], :fileno=>["ARGF", "IO"], :fill=>["Array"], :find_all=>["Enumerable"], :find_index=>["Array", "Enumerable"], :finish=>["Encoding::Converter"], :finite?=>["Float"], :first=>["Array", "Enumerable", "Range"], :fixed_encoding?=>["Regexp"], :flat_map=>["Enumerable"], :flatten=>["Array", "Hash"], :flatten!=>["Array"], :flock=>["File"], :floor=>["Float", "Integer", "Numeric", "Rational"], :flush=>["IO"], :force_encoding=>["String"], :format=>["Kernel"], :freeze=>["Module", "Object"], :friday?=>["Time"], :frozen?=>["Array", "Object"], :fsync=>["IO"], :gcd=>["Integer"], :gcdlcm=>["Integer"], :getbyte=>["ARGF", "IO", "String"], :getc=>["ARGF", "IO"], :getgm=>["Time"], :getlocal=>["Time"], :gets=>["ARGF", "IO", "Kernel"], :getutc=>["Time"], :global_variables=>["Kernel"], :gmt?=>["Time"], :gmt_offset=>["Time"], :gmtime=>["Time"], :gmtoff=>["Time"], :grep=>["Enumerable"], :group=>["Thread"], :group_by=>["Enumerable"], :gsub=>["Kernel", "String"], :gsub!=>["String"], :hash=>["Array", "Bignum", "Float", "Hash", "MatchData", "Method", "Object", "Proc", "Range", "Regexp", "String", "Struct", "Time", "UnboundMethod"], :hex=>["String"], :hour=>["Time"], :i=>["Numeric"], :id2name=>["Symbol"], :imag=>["Complex", "Numeric"], :imaginary=>["Complex", "Numeric"], :include=>["Module"], :included=>["Module"], :included_modules=>["Module"], :incomplete_input?=>["Encoding::InvalidByteSequenceError"], :infinite?=>["Float"], :inherited=>["Class"], :initialize_copy=>["Array", "Hash", "String"], :inject=>["Enumerable"], :ino=>["File::Stat"], :inplace_mode=>["ARGF"], :inplace_mode==>["ARGF"], :insert=>["Array", "String"], :insert_output=>["Encoding::Converter"], :instance_eval=>["BasicObject"], :instance_exec=>["BasicObject"], :instance_method=>["Module"], :instance_methods=>["Module"], :instance_of?=>["Object"], :instance_variable_defined?=>["Object"], :instance_variable_get=>["Object"], :instance_variable_set=>["Object"], :instance_variables=>["Object"], :integer?=>["Integer", "Numeric"], :intern=>["String", "Symbol"], :internal_encoding=>["ARGF", "IO"], :ioctl=>["IO"], :is_a?=>["Object"], :isatty=>["IO"], :isdst=>["Time"], :iterator?=>["Kernel"], :kind_of?=>["Object"], :lambda=>["Kernel"], :lambda?=>["Proc"], :last=>["Array", "Range"], :last_error=>["Encoding::Converter"], :lcm=>["Integer"], :lineno=>["ARGF", "IO"], :lineno==>["ARGF", "IO"], :lines=>["ARGF", "IO", "String"], :ljust=>["String"], :local_variables=>["Kernel"], :localtime=>["Time"], :lock=>["Mutex"], :locked?=>["Mutex"], :loop=>["Kernel"], :lstrip=>["String"], :lstrip!=>["String"], :magnitude=>["Bignum", "Complex", "Fixnum", "Float", "Numeric"], :map=>["Array", "Enumerable"], :map!=>["Array"], :marshal_dump=>["Time"], :marshal_load=>["Time"], :match=>["Regexp", "String", "Symbol"], :max=>["Enumerable", "Range"], :max_by=>["Enumerable"], :mday=>["Time"], :members=>["Struct"], :merge=>["Hash"], :merge!=>["Hash"], :message=>["Exception"], :method=>["Object"], :method_added=>["Module"], :method_defined?=>["Module"], :method_missing=>["BasicObject"], :method_removed=>["Module"], :method_undefined=>["Module"], :min=>["Enumerable", "Range", "Time"], :min_by=>["Enumerable"], :minmax=>["Enumerable"], :minmax_by=>["Enumerable"], :mode=>["File::Stat"], :module_eval=>["Module"], :module_exec=>["Module"], :module_function=>["Module"], :modulo=>["Bignum", "Fixnum", "Float", "Numeric"], :mon=>["Time"], :monday?=>["Time"], :month=>["Time"], :name=>["Encoding", "Method", "Module", "NameError", "UnboundMethod"], :named_captures=>["Regexp"], :names=>["Encoding", "MatchData", "Regexp"], :nan?=>["Float"], :next=>["Enumerator", "Integer", "String", "Symbol"], :next!=>["String"], :next_values=>["Enumerator"], :nil?=>["NilClass", "Object"], :nlink=>["File::Stat"], :none?=>["Enumerable"], :nonzero?=>["Numeric"], :nsec=>["Time"], :numerator=>["Complex", "Float", "Integer", "Numeric", "Rational"], :object_id=>["Object"], :oct=>["String"], :odd?=>["Bignum", "Fixnum", "Integer"], :offset=>["MatchData"], :one?=>["Enumerable"], :options=>["Regexp"], :ord=>["Integer", "String"], :owner=>["Method", "UnboundMethod"], :p=>["Kernel"], :pack=>["Array"], :parameters=>["Method", "Proc", "UnboundMethod"], :partition=>["Enumerable", "String"], :peek=>["Enumerator"], :peek_values=>["Enumerator"], :permutation=>["Array"], :phase=>["Complex", "Float", "Numeric"], :pop=>["Array"], :pos=>["ARGF", "Dir", "IO"], :pos==>["ARGF", "Dir", "IO"], :post_match=>["MatchData"], :pre_match=>["MatchData"], :pred=>["Integer"], :prepend=>["String"], :primitive_convert=>["Encoding::Converter"], :primitive_errinfo=>["Encoding::Converter"], :print=>["ARGF", "IO", "Kernel"], :printf=>["ARGF", "IO", "Kernel"], :priority=>["Thread"], :priority==>["Thread"], :private=>["Module"], :private_class_method=>["Module"], :private_instance_methods=>["Module"], :private_method_defined?=>["Module"], :proc=>["Kernel"], :product=>["Array"], :protected=>["Module"], :protected_instance_methods=>["Module"], :protected_method_defined?=>["Module"], :public=>["Module"], :public_class_method=>["Module"], :public_instance_method=>["Module"], :public_instance_methods=>["Module"], :public_method=>["Object"], :public_method_defined?=>["Module"], :public_send=>["Object"], :push=>["Array"], :putback=>["Encoding::Converter"], :putc=>["ARGF", "IO", "Kernel"], :puts=>["ARGF", "IO", "Kernel"], :quo=>["Complex", "Float", "Numeric", "Rational"], :raise=>["Kernel", "Thread"], :rationalize=>["Complex", "Float", "Integer", "NilClass", "Rational"], :rdev=>["File::Stat"], :rdev_major=>["File::Stat"], :rdev_minor=>["File::Stat"], :read_nonblock=>["ARGF", "IO"], :readagain_bytes=>["Encoding::InvalidByteSequenceError"], :readbyte=>["ARGF", "IO"], :readchar=>["ARGF", "IO"], :readline=>["ARGF", "IO", "Kernel"], :readpartial=>["ARGF", "IO"], :real=>["Complex", "Numeric"], :real?=>["Complex", "Numeric"], :reason=>["LocalJumpError"], :receiver=>["Method"], :reduce=>["Enumerable"], :regexp=>["MatchData"], :remainder=>["Bignum", "Numeric"], :remove_class_variable=>["Module"], :remove_const=>["Module"], :remove_instance_variable=>["Object"], :remove_method=>["Module"], :reopen=>["IO"], :repeated_combination=>["Array"], :repeated_permutation=>["Array"], :replacement=>["Encoding::Converter"], :replacement==>["Encoding::Converter"], :replicate=>["Encoding"], :require=>["Kernel"], :require_relative=>["Kernel"], :respond_to?=>["Object"], :respond_to_missing?=>["Object"], :resume=>["Fiber"], :reverse=>["Array", "String"], :reverse!=>["Array", "String"], :reverse_each=>["Array", "Enumerable"], :rewind=>["ARGF", "Dir", "Enumerator", "IO"], :rindex=>["Array", "String"], :rjust=>["String"], :rotate=>["Array"], :rotate!=>["Array"], :round=>["Float", "Integer", "Numeric", "Rational", "Time"], :rpartition=>["String"], :rstrip=>["String"], :rstrip!=>["String"], :run=>["Thread"], :safe_level=>["Thread"], :sample=>["Array"], :saturday?=>["Time"], :scan=>["String"], :sec=>["Time"], :seed=>["Random"], :seek=>["ARGF", "Dir", "IO"], :send=>["Object"], :set_backtrace=>["Exception"], :set_encoding=>["ARGF", "IO"], :set_trace_func=>["Kernel", "Thread"], :setbyte=>["String"], :shuffle=>["Array"], :shuffle!=>["Array"], :signaled?=>["Process::Status"], :signo=>["SignalException"], :singleton_class=>["Object"], :singleton_method_added=>["BasicObject", "Numeric"], :singleton_method_removed=>["BasicObject"], :singleton_method_undefined=>["BasicObject"], :singleton_methods=>["Object"], :skip=>["ARGF"], :sleep=>["Kernel", "Mutex"], :slice=>["Array", "String", "Symbol"], :slice!=>["Array", "String"], :slice_before=>["Enumerable"], :sort=>["Array", "Enumerable"], :sort!=>["Array"], :sort_by=>["Enumerable"], :sort_by!=>["Array"], :source=>["Regexp"], :source_encoding=>["Encoding::Converter", "Encoding::InvalidByteSequenceError", "Encoding::UndefinedConversionError"], :source_encoding_name=>["Encoding::InvalidByteSequenceError", "Encoding::UndefinedConversionError"], :source_location=>["Method", "Proc", "UnboundMethod"], :sprintf=>["Kernel"], :squeeze=>["String"], :squeeze!=>["String"], :start_with?=>["String"], :status=>["SystemExit", "Thread"], :step=>["Numeric", "Range"], :stop?=>["Thread"], :stopped?=>["Process::Status"], :stopsig=>["Process::Status"], :strftime=>["Time"], :string=>["MatchData"], :strip=>["String"], :strip!=>["String"], :sub=>["Kernel", "String"], :sub!=>["String"], :subsec=>["Time"], :succ=>["Fixnum", "Integer", "String", "Symbol", "Time"], :succ!=>["String"], :success?=>["Process::Status", "SystemExit"], :sum=>["String"], :sunday?=>["Time"], :superclass=>["Class"], :swapcase=>["String", "Symbol"], :swapcase!=>["String"], :sync=>["IO"], :sync==>["IO"], :synchronize=>["Mutex"], :syscall=>["Kernel"], :sysread=>["IO"], :sysseek=>["IO"], :system=>["Kernel"], :syswrite=>["IO"], :taint=>["Object"], :tainted?=>["Object"], :take=>["Array", "Enumerable"], :take_while=>["Array", "Enumerable"], :tap=>["Object"], :tell=>["ARGF", "Dir", "IO"], :terminate=>["Thread"], :termsig=>["Process::Status"], :test=>["Kernel"], :throw=>["Kernel"], :thursday?=>["Time"], :to_ary=>["Array"], :to_c=>["NilClass", "Numeric", "String"], :to_enum=>["Object"], :to_f=>["Bignum", "Complex", "Fixnum", "Float", "NilClass", "Rational", "String", "Time"], :to_i=>["ARGF", "Complex", "Float", "IO", "Integer", "NilClass", "Process::Status", "Rational", "String", "Time"], :to_int=>["Float", "Integer", "Numeric"], :to_io=>["ARGF", "IO"], :to_path=>["Dir", "File"], :to_proc=>["Method", "Proc", "Symbol"], :to_r=>["Complex", "Float", "Integer", "NilClass", "Rational", "String", "Time"], :to_str=>["String"], :to_sym=>["String", "Symbol"], :to_write_io=>["ARGF"], :tr=>["String"], :tr!=>["String"], :tr_s=>["String"], :tr_s!=>["String"], :trace_var=>["Kernel"], :transfer=>["Fiber"], :transpose=>["Array"], :trust=>["Object"], :try_lock=>["Mutex"], :tty?=>["IO"], :tuesday?=>["Time"], :tv_nsec=>["Time"], :tv_sec=>["Time"], :tv_usec=>["Time"], :unbind=>["Method"], :undef_method=>["Module"], :ungetbyte=>["IO"], :ungetc=>["IO"], :uniq=>["Array"], :uniq!=>["Array"], :unlock=>["Mutex"], :unpack=>["String"], :unshift=>["Array"], :untaint=>["Object"], :untrace_var=>["Kernel"], :untrust=>["Object"], :untrusted?=>["Object"], :upcase=>["String", "Symbol"], :upcase!=>["String"], :upto=>["Integer", "String"], :usec=>["Time"], :utc?=>["Time"], :utc_offset=>["Time"], :valid_encoding?=>["String"], :value=>["Thread"], :wakeup=>["Thread"], :warn=>["Kernel"], :wday=>["Time"], :wednesday?=>["Time"], :with_index=>["Enumerator"], :with_object=>["Enumerator"], :write_nonblock=>["IO"], :yday=>["Time"], :year=>["Time"], :zip=>["Array", "Enumerable"], :zone=>["Time"], :|=>["Array", "Bignum", "FalseClass", "Fixnum", "NilClass", "TrueClass"], :~=>["Bignum", "Complex", "Fixnum", "Regexp"]}