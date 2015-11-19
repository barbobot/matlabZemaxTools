set(0,'DefaultFigureWindowStyle','docked') 
fileName = input('Enter Filename with .xls or .xlsx suffix :','s');
for i = 1:9
    L_proj(:,:,i) = xlsread(fileName,i);
end

for i = 1:9
    figure
    theta_x = L_proj(1,2:end,i);
    theta_y = L_proj(2:end,1,i);
    data = L_proj(2:end,2:end,i);
    subplot(1,2,1);
    imagesc(theta_x,theta_y,data);
    [theta phi rho] = projectedToSpherical(theta_x,theta_y,data,1);
    phi = phi*pi/180;
    theta = (90-theta)*pi/180;
    [x y z] = sph2cart(phi,theta,rho);
    subplot(1,2,2);  plot3(x,y,z,'.')
end

