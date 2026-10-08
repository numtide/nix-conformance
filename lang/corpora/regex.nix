# Differential corpus for builtins.match / builtins.split.
# scripts/parity.nu evaluates this with nix-instantiate and with iets and
# requires byte-equal JSON. Every entry is a (pattern, input) pair; both
# builtins run on each. Failures are captured with tryEval, so an invalid
# pattern compares as { err = true; } on both sides.
let
  long = s: n: builtins.concatStringsSep "" (builtins.genList (_: s) n);
  pairs = [
    # --- plain literals and concatenation
    { re = "a"; s = "a"; }
    { re = "a"; s = "b"; }
    { re = "a"; s = ""; }
    { re = ""; s = ""; }
    { re = ""; s = "ab"; }
    { re = "abc"; s = "abc"; }
    { re = "abc"; s = "abcd"; }
    { re = "b"; s = "abcabc"; }

    # --- alternation with a common prefix (leftmost-longest territory)
    { re = "a|ab"; s = "ab"; }
    { re = "ab|a"; s = "ab"; }
    { re = "a|ab|abc"; s = "abc"; }
    { re = "abc|ab|a"; s = "abc"; }
    { re = "(a|ab)"; s = "ab"; }
    { re = "(ab|a)"; s = "ab"; }
    { re = "(a|ab)(c|bcd)"; s = "abcd"; }
    { re = "(a|ab)(c|bcd)(d*)"; s = "abcd"; }
    { re = "(a|ab)(bcd|c)(d*)"; s = "abcd"; }
    { re = "(ab|a)(c|bcd)"; s = "abcd"; }
    { re = "x*|ab"; s = "ab"; }
    { re = "ab|x*"; s = "ab"; }
    { re = "|a"; s = "a"; }
    { re = "a|"; s = "a"; }
    { re = "a|b|c"; s = "c"; }
    { re = "(a|b|c)(c|b|a)"; s = "ab"; }
    { re = "(a)|(ab)"; s = "ab"; }
    { re = "(ab)|(a)"; s = "ab"; }
    { re = "(a)|(b)"; s = "b"; }
    { re = "(a|)(b|)"; s = "a"; }
    { re = "(|a)(|b)"; s = "ab"; }
    { re = "a(|b)"; s = "ab"; }
    { re = "(a|ab)*"; s = "abab"; }
    { re = "(ab|a)*"; s = "abab"; }
    { re = "(a|ab)*c"; s = "ababc"; }

    # --- starred groups with empty iterations
    { re = "(a*)*"; s = "aa"; }
    { re = "(a*)*"; s = ""; }
    { re = "(a*)*"; s = "b"; }
    { re = "(a*)+"; s = "aa"; }
    { re = "(a*)+"; s = ""; }
    { re = "(a*)(a*)"; s = "aa"; }
    { re = "(a*)(a*)(a*)"; s = "aa"; }
    { re = "(a?)*"; s = "aa"; }
    { re = "(a?)?"; s = "a"; }
    { re = "(|a)*"; s = "aa"; }
    { re = "(a|)*"; s = "aa"; }
    { re = "(a|b)*"; s = "abba"; }
    { re = "(a|b)*"; s = ""; }
    { re = "(b|a)*"; s = "abba"; }
    { re = "((a)|b)*"; s = "ab"; }
    { re = "((a)|(b))*"; s = "ab"; }
    { re = "(a*b*)*"; s = "ab"; }
    { re = "(a*|b)*"; s = "ab"; }
    { re = "(a+)*"; s = "aaa"; }
    { re = "(a+)+"; s = "aaa"; }
    { re = "(a*)*b"; s = "aab"; }
    { re = "()*"; s = ""; }
    { re = "()+"; s = ""; }
    { re = "()?"; s = ""; }
    { re = "(())*"; s = ""; }

    # --- nested groups
    { re = "((a)(b))"; s = "ab"; }
    { re = "(a(b(c)))"; s = "abc"; }
    { re = "((a*)(b*))*"; s = "aabb"; }
    { re = "((a|b)*)(c)"; s = "abc"; }
    { re = "(((a)))"; s = "a"; }
    { re = "((a)|(b))((c)|(d))"; s = "ad"; }
    { re = "(a(b)?)*"; s = "aab"; }
    { re = "(a(b)?)+"; s = "ab"; }
    { re = "((a)*)*"; s = "aa"; }
    { re = "(a|(b))*"; s = "ba"; }

    # --- quantifiers
    { re = "a*"; s = "aaa"; }
    { re = "a+"; s = "aaa"; }
    { re = "a?"; s = "a"; }
    { re = "a?"; s = ""; }
    { re = "a**"; s = "aa"; }
    { re = "a+?"; s = "aa"; }
    { re = "a?*"; s = "aa"; }
    { re = "a{2}"; s = "aa"; }
    { re = "a{2}"; s = "aaa"; }
    { re = "a{2,}"; s = "aaaa"; }
    { re = "a{2,3}"; s = "aaaa"; }
    { re = "a{0,3}"; s = "aa"; }
    { re = "a{0}"; s = ""; }
    { re = "a{0,}"; s = "aa"; }
    { re = "(a){2}"; s = "aa"; }
    { re = "(a){1,3}"; s = "aaa"; }
    { re = "(a|b){1,3}"; s = "aba"; }
    { re = "(ab|a){1,2}"; s = "aba"; }
    { re = "(a*){2}"; s = "aa"; }
    { re = "(a*){1,2}"; s = "aa"; }
    { re = "(a?){2}"; s = "a"; }
    { re = "(a?){3}"; s = "a"; }
    { re = "a{1,2}{2}"; s = "aaa"; }
    { re = "(a{2})*"; s = "aaaa"; }
    { re = "x{3}"; s = "xxx"; }

    # --- anchors
    { re = "^a"; s = "a"; }
    { re = "^a"; s = "ba"; }
    { re = "a$"; s = "a"; }
    { re = "a$"; s = "ab"; }
    { re = "^a$"; s = "a"; }
    { re = "^"; s = "ab"; }
    { re = "$"; s = "ab"; }
    { re = "^$"; s = ""; }
    { re = "^$"; s = "a"; }
    { re = "a^b"; s = "ab"; }
    { re = "a$b"; s = "ab"; }
    { re = "(^a)"; s = "a"; }
    { re = "(a$)"; s = "a"; }
    { re = "^a|b$"; s = "b"; }
    { re = "^(a|ab)"; s = "ab"; }
    { re = "^a*$"; s = "aa"; }

    # --- dot
    { re = "."; s = "a"; }
    { re = "."; s = ""; }
    { re = ".*"; s = "abc"; }
    { re = ".+"; s = "abc"; }
    { re = "a.c"; s = "abc"; }
    { re = "a.c"; s = "a\nc"; }
    { re = ".*b"; s = "abcb"; }
    { re = "(.)(.)"; s = "ab"; }
    { re = ".|a"; s = "a"; }
    { re = "..*"; s = "ab"; }

    # --- bracket expressions
    { re = "[abc]"; s = "b"; }
    { re = "[abc]+"; s = "cab"; }
    { re = "[^a]"; s = "b"; }
    { re = "[^a]"; s = "\n"; }
    { re = "[^a]*"; s = "bc"; }
    { re = "[a-c]+"; s = "abc"; }
    { re = "[]]"; s = "]"; }
    { re = "[]a]+"; s = "a]"; }
    { re = "[^]a]+"; s = "bc"; }
    { re = "[a-]+"; s = "a-"; }
    { re = "[[:digit:]]+"; s = "123"; }
    { re = "[[:alpha:][:digit:]]+"; s = "a1"; }
    { re = "[[:space:]]"; s = " "; }
    { re = "[[:upper:]]+"; s = "AB"; }
    { re = "[^[:digit:]]+"; s = "ab"; }
    { re = "([[:alnum:]]*)-([[:alnum:]]*)"; s = "ab-cd"; }
    { re = "[.]"; s = "."; }
    { re = "[*]"; s = "*"; }
    { re = "[\\]"; s = "\\"; }
    { re = "[a-c]|[b-d]"; s = "c"; }
    { re = "[abc]{2,3}"; s = "abc"; }

    # --- escapes
    { re = "a\\.b"; s = "a.b"; }
    { re = "a\\.b"; s = "axb"; }
    { re = "\\("; s = "("; }
    { re = "\\)"; s = ")"; }
    { re = "\\*"; s = "*"; }
    { re = "\\+"; s = "+"; }
    { re = "\\?"; s = "?"; }
    { re = "\\["; s = "["; }
    { re = "\\$"; s = "$"; }
    { re = "\\^"; s = "^"; }
    { re = "\\|"; s = "|"; }
    { re = "\\{"; s = "{"; }
    { re = "\\\\"; s = "\\"; }
    { re = "a\\{2}"; s = "a{2}"; }
    # --- split-shaped inputs (empty and adjacent matches)
    { re = ","; s = "a,b,c"; }
    { re = ",*"; s = "a,,b"; }
    { re = "a*"; s = "baaac"; }
    { re = "a*"; s = ""; }
    { re = "x*"; s = "abc"; }
    { re = "b*"; s = "abbbc"; }
    { re = "(b*)"; s = "abbbc"; }
    { re = "(a)(b)?"; s = "aab"; }
    { re = "[[:space:]]+"; s = "a  b\tc"; }
    { re = "(,)|(;)"; s = "a,b;c"; }
    { re = "(a)|b"; s = "ab"; }
    { re = "\\."; s = "a.b.c"; }
    { re = "-+"; s = "a--b-c"; }
    { re = "(-+)"; s = "-a-"; }
    { re = "^a|a$"; s = "aa"; }

    # --- longer inputs, realistic nixpkgs-shaped patterns
    { re = "([^-]*)-(.*)"; s = "1.2.3-beta"; }
    { re = "([0-9]+)\\.([0-9]+)(\\.([0-9]+))?"; s = "1.2.3"; }
    { re = "([0-9]+)\\.([0-9]+)(\\.([0-9]+))?"; s = "1.2"; }
    { re = "(.*)/([^/]*)"; s = "/a/b/c"; }
    { re = "[a-zA-Z0-9_-]+"; s = "foo_bar-1"; }
    { re = "(foo)?(bar)?"; s = "bar"; }
    { re = "(a*)(b*)(c*)(d*)"; s = "abcd"; }
    { re = "(a|b)(c|d)(e|f)"; s = "ace"; }
    { re = "((a|b)*)((c|d)*)"; s = "abcd"; }
    { re = "(x|xy)(y|z)*"; s = "xyz"; }
    { re = "(a+|b+)*"; s = "aabb"; }
    { re = "(a|aa)*"; s = "aaa"; }
    { re = "(aa|a)*"; s = "aaa"; }
    { re = "(a|aa)(a|aa)"; s = "aaa"; }
    { re = "(a*a*)*b"; s = "aaab"; }

    # --- a greedy quantifier keeps the first match it reaches
    { re = "(x*)(xy)?"; s = "xy"; }
    { re = "(x*)(xy)?"; s = "xyz"; }
    { re = "(x?)(xy)?"; s = "xy"; }
    { re = "(x+)(xy)?"; s = "xxy"; }
    { re = "(x){0,1}(xy)?"; s = "xy"; }
    { re = "(x|)(xy)?"; s = "xy"; }
    { re = "(|x)(xy)?"; s = "xy"; }
    { re = "(abc|a)(b*)(bcde)?"; s = "abcde"; }
    { re = "(a|abc)(b*)(bcde)?"; s = "abcde"; }
    { re = "(a)(b*)(bcde)?"; s = "abcde"; }
    { re = "(a|abc)d*"; s = "abc"; }
    { re = "(a|abc)(d?)"; s = "abc"; }
    { re = "(a*)(a|b)*"; s = "aab"; }
    { re = "(a|b)*(ab)?"; s = "ab"; }
    { re = "(a|ab)(x|)(b*)"; s = "abb"; }
    { re = "(ab|a)(b?)"; s = "ab"; }
    { re = "x(a|ab)"; s = "xab"; }
    { re = "(a|ab)(c|bcd)"; s = "abcd"; }

    # --- captures persist across iterations
    { re = "((a)|(b))*"; s = "ab"; }
    { re = "(a(b)?)+"; s = "aba"; }
    { re = "((a)|b)+"; s = "ab"; }
    { re = "((a)|(b))+"; s = "ba"; }
    { re = "((a)|(b)){2}"; s = "ab"; }
    { re = "((a)|b)*c"; s = "abc"; }
    { re = "((a)|ab)*"; s = "abab"; }

    # --- empty iterations
    { re = "(|a)*"; s = "aa"; }
    { re = "(|a)+"; s = "aa"; }
    { re = "((a*)*)*"; s = "aa"; }
    { re = "(a*)*(b)"; s = "aab"; }
    { re = "(a*|b)*"; s = "ba"; }
    { re = "(a*){3}"; s = "aa"; }
    { re = "(b|a*)*"; s = "ab"; }
    { re = "(a|b*)*"; s = "ab"; }
    { re = "()*a"; s = "a"; }
    { re = "(^)*a"; s = "a"; }
    { re = "($)+"; s = ""; }
    { re = "(a{0})*"; s = "a"; }

    # --- odd but valid syntax
    { re = "a}"; s = "a}"; }
    { re = "]"; s = "]"; }
    { re = "a{1}{2}"; s = "aa"; }
    { re = "a*{2}"; s = "aa"; }
    { re = "a{02}"; s = "aa"; }
    { re = "a{0,0}b"; s = "b"; }
    { re = "(){2}"; s = ""; }
    { re = "a||b"; s = "b"; }
    { re = "a(|)"; s = "a"; }
    { re = "(|)"; s = ""; }
    { re = "a?+"; s = "aa"; }

    # --- bracket edge cases
    { re = "[[.hyphen.]-z]+"; s = "-az"; }
    { re = "[[.a.]-c]+"; s = "abc"; }
    { re = "[[.space.][.tilde.]]+"; s = " ~"; }
    { re = "[[=a=]]+"; s = "aA"; }
    { re = "[[=period=]x]+"; s = ".x"; }
    { re = "[%--]+"; s = "%&-"; }
    { re = "[--a]+"; s = "-0a"; }
    { re = "[!--]"; s = ","; }
    { re = "[---]"; s = "-"; }
    { re = "[]-a]+"; s = "]^a"; }
    { re = "[^]-a]+"; s = "bc"; }
    { re = "[a-c-]+"; s = "a-c"; }
    { re = "[[:alpha:]-]+"; s = "a-b"; }
    { re = "[[a]+"; s = "[a"; }
    { re = "[:alpha:]+"; s = ":ah"; }
    { re = "[\\n]+"; s = "\\n"; }
    { re = "[\\]]"; s = "\\]"; }
    { re = "[[:w:]]+"; s = "a_1"; }
    { re = "[[:ALPHA:]]+"; s = "aB"; }
    { re = "[[:punct:]]+"; s = "!~"; }
    { re = "[[:blank:]]+"; s = " \t"; }
    { re = "[[:space:]]+"; s = "\r\n"; }
    { re = "[[:xdigit:]]+"; s = "fF9"; }
    { re = "[[:cntrl:]]"; s = "\t"; }

    # --- bytes above 0x7f: ranges compare signed chars
    { re = "."; s = "é"; }
    { re = ".."; s = "é"; }
    { re = "[^a]+"; s = "é"; }
    { re = "[[:alpha:]]+"; s = "é"; }
    { re = "[é-a]+"; s = "éa"; }
    { re = "[à-ú]+"; s = "éa"; }
    { re = "[é]"; s = "é"; }

    # --- long inputs and backtracking-heavy patterns
    { re = "(a|b)*c"; s = long "ab" 500; }
    { re = "(a|b)*"; s = long "ab" 5000; }
    { re = "(.*)-(.*)-(.*)"; s = long "x-" 300; }
    { re = "([^-]*)-(.*)"; s = long "abc" 3000 + "-z"; }
    { re = ".*"; s = long "0123456789" 2000; }
    { re = "(a|aa)*b"; s = long "a" 30 + "b"; }
    { re = "((a|b)(c|d))+"; s = long "ad" 400; }
    { re = "[a-z]+"; s = long "ab " 700; }
    { re = "(ab|a)*b"; s = long "ab" 200; }
  ];
  try = v: let r = builtins.tryEval v; in if r.success then { ok = r.value; } else { err = true; };
in
map (p: {
  inherit (p) re s;
  m = try (builtins.match p.re p.s);
  sp = try (builtins.split p.re p.s);
}) pairs
