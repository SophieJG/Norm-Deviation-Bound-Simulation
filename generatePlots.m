function generatePlots(p, K, KsqrtlogK, MND, fileName, loglogPlot)
    PLOT_DIRECTORY = "plots/";
    prefix = PLOT_DIRECTORY + fileName;
    
    if loglogPlot
        loglog(p, KsqrtlogK, "b", p, MND, "g");
        xlabel('log p');
        legend('log(c x K(p) x sqrt(log K(p)))','log(MND(p))');
        savefig(prefix + "_p_loglog.fig");
        
        loglog(K, KsqrtlogK, "b", K, MND, "g");
        xlabel('log K');
        legend('log (c x K x sqrt(log K))','log(MND(K))');
        savefig(prefix + "_K_loglog.fig");
    else
        plot(p, KsqrtlogK, "b", p, MND, "g");
        xlabel('p');
        legend('c x K(p) x sqrt(log K(p))','MND(p)');
        savefig(prefix + "_p.fig");
        
        plot(K, KsqrtlogK, "b", K, MND, "g");
        xlabel('K');
        legend('c x K x sqrt(log K)','MND(K)');
        savefig(prefix + "_K.fig");
    end
end

