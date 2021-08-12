function generatePlots(p, K, KsqrtlogK, MND, fileName, loglogPlot)
    PLOT_DIRECTORY = "plots/";
    prefix = PLOT_DIRECTORY + fileName;
    Kscale = leastSquares(transpose(K), transpose(MND));
    
    if loglogPlot
        loglog(p, MND, "r", p, KsqrtlogK, "b--", p, K*Kscale, "b:");
        xlabel('p');
        legend('MND(p)', 'c x K(p) x sqrt(log K(p))', 'c'' x K(p)');
        savefig(prefix + "_p_loglog.fig");
        
        loglog(K, MND, "r",K, KsqrtlogK, "b--", K, K*Kscale, "b:");
        xlabel('K');
        legend('MND(K)','c x K x sqrt(log K)', 'c'' x K');
        savefig(prefix + "_K_loglog.fig");
    else
        plot(p, MND, "r", p, KsqrtlogK, "b--", p, K*Kscale, "b:");
        xlabel('p');
        legend('MND(p)','c x K(p) x sqrt(log K(p))','c'' x K(p)');
        savefig(prefix + "_p.fig");
        
        plot(K, MND, "r", K, KsqrtlogK, "b--", K, K*Kscale, "b:");
        xlabel('K');
        legend('MND(K)','c x K x sqrt(log K)','c'' x K');
        savefig(prefix + "_K.fig");
    end
end

