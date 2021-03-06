function [f] = kernel_density_est_radius( X_vec,i,radius,h )
    
    
    radius = 0.000007;
    h_x = 1;
    empty_count = 0;        
    if size(idx) < 5
        empty_count =  empty_count+1
        f = -1;
    else        
        X = [x(idx(2:end))  y(idx(2:end)) z(idx(2:end))]';
        Y = [x(i) y(i) z(i)]';
        dist_mat = cvMahaldist(Y,X);
        f = sum( exp( -.5*dist_mat / h_x ) ) / size(idx,1);
            %if isnan(dist_mat(i))
            %    sprintf( 'isnan %d', i )
            %    error( 'isnan %d', i)
                %dist_m(i) = -5;
            %    f(i) = -5;
            %end
        end
        if mod(i,100)==0, sprintf( '%f completed', i/size(x,1)*100), end
    end