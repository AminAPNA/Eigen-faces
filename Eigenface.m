
clearvars;

DS = cell(1);
n_DS = 299;

DSmatrix = zeros(n_DS,9600);

for i = 1 : n_DS
    DS{i} = imresize( double( rgb2gray( imread(horzcat('P',int2str(i)),'jpg') ) ) , [120 80] );
    DSmatrix(i,:) = reshape(DS{i},1,[]);%the matrix containing n_DS rows and 80*120 columns
   % DSmatrix(i,:) = DSmatrix(i,:) / norm(DSmatrix(i,:));
end
%DSmatrix(i,:)


 B= DSmatrix;
   [U, E, V] = svd(B, 'econ');
%  C=(B')*(B);
%  %[V,D]=eigs(C,n_DS,'lm');
%  [V,D]=eigs(C,n_DS);


 Proj=zeros(n_DS,n_DS);
 for i=1: n_DS  %Projection of the data on the eigen vectors
Proj(i,:)=DSmatrix(i,:)*V; %Each one is a row vector 1*n_DS
 end

T = imresize(double(rgb2gray(imread('T','jpg'))),[120 80]);%Test
T1 = reshape(T,1,[]);
pT = T1*V;

E = zeros(1,n_DS);%Error
for i = 1:n_DS
E(1,i) = norm(pT-Proj(i,:));
end
E
[M,I]=min(E)

figure
 subplot(1,2,1), pcolor(flipud(T)), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
 subplot(1,2,2), pcolor(flipud(DS{I})), shading interp, colormap(gray), set(gca,'Xtick',[],'Ytick',[])
