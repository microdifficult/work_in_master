clear all;
tic
for i=5:12
    a=inv(pascal(i));
    t(i-4)=toc;
end
figure;
plot(5:12,t);
xlabel('½×Êý');
ylabel('Ê±¼ä/Ãë');

