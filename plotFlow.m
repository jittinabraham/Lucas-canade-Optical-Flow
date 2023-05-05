function plotFlow(vu, vv, I, deci)
    % Downsample flow vectors
    decimated_vu = vu(1:deci:end, 1:deci:end);
    decimated_vv = vv(1:deci:end, 1:deci:end);
    
    % Create grid for flow field
    [X, Y] = meshgrid(1:deci:size(I, 2), 1:deci:size(I, 1));
    
    % Plot flow vectors using quiver
    figure;
    imshow(I);
    hold on;
    quiver(X(:), Y(:), decimated_vu(:), decimated_vv(:), 0, 'Color', 'r','LineWidth',6);
    hold off;
end
