# Général
* Spécifier Dates:ajd
* Fin de simulation Dates:finSimulation
* Cas de $MOI 
* Devise en Ar

# Possesseurs
* Personnes:$MOI 100%

# Trésoreries
* Trésoreries:$MOICompteCourant
* Trésoreries:$MOICompteEpargne

# Opérations
* `trainDeVie()`

# Constructeurs d'opérations
## trainDeVie()
* `frais`, Dates:ajd, sortir 20_000Ar depuis Trésoreries:$MOICompteCourant, jusqu'à Dates:finSimulation tous les 1 du mois

# Suivi
* `objectif_ + Dates:ajd`,Dates:ajd objectif de 0Ar pour Trésoreries:$MOICompteCourant