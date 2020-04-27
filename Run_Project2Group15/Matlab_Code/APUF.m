% performance analysis of APUF

APUF_data1 = xlsread ('APUFdata.xlsx');
APUF_data = APUF_data1(:,65);

%reliability---------------------------------------------------------------------------------------
intra_HD = pdist(APUF_data,'hamming');
M_intra= mean(intra_HD);
reliability = 1-M_intra;
fprintf('reliability is: %f%%\n',reliability*100);

%uniqueness---------------------------------------------------------------------------------------
XOR_data1 = xlsread ('XOR.xlsx');
XOR_data = XOR_data1(:,65);
inter_data = zeros(2,100);
inter_data(1,:) = transpose(APUF_data);
inter_data(2,:) = transpose(XOR_data);
inter_HD = pdist(inter_data,'hamming');
fprintf('inter_HD is: %f%%',inter_HD*100);

%randomness---------------------------------------------------------------------------------------
mean0_1 = mean(APUF_data);
figure(1);
APUF_data_ran = reshape(APUF_data,10,10);
image(APUF_data_ran,'CDatamapping','scaled');


