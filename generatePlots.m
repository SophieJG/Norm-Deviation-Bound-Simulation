function generatePlots(p, K, KsqrtlogK, MND, fileName, loglogPlot)
    PLOT_DIRECTORY = "plots/";
    prefix = PLOT_DIRECTORY + fileName;
    
    % compute least squares constants
    scaledK = K*leastSquares(transpose(K), transpose(MND));
    scaledKsqrtlogK = KsqrtlogK*leastSquares(transpose(KsqrtlogK), transpose(MND));
    
    if loglogPlot
        loglog(p, MND, "r", p, scaledKsqrtlogK, "b--", p, scaledK, "b:");
        xlabel('p');
        legend('$\textit{MND}(p)$', '$c K(p) \sqrt{\log K(p)}$', '$c'' K(p)$', ...
            'Interpreter','latex', 'location', 'northeast');
        savefig(prefix + "_p_loglog.fig");
        
        loglog(K, MND, "r",K, scaledKsqrtlogK, "b--", K, scaledK, "b:");
        xlabel('$K$', 'Interpreter','latex');
        legend('$\textit{MND}_K$','$c K \sqrt{\log K}$', '$c'' K$', ...
            'Interpreter','latex', 'location', 'northwest');
        savefig(prefix + "_K_loglog.fig");
    else
        plot(p, MND, "r", p, scaledKsqrtlogK, "b--", p, scaledK, "b:");
        xlabel('p');
        legend('$\textit{MND}(p)$','$c K(p) \sqrt{\log K(p)}$','$c'' K(p)$',...
            'Interpreter','latex', 'location', 'northeast');
        savefig(prefix + "_p.fig");
        
        plot(K, MND, "r", K, scaledKsqrtlogK, "b--", K, scaledK, "b:");
        xlabel('K');
        legend('$\textit{MND}_K$','$c K \sqrt{\log K}$','$c'' K$', ...
            'Interpreter','latex', 'location', 'northwest');
        savefig(prefix + "_K.fig");
    end
end

