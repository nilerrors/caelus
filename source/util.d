module util;

bool findInList(const string a, const string[] list) {
    foreach (string item; list) {
        if (a == item) return true;
    }
    return false;
}
