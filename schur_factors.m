function SF = schur_factors(M)
    [m, n] = size(M);
    m_half = ceil(m / 2);
    n_half = ceil(n / 2);
    
    SF = M(1:m_half, 1:n_half);
    SF = M(m_half+1:end, n_half+1:end) - M((m_half+1):end, 1:n_half) / SF * M(1:m_half, (n_half+1):end);
end
