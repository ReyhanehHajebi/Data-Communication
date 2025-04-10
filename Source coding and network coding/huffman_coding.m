function huffman_coding(input_string)
    load('freq.mat', 'freq'); 
    charCodes = createHuffmanCodes(freq);
    encoded = huffman_encoding(input_string, charCodes);
    decoded = huffman_decodong(encoded, charCodes);
    fprintf('Encoded : %s\n', encoded);
    fprintf('Decoded : %s\n', decoded);
end

function charcode = createHuffmanCodes(freq)
    x = cell(1, length(freq));

    for i = 1:length(freq)

        x{i} = struct('char', char(i + 96), 'freq', freq(i), 'left', [], 'right', []);
    end

    while numel(x) > 1
        x = reorderQueueByField(x, 'freq');
        node1 = x{1};
        node2 = x{2};
        newNode = struct('char', '', 'freq', node1.freq + node2.freq, 'left', node1, 'right', node2);
        x = [{newNode}, x(3:end)];
    end
    huffmanTree = x{1};
    charcode = containers.Map;
    assignCodes(huffmanTree, '', charcode);
end

function sortedArray = reorderQueueByField(array, field)
    [~, order] = sort(cellfun(@(x) x.(field), array));
    sortedArray = array(order);
end

function encoded = huffman_encoding(input_string, charcode)
    encoded = '';
    for i = 1:length(input_string)
        encoded = strcat(encoded, charcode(input_string(i)));
    end
end

function decoded = huffman_decodong(encoded, charcode)
    reverse = containers.Map(values(charcode), keys(charcode));
    currentCode = '';
    decoded = '';
    for i = 1:length(encoded)
        currentCode = strcat(currentCode, encoded(i));
        if reverse.isKey(currentCode)
            decoded = strcat(decoded, reverse(currentCode));
            currentCode = '';
        end
    end
end

function assignCodes(node, code, charcode)
    if isempty(node.left) && isempty(node.right)
        charcode(node.char) = code;
        return;
    end

    if ~isempty(node.left)
        assignCodes(node.left, strcat(code, '0'), charcode);
    end
    if ~isempty(node.right)
        assignCodes(node.right, strcat(code, '1'), charcode);
    end
    
end







