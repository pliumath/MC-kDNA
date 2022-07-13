function result = ispercolated(A)
%ISPERCOLATED checks if a minicircle network represented by its adjacency
%matrix A is percolated or not. 

n = size(A,1);
s = sqrt(n); %lattice size

G = graph(A);

snodes = 1:s; %nodes on the southern boundary
nnodes = s*(s-1) + snodes; %nodes on the northern boundary

wnodes = 1:s:(s^2); %nodes on the western boundary
enodes = s - 1 + wnodes; %nodes on the eastern boundary

result = false;

for i = 1:s

    sn = nearest(G,snodes(i),n); %get the n-nearest neighbors
    inters = intersect(sn,nnodes); %check if they contain ndoes on the opposite boundary

    if ~isempty(inters)
        result = true;
        break
    end

    we = nearest(G,wnodes(i),n); %get the n-nearest neighbors
    inters = intersect(we,enodes); %check if they contain ndoes on the opposite boundary

    if ~isempty(inters)
        result = true;
        break
    end

end

end