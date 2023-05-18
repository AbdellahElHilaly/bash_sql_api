#----------------------------------------------------------
#       GOLD V507  : REMONTEE DES VENTES
#----------------------------------------------------------
# PROJET LABEL VIE
# PRD 22/09/08
# BC_J_REMVENTE

. $HOME/env/envGOLD  
. $HOME/env/envBATCH 
. $HOME/env/env/envDATE

#
#
#

echo "START $0 \t`date`" >> $LOGBATCH/mon.$YDATE #$0 is the name of the script
#
# RECUPERATION ET CHARGEMENT DES FICHIERS DE VENTE DANS LA TABLE INTERFACE
# $HOME/TPV/PROG/trait_tous >> $LOGBATCH/${YDATE}_BC_J_REMVENTE.log 2>> $LOGBATCH/${YDATE}_BC_J_REMVENTE.err
$HOME/TPV/PROG/alimente_tous >> $LOGBATCH/${YDATE}_BC_J_ALIMENTE.log 2>> $LOGBATCH/${YDATE}_BC_J_ALIMENTE.err
$HOME/TPV/PROG/trait_tous.cp >> $LOGBATCH/${YDATE}_BC_J_TRAITEMENT.log 2>> $LOGBATCH/${YDATE}_BC_J_TRAITEMENT.err

# Lancement RAO
$HOME/batch/BC_J_RAO.sh
#Lancement de la premiere liste des magasins
#$HOME/batch/BC_J_RAO_L1.sh
# Lancement du verif tab
$HOME/TPV/PROG/insert_remontee  >> $LOGBATCH/${YDATE}_BC_J_TRAITEMENT.log 2>> $LOGBATCH/${YDATE}_BC_J_TRAITEMENT.err
#$HOME/TPV/VENTES/Generer_Tableau_Bord >> $LOGBATCH/${YDATE}_BC_J_TABLEAU_BORD.log 2>> $LOGBATCH/${YDATE}_BC_J_TABLEAU_BORD.err
#$HOME/TPV/PROG/RECETTE/recette_all_sites >> $LOGBATCH/${YDATE}_BC_J_RECETTE.log 2>> $LOGBATCH/${YDATE}_BC_J_RECETTE.err
#
echo "  END $0 \t`date`\n" >> $LOGBATCH/mon.$YDATE
#

#echo "Traitement de la remontee de client priviligies" >> $LOGBATCH/${YDATE}_BC_J_TRAITEMENT.log

#$HOME/TPV/PROG/remontee_client > /gold/TPV/PROG/ventes_clients.log
#$HOME/TPV/PROG/G_VENDEUR/gestion_vendeur >> /gold/TPV/PROG/ventes_clients.log


#i this script can do just :  writing the result of a query to a file? -> yes
#where is the code of query? -> in the script line 10 to 13