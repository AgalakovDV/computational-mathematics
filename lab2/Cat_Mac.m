function[times, count_nnz] = Cat_Mac(size, prc, num)

times = zeros(2, num);
count_nnz = zeros(3, num);
for i = 1:num
    AN = sprand(size, size, prc);
    AN = AN + AN';
    AN = AN + 100*speye(size);
    count_nnz(1,i) = nnz(AN);
    t1 = cputime;
    RN = chol(AN);
    times(1,i) = cputime - t1;
    count_nnz(2,i) = nnz(RN);
    % disp('t1 = ')
    % disp(t2)

    t1 = cputime;
    perm = symrcm(AN);
    RN2 = chol(AN(perm, perm));
    times(2,i) = cputime - t1;
    count_nnz(3,i) = nnz(RN2);
    % disp('t2 = ')
    % disp(t2)
end;

subplot(2,2,1), spy(AN), title('AN');
subplot(2,2,2), spy(RN), title('RN');
subplot(2,2,3), spy(AN(perm, perm)), title('new AN');
subplot(2,2,4), spy(RN2), title('new RN');