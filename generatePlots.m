function generatePlots(p, K, KsqrtlogK, deviation, fileName, loglogPlot)
    PLOT_DIRECTORY = "plots/";
    prefix = PLOT_DIRECTORY + fileName;
    
    if loglogPlot
        loglog(p, KsqrtlogK, "b", p, deviation, "g");
        xlabel('log p');
        legend('log(c x K(p) x sqrt(log K(p)))','log(MND(p) / complexity)');
        savefig(prefix + "_p_loglog.fig");
        
        loglog(K, KsqrtlogK, "b", K, deviation, "g");
        xlabel('log K');
        legend('log (c x K x sqrt(log K))','log(MND(K) / complexity)');
        savefig(prefix + "_K_loglog.fig");
    else
        plot(p, KsqrtlogK, "b", p, deviation, "g");
        xlabel('p');
        legend('c x K(p) x sqrt(log K(p))','MND(p) / complexity');
        savefig(prefix + "_p.fig");
        
        plot(K, KsqrtlogK, "b", K, deviation, "g");
        xlabel('log K');
        legend('c x K x sqrt(log K)','MND(K) / complexity');
        savefig(prefix + "_K.fig");
    end
end

