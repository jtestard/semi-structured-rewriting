SELECT (*$\dots$*), (
    SELECT (*$p_1$*) AS (*$u_1, \dots, p_q$*) AS (*$u_q$*),
        (*$a_1(\dots)$*) AS (*$A_1$*), ..., (*$a_m(\dots)$*) AS (*$A_m$*),
        (*$w_1(\dots)$*) OVER (PARTITION BY (*$v_1^1, \dots, v_{n_1}^1$*) ORDER BY (*$oc_1$*)) AS (*$W_1$*),
        (*$\dots$*),
        (*$w_l(\dots)$*) OVER (PARTITION BY (*$v_1^l, \dots, v_{n_l}^l$*) ORDER BY (*$oc_l$*)) AS (*$W_l$*),
        ((*$P_1$*)) AS (*$N_1$*), ..., ((*$P_k$*)) AS (*$N_k$*)
    FROM (*$\hat{F}(c_1, \dots, c_n)$*)
    WHERE (*$w$*)
    GROUP BY (*$g_1, \dots, g_i$*)
    HAVING (*$h$*)
    ORDER BY (*$o_1, \dots, o_j$*)
    LIMIT (*$l$*)
  ) AS N
FROM ...
...