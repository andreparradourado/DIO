#!/bin/bash

echo "INICIANDO EXECUÇÃO DE SCRIPT..."

echo "CRIANDO GRUPOS DE USUÁRIOS..."
groupadd GRP_ADM
groupadd GRP_SEC
groupadd GRP_VEN

echo "CRIANDO USUÁRIOS..."
useradd carlos -c "Carlos - ADM" -G GRP_ADM -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd carlos -e
useradd joao -c "João - ADM" -G GRP_ADM -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd joao -e
useradd maria -c "Maria - ADM" -G GRP_ADM -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd maria -e
useradd amanda -c "Amanda - SEC" -G GRP_SEC -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd amanda -e
useradd josefina -c "Josefina - SEC" -G GRP_SEC -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd josefina -e
useradd rogerio -c "Rogério - SEC" -G GRP_SEC -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd rogerio -e
useradd debora -c "Débora - VEN" -G GRP_VEN -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd debora -e
useradd sebastiana -c "Sebastiana - VEN" -G GRP_VEN -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd sebastiana -e
useradd roberto -c "Roberto - VEN" -G GRP_VEN -m -p $(openssl passwd -crypt User123) -s /bin/bash
passwd roberto -e

echo "CRIANDO DIRETÓRIOS..."
mkdir /adm/ /publico/ /sec/ /ven/

echo "ATRIBUINDO PERMISSÕES DOS DIRETÓRIOS..."
chown :GRP_ADM /adm/
chown :GRP_SEC /sec/
chown :GRP_VEN /ven/

chmod 770 /adm/
chmod 777 /publico/
chmod 770 /sec/
chmod 770 /ven/

echo "SCRIPT FINALIZADO."

##PERMISSÃO DO SCRIPT
#chmod 744 iac1.sh

##VERIFICAR ALTERAÇÕES
#cat /etc/passwd
#cat /etc/group
#ls -l /home/

##DESFAZER ALTERAÇÕES
#userdel -f -r carlos
#userdel -f -r joao
#userdel -f -r maria
#userdel -f -r amanda
#userdel -f -r josefina
#userdel -f -r rogerio
#userdel -f -r debora
#userdel -f -r sebastiana
#userdel -f -r roberto
#rm -fr /adm/ /publico/ /sec/ /ven/
#groupdel -f GRP_ADM
#groupdel -f GRP_SEC
#groupdel -f GRP_VEN
