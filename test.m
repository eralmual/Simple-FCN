#!/usr/bin/octave-cli

# usage test(shape, ds_size, numdata_test, num_classes)
# 
# This functions tests the neural network using previously trained weights and shows heat maps about the predictions
# 
# shape: shape to test. Default = "vertical"
# ds_size: size of the data set that the model was trained with. Default = 1000
# numdata_test: size of the testing data set. Default = 128
# num_classes: number of classes that the model was trained with. Default = 3

function test(shape="vertical",ds_size = 1000,  numdata_test=128, num_classes = 3)
    pkg load statistics;
	ws = glob(["./weights/" strcat(shape,  "*", num2str(ds_size), "*",num2str(num_classes)), "_*"]);
	if(size(ws)(1)==2)
		w1strfile = ws{1};
		w2strfile = ws{2};

		W1 = csvread(w1strfile);
		W2 = csvread(w2strfile);
		numclasses=rows(W2);
		[X, Y] = create_data(numdata_test, num_classes, shape);

        model = FCN(2, num_classes, "dg");

        model.layers{1}.weights = W1;
        model.layers{2}.weights = W2;


        Y_pred = [];

        for(i=[1:rows(X)])
            [Y_curr, fwd]=model.predict(X(i, :));
            Y_pred = [Y_pred; Y_curr];

        endfor

  
        # Filter Y
        Y_norm = zeros(rows(Y_pred), columns(Y_pred));
        for(i=[1:rows(Y_pred)])
            [m, mi] = max(Y_pred(i,:));
            Y_norm(i,mi) = 1;
        endfor
        

        figure("name", "Testing Set")
        plot_data(X,Y_norm);
        
        confusion_matrix(Y, Y_norm);
        plot_maps(model,X,Y,rows(W2'));

	else
		disp("Can't find specific files\n Matched files to filter with identifier are:");
		ws

	endif
endfunction