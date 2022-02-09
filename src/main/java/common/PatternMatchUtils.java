package common;

public abstract class PatternMatchUtils {
    public PatternMatchUtils() {
    }

    public static boolean simpleMatch(String pattern, String str) {
        if (pattern != null && str != null) {
            int firstIndex = pattern.indexOf(42);
            if (firstIndex == -1) {
                return pattern.equals(str);
            } else if (firstIndex == 0) {
                if (pattern.length() == 1) {
                    return true;
                } else {
                    int nextIndex = pattern.indexOf(42, firstIndex + 1);
                    if (nextIndex == -1) {
                        return str.endsWith(pattern.substring(1));
                    } else {
                        String part = pattern.substring(1, nextIndex);

                        for(int partIndex = str.indexOf(part); partIndex != -1; partIndex = str.indexOf(part, partIndex + 1)) {
                            if (simpleMatch(pattern.substring(nextIndex), str.substring(partIndex + part.length()))) {
                                return true;
                            }
                        }

                        return false;
                    }
                }
            } else {
                return str.length() >= firstIndex && pattern.substring(0, firstIndex).equals(str.substring(0, firstIndex)) && simpleMatch(pattern.substring(firstIndex), str.substring(firstIndex));
            }
        } else {
            return false;
        }
    }

    public static boolean simpleMatch(String[] patterns, String str) {
        if (patterns != null) {
            for(int i = 0; i < patterns.length; ++i) {
                if (simpleMatch(patterns[i], str)) {
                    return true;
                }
            }
        }

        return false;
    }
}

