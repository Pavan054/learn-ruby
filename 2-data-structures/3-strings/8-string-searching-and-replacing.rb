str = "I love Ruby and Ruby loves me"

p str.index("Ruby")         # 7 (first occurrence)
p str.rindex("Ruby")        # 16 (last occurrence)
p str.include?("love")      # true
p str.sub("Ruby", "Python") # replaces first match
p str.gsub("Ruby", "Python")# replaces all matches
