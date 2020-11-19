size = [1500 7000 15000];
prc = [0.01 0.001 0.0001];
prc2 = 0.0001;
num = 5;
% times = zeros(2, num);
% count_nnz = zeros(3, num);

 for i = 1:3
     figure()
     [times, count_nnz] = Cat_Mac(size(i), prc(i), num);
     disp('i')
     disp(i)
     disp('times')
     disp(times)
     disp('count_nnz')
     disp(count_nnz)
     hold on
 end
% 
% [times, count_nnz] = Cat_Mac(size(3), prc(3), num);
% 
% disp('times')
% disp(times)
% disp('count_nnz')
% disp(count_nnz)
