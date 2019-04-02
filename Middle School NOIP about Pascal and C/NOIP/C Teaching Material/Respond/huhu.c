#include <stdio.h>
main()
{
      int h,j,a[10],N,n,i;//h为猴子身高，j为椅子高度，N为苹果个数，n为能够到的苹果个数
      scanf("%d %d %d",%h,%j,%N);
      n=0;
      for(i=1,i<=N,i++)
      {
       scanf("%d ",%a[i]);
       if(h+j>=a[i]) n++;
       printf("n=%d",n);
       getch()
	}
}
