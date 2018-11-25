#include <cstring>
#include <algorithm>
#include <cstdio>
using namespace std;
const int maxn=10000+11;
int wa[maxn],wb[maxn],wv[maxn],ws[maxn];
int sa[maxn],rank[maxn],height[maxn];
int s[maxn];
bool cmp(int *r,int a,int b,int l) //注意此r数组并非下面那个r数组
{
	return r[a]==r[b] && r[a+l]==r[b+l];
	//这里能够体会到为什么要给总字符串的最后再加一位了,防止数组越界
} 
void make(int *r,int *sa,int n,int m)
{
	int i,j; //这里提前定义一下比较好一些,省得打int(虽说后者习惯了) 
	int p,*x=wa,*y=wb,*t; //x数组保存的值相当于后缀数组中的rank值 
	//基数排序,对r的每位先进行一个排序(算是第一步,也可看做预处理) 
	//因为r字符串中的字符最大值一般不是很大,所以用基数排序,若很大则改成快排
	for(i=0;i<m;i++) ws[i]=0;
	for(i=0;i<n;i++) ws[x[i]=r[i]]++;
	for(i=1;i<m;i++) ws[i]+=ws[i-1];
	for(i=n-1;i>=0;i--) sa[--ws[x[i]]]=i;
	//因为有x数组作为替代,我们没有必要去自己通过真实rank值来进行后续的比较
	for(j=1,p=1;p<n;j*=2,m=p)//若干次后续的基数排序,j每次右移一位(即*2) 
	{
		//小优化:我们都清楚基数排序的操作方法(详情见<radix-sort>)
		//当我们对第二关键字进行排序的时候,实际上可以利用上一次求得的sa数组直接算出,不必自己重新构造
		for(p=0,i=n-j;i<n;i++) y[p++]=i;
		for(i=0;i<n;i++) if(sa[i]>=j) y[p++]=sa[i]-j;
		//对于y数组的解惑:数组y保存的是对第二关键字排序的结果
		//接下来,仿照上面的单位基数排序,我们进行倍增式基数排序,形式类似(极好记忆)
		for(i=0;i<n;i++) wv[i]=x[y[i]];
		for(i=0;i<m;i++) ws[i]=0;
		for(i=0;i<n;i++) ws[wv[i]]++;
		for(i=1;i<m;i++) ws[i]+=ws[i-1];
		for(i=n-1;i>=0;i--) sa[--ws[wv[i]]]=y[i];
		//这样便将新的sa的值求出来了,下一步是求rank的值,这里要注意的是,可能有多个字符串的rank值是相同的
		//所以此时必须比较两个字符串是否完全相同
		//y数组已经没有必要再去保存值了,为了节省一些空间,我们让y数组来保存rank值
		//小优化2:数组可以用指针进行交换,见↓ 
		for(t=x,x=y,y=t,p=1,x[sa[0]]=0,i=1;i<n;i++) //不得不感叹,for循环的第一个';'前能加这么多东西 
		  x[sa[i]]=cmp(y,sa[i-1],sa[i],j)?p-1:p++;//三目运算符,这种神犇式写法见得多了
		//我们分别来看看最后求得的东西分别都去哪了
		//rank值(rank数组)被保存在x数组中,变量p的结果实际上就是不同的字符串的个数
		//小优化3:如果p==n了,说明所有的后缀都找到了,这时可以停止操作,其体现在这个大循环中,看↑
		//对于大循环中最后为什么m=p的解惑:在一次排序以后,rank数组更新了它自己的最大值,所以改变一下m有助于提高效率
	}
	return; 
}
void calheight(int *r,int *sa,int n) //搞不懂*sa是要闹哪样,一会儿看到题编编 
{
	//height数组,定义:height[i]=suffix(sa[i-1])和suffix(sa[i])的最长公共前缀 
	int i,j,k=0;//还是提前定义好 
	for(i=1;i<=n;i++) rank[sa[i]]=i; //rank数组和sa数组互为逆运算,所以构造rank数组 
	for(i=0;i<n;height[rank[i++]]=k)
	  for(k?k--:0,j=sa[rank[i]-1];r[i+k]==r[j+k];k++);
	    //内层for循环是来统计k值的,suffix(i)和它前一名的后缀的最长公共前缀至少是h[i-1]-1 
	return;
}
int main()
{
	//在这里明确一下预处理的要求,以免以后再次出现各种问题
	//首先关于下标,传入make函数的r数组下标是从1开始的直到n,这个确实没办法,因为罗神的代码中并没有给出主程序
	//需要初始化s[0]
	//(这个字符的ASCAL码值要小于前面所出现过的字符[可以直接赋0的,而且一般也这么做])
	char s1[maxn]; scanf("%s",s1);
	int n=strlen(s1);
	for(int i=1;i<=n;i++) s[i]=s1[i-1]-'a'+1;
	s[0]=0;
	make(s,sa,n+1,27);
	for(int i=1;i<=n;i++) printf("%d ",sa[i]);
	//注意求出来的sa数组的值下标也是从1开始到n的
	return 0;
}
