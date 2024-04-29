clc
clear all
a=[6 12 18 24];
b=[17 14 15 16 10];
c=[8 1 3 5 6;2 8 4 7 8;3 1 5 2 9;5 3 1 6 9];
if sum(a)==sum(b )
    fprintf('Given transportation problem is balanced \n')
else
    fprintf('Given transportation problem is unbalanced \n')
    if sum(a)<sum(b)
        c(end+1,:)=zeros(1,length(b))
        a(end+1)=sum(b)-sum(a)
    else
        c(:,end+1)=zeros(length(a),1)
        b(end+1)=sum(a)-sum(b)
    end
end
initialc=c;
m=size(c,1);
n=size(c,2);
x=zeros(m,n)
bfs=m+n-1
for i=1:m
    for j=1:n
        cpq=min(c(:));
        [row,col]=find(cpq==c)
        x1=min(a(row),b(col));
        [val,ind]=max(x1);
        ii=row(ind)
        jj=col(ind)
        x11=min(a(ii),b(jj));
        x(ii,jj)=x11;
        a(ii)=a(ii)-x11;
        b(jj)=b(jj)-x11;
        c(ii,jj)=inf;
    end
end
fprintf('Initia bfs= \n')
ib=array2table(x);
display(ib)
totalbfs=length(nonzeros(x))
if totalbfs==bfs
    fprintf('initial bfs is non degenerate \n')
else
    fprintf('intial bfs is degenerate \n')
end
initialcost=sum(sum(initialc.*x))
fprintf('initial bfs cost=%d \n',initialcost)
