% figure;
% % subplot(131);
% % scatter3(vcsn,vcn,grn);
% % subplot(132);
% % scatter3(vcs,vc,gr,'g');
% % figure;
% % subplot(133);
subplot(321)
scatter3(vscn1,vsn1,grn1,'r');
hold on
scatter3(vsc1,vs1,gr1,'g');
datacursormode
hidden on
% legend('non-resovior','resovior')
hidden off
view([-101.5 14]);
xlabel('X vs');
ylabel('Y vsc');
zlabel('Z GR');
subplot(322)
scatter3(vscn2,vsn2,grn2,'r');
hold on
scatter3(vsc1,vs1,gr1,'g');
datacursormode
hidden on

hidden off
view([-101.5 14]);
xlabel('X vs');
ylabel('Y vsc');
zlabel('Z GR');
subplot(323)
scatter3(vscn3,vsn3,grn3,'r');
hold on
scatter3(vsc3,vs3,gr3,'g');
datacursormode
hidden on

hidden off
view([-101.5 14]);
xlabel('X vs');
ylabel('Y vsc');
zlabel('Z GR');
subplot(324)
scatter3(vscn4,vsn4,grn4,'r');
hold on
scatter3(vsc4,vs4,gr4,'g');
datacursormode
hidden on

hidden off
view([-101.5 14]);
xlabel('X vs');
ylabel('Y vsc');
zlabel('Z GR');
subplot(3,2,[5,6])
scatter3(vscn,vsn,grn,'r');
hold on
scatter3(vsc,vs,gr,'g');
datacursormode
hidden on

hidden off
view([-101.5 14]);
xlabel('X vs');
ylabel('Y vsc');
zlabel('Z GR');



