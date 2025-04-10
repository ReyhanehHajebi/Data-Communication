
name = 'reyhaneh'; 
fprintf('Original Name: %s\n', name);

encoded_source = huffmanEncode(name);
fprintf('Source Encoded (Huffman): %s\n', encoded_source);

encoded_channel = convolutional_encoder(encoded_source);
fprintf('Channel Encoded (Convolutional): %s\n', encoded_channel);

noisy_channel = noise(encoded_channel);
fprintf('Noisy Data: %s\n', noisy_channel);

decoded_channel = viterbi_decoder(noisy_channel);
fprintf('Channel Decoded (Viterbi): %s\n', decoded_channel);

decoded_source = huffmanDecode(decoded_channel);
fprintf('Decoded Name: %s\n', decoded_source);
