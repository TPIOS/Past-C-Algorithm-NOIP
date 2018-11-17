#include <iostream>
#include <cstdio>
#include <ctime>
#include <cstdlib>
using namespace std;
int main()
{
	freopen("data.in","w",stdout);
	srand((int)time(0));
	int n=1+rand()%10;
	cout<<n<<endl;
	for(int i=1;i<=n;i++) {int x=1+rand()%1000; cout<<x<<endl;}
	return 0;
}
