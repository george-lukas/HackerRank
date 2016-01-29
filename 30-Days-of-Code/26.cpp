#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int rd, rm, ry; cin >> rd >> rm >> ry;
    int ed, em, ey; cin >> ed >> em >> ey;
    int fine = 0;
    if (ry > ey) {
        fine = 10000;
    } else if (ry == ey && rm > em) {
        fine = 500 * (rm - em);
    } else if (ry == ey && rm == em && rd > ed) {
        fine = 15 * (rd - ed);
    }
    cout << fine << endl;
    return 0;
}