class ShortcutAdder
  attr_reader :shortcut_map

  def initialize(shortcut_map)
    @shortcut_map = shortcut_map
  end

  def add_all!
    check_compatibility!
  
    total_count = shortcut_map.keys.length

    shortcut_map.each_with_index do |(k, v), i|
      slackified_key = ":#{k}:"

      add_single_shortcut key: slackified_key, val: v
      print_progress cur: i, total: total_count
    end

    puts
    puts "\e[32mDone 🎉 To start using your new shortcuts, restart any relavant applications\n" \
        "To view your shortcuts, run bin/list\e[0m"
  end

  private

  def add_single_shortcut(key:, val:)
    `defaults write -g NSUserDictionaryReplacementItems -array-add '{on=1;replace="#{key}";with="#{val}";}'` 
  end

  def check_compatibility!
    print "Checking system..."

    sys_version = `uname -a`

    unless sys_version =~ /^Darwin/
      abort("This script is unpermitted on this type of machine. Exiting.\n")
    end

    output = `defaults read-type -globalDomain NSUserDictionaryReplacementItems`
    
    unless output =~ /^Type/
      abort("Missing required system compatibilities. Exiting.\n")
    end

    puts "Ok 👍"
  end

  def print_progress(cur:, total:)
    _cur = cur / 20
    _total = total / 20

    prog = (['#'] * _cur).join
    bar = (['-'] * ([_total - _cur - 1, 0].max)).join

    print "\r|#{prog}#{bar}| #{cur * 100 / total}%".ljust(80)
  end
end