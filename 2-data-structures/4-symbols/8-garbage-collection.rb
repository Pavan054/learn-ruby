### Garbage Collection

# Ruby ≤ 2.1: Symbols were not GC’d → memory leaks possible if you created symbols dynamically (:"user_#{input}").

# Ruby ≥ 2.2: Dynamically created symbols can be garbage collected.

# Static symbols (hardcoded in code) are never GC’d (because they’re always referenced by the code itself).