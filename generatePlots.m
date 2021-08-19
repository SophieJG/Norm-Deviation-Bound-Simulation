function generatePlots(p, K, KsqrtlogK, MND, fileName, loglogPlot)
    PLOT_DIRECTORY = "plots/";
    prefix = PLOT_DIRECTORY + fileName;
    
    % compute least squares constants
    scaledK = K*leastSquares(transpose(K), transpose(MND));
    scaledKsqrtlogK = KsqrtlogK*leastSquares(transpose(KsqrtlogK), transpose(MND));
    
    if loglogPlot
        loglog(p, MND, "r", p, scaledKsqrtlogK, "b--", p, scaledK, "b:");
        xlabel('p');
        legend('MND(p)', 'c x K(p) x sqrt(log K(p))', 'c'' x K(p)');
        savefig(prefix + "_p_loglog.fig");
        
        loglog(K, MND, "r",K, scaledKsqrtlogK, "b--", K, scaledK, "b:");
        xlabel('K');
        legend('MND(K)','c x K x sqrt(log K)', 'c'' x K');
        savefig(prefix + "_K_loglog.fig");
    else
        plot(p, MND, "r", p, scaledKsqrtlogK, "b--", p, scaledK, "b:");
        xlabel('p');
        legend('MND(p)','c x K(p) x sqrt(log K(p))','c'' x K(p)');
        savefig(prefix + "_p.fig");
        
        plot(K, MND, "r", K, scaledKsqrtlogK, "b--", K, scaledK, "b:");
        xlabel('K');
        legend('MND(K)','c x K x sqrt(log K)','c'' x K');
        savefig(prefix + "_K.fig");
    end
end

