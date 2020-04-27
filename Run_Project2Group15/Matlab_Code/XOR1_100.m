
data = xlsread('xor_data.xlsx');
output=data(:,65);
out1=output(1:100,1);
out2=output(101:200,1);
out3=reshape(out1,10,10);
figure(1)
image(out3,'CDataMapping','scaled');
intra_HD=zeros(1,4950);
k=1;
for j=1:99
        for h=j+1:100
            intra_HD(1,k)=xor(out1(j,1),out1(h,1)); 
            k=k+1;
        end
end
HD1=mean(intra_HD);
out4=zeros(2,100);
out4(1,:)=output(1:100,1);
out4(2,:)=output(101:200,1);
inter_HD=sum(xor(out4(1,:),out4(2,:))); 
HD2=inter_HD/100;




