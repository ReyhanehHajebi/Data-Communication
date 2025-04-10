function convolutional_encoder(input)
    state = "00";
    encoded = ""; 
    for i = 1:length(input)
        bit = input(i); 
        switch state
            case "00"
                if bit == '0'
                    next_state = "00";
                    output = "00";
                else
                    next_state = "10";
                    output = "11";
                end
            case "01"
                if bit == '0'
                    next_state = "00";
                    output = "10";
                else
                    next_state = "10";
                    output = "01";
                end
            case "10"
                if bit == '0'
                    next_state = "01";
                    output = "11";
                else
                    next_state = "11";
                    output = "00";
                end
            case "11"
                if bit == '0'
                    next_state = "01";
                    output = "01";
                else
                    next_state = "11";
                    output = "10";
                end
        end
        state = next_state;
        encoded = strcat(encoded, output);
    end
        fprintf('convolutional Encoded : %s\n', encoded);

end
