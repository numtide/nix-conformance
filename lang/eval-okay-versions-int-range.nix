# names.cc reads a version component with string2Int<int>, so a component
# above 2147483647 is not a number
let c = builtins.compareVersions; in [
  (c "2147483648" "9")
  (c "2147483647" "9")
  (c "0.0.0-20191109021931" "0.0.0-100")
  (c "0000000000000000000002" "1")
  (c "1.0-4294967296" "1.0-5")
  (builtins.splitVersion "1.20191109021931.2")
  (builtins.parseDrvName "hello-2147483648")
]
