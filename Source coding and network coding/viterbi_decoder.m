function [decoded_sequence] = viterbi_decoder(encoded_sequence)
    N = 4; 
    num_bits = length(encoded_sequence) / 2; 

    PM = inf * ones(N, num_bits + 1); 
    PM(1, 1) = 0;

    path = zeros(N, num_bits + 1);

    received_data = reshape(encoded_sequence, 2, num_bits)';

    for i = 1:num_bits
        for s = 1:N
            min_metric = inf; 
            for prev_s = 1:N
                hamming_dist = calculate_hamming_distance(s, received_data(i, :), prev_s);
                metric = PM(prev_s, i) + hamming_dist;

                if metric < min_metric
                    min_metric = metric;
                    path(s, i + 1) = prev_s; 
                end
            end
            PM(s, i + 1) = min_metric; 
        end
    end

    [min_final_metric, final_state] = min(PM(:, num_bits + 1)); 
    decoded_sequence = zeros(1, num_bits); 

    for i = num_bits:-1:1
        decoded_sequence(i) = mod(final_state, 2); 
        final_state = path(final_state, i + 1); 
    end
end

function hamming_dist = calculate_hamming_distance(state, received_bits, prev_state)
    if state == 1
        transmitted_bits = [1 1]; 
    elseif state == 2
        transmitted_bits = [1 0]; 
    elseif state == 3
        transmitted_bits = [0 1]; 
    elseif state == 4
        transmitted_bits = [0 0];
    end
    
    hamming_dist = sum(transmitted_bits ~= received_bits);
end
