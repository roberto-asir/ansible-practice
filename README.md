# Práctica final módulo sysadmin - Roberto Pérez 

## Indice:

- :ballot_box_with_check: [Requisitos del sistema](#requisitos-del-sistema)
- :footprints: [Pasos](#pasos)
- :camera_flash: [Capturas](#capturas)
- :hammer_and_wrench: [Comandos habituales](#comandos-habituales)
- :page_with_curl: [Logs](#logs)




***



> Esta práctica está realizada con ansible.
> Esto afecta a partes de la práctica que se han modificado para poderse realizar con los módulos propios de ansible.

> En lugar de ejecutar directamente los comandos propuestos en el enunciado de la práctica desde la shell a través de ansible se han utilizado módulos propios de ansible para aprovechar la idempotencia que ofrece esta herramienta.

***

## Requisitos del sistema

La práctica está realizada con Vagrant, VirtualBox y Ansible por lo que es necesario tener instalado en el sistema operativo anfitrión este software funcionando correctamente:

- Vagrant
- VirtualBox
- Ansible




## Pasos

1. Descargar el repositorio de github.

2. Descomprimir el zip.

2. Situado en el directorio ya descomprimido ejecutar:

```bash
vagrant up
```

3. Se puede acceder al Wordpress desde http://localhost:8081
 
 Wordpress es instalado y configurado automáticamente por lo que accediendo a la URL indicada ya carga la web. 
 No es necesario realizar acciones de configuración para instalar y generar la base de datos.

4. El stack de elk se instala de manera automática. 
 
El acceso se realiza desde http://localhost:8080  las credenciales de acceso son `kibanaadmin:kibanaadmin` y se pueden modificar en el archivo `vars/config_vars.yaml` en la sección kibanahtpasswd.

## Capturas
Los índices de elasticsearch se pueden generan automáticamente con el siguiente comando de vagrant:
```bash
vagrant ssh -c "bash /etc/generate-index-patterns.sh" practicaelkroberto
```
Es necesario ejecutar el comando una vez haya arrancado correctamente elasticsearch por lo que hay que esperar un poco hasta que carga correctamente desde la URL indicada en el punto anterior: http://localhost:8080/

Una vez ejecutado el comando se puede acceder directamente a los logs a través del siguiente enlace desde la máquina anfitrión:
 http://localhost:8080/app/discover 
 
 ![imagen](https://user-images.githubusercontent.com/2046110/187735764-429053fe-8981-45ea-9c58-820a523ca365.png)
 ![imagen](https://user-images.githubusercontent.com/2046110/187747496-bf138f0e-3d91-40f1-a6e6-d0bb308e54b2.png)

## Comandos habituales:

  - Generar las máquinas virtuales y generar el stack:
  ```bash
  vagrant up
  ```
  
  - Generar los indices de patrones en elasticksearch:
  ```bash
vagrant ssh -c "bash /etc/generate-index-patterns.sh" practicaelkroberto
```

  - Forzar la provisión desde vagrant:
  ```bash
  vagrant provision
  ```
  
  - Eliminar las máquinas virtuales del disco duro:
  ```bash
  vagrant destroy
  ```
  

## Logs:

Dejo en esta sección los logs generados al desplegar el stack.

```bash
cursoDEVOPS/sysadmins/vagrant_practica_ansible$ vagrant up
Bringing machine 'practicaelkroberto' up with 'virtualbox' provider...
Bringing machine 'practicawproberto' up with 'virtualbox' provider...
==> practicaelkroberto: Importing base box 'ubuntu/focal64'...
==> practicaelkroberto: Matching MAC address for NAT networking...
==> practicaelkroberto: Setting the name of the VM: practicaelkroberto
==> practicaelkroberto: Clearing any previously set network interfaces...
==> practicaelkroberto: Preparing network interfaces based on configuration...
    practicaelkroberto: Adapter 1: nat
    practicaelkroberto: Adapter 2: intnet
==> practicaelkroberto: Forwarding ports...
    practicaelkroberto: 80 (guest) => 8080 (host) (adapter 1)
    practicaelkroberto: 9200 (guest) => 9200 (host) (adapter 1)
    practicaelkroberto: 22 (guest) => 2222 (host) (adapter 1)
==> practicaelkroberto: Running 'pre-boot' VM customizations...
==> practicaelkroberto: Booting VM...
==> practicaelkroberto: Waiting for machine to boot. This may take a few minutes...
    practicaelkroberto: SSH address: 127.0.0.1:2222
    practicaelkroberto: SSH username: vagrant
    practicaelkroberto: SSH auth method: private key
    practicaelkroberto: 
    practicaelkroberto: Vagrant insecure key detected. Vagrant will automatically replace
    practicaelkroberto: this with a newly generated keypair for better security.
    practicaelkroberto: 
    practicaelkroberto: Inserting generated public key within guest...
    practicaelkroberto: Removing insecure key from the guest if it's present...
    practicaelkroberto: Key inserted! Disconnecting and reconnecting using new SSH key...
==> practicaelkroberto: Machine booted and ready!
==> practicaelkroberto: Checking for guest additions in VM...
==> practicaelkroberto: Setting hostname...
==> practicaelkroberto: Configuring and enabling network interfaces...
==> practicaelkroberto: Mounting shared folders...
    practicaelkroberto: /vagrant => /home/rasir/Documentos/conocimiento/cursoDEVOPS/sysadmins/vagrant_practica_ansible
==> practicaelkroberto: Running provisioner: ansible...
    practicaelkroberto: Running ansible-playbook...

PLAY [Mount partition] *********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Check disk status] *******************************************************
ok: [practicaelkroberto]

TASK [Generate physical disk] **************************************************
changed: [practicaelkroberto]

RUNNING HANDLER [Create a volume group] ****************************************
changed: [practicaelkroberto]

RUNNING HANDLER [Create logical volume] ****************************************
changed: [practicaelkroberto]

RUNNING HANDLER [Create destiny directory] *************************************
changed: [practicaelkroberto]

RUNNING HANDLER [Format lv] ****************************************************
changed: [practicaelkroberto]

RUNNING HANDLER [Mount lv on destiny] ******************************************
changed: [practicaelkroberto]

PLAY [Configure APT Elastic repositories] **************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Get Elastic key] *********************************************************
changed: [practicaelkroberto]

TASK [Add Elastic repository] **************************************************
changed: [practicaelkroberto]

PLAY [Install packages] ********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Patience, installing -- "['default-jre', 'nginx', 'logstash', 'elasticsearch', 'kibana']"] ***
changed: [practicaelkroberto]

PLAY [Configure logstash] ******************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Configure input logs] ****************************************************
changed: [practicaelkroberto]

TASK [Configure input, filter and output logs] *********************************
ok: [practicaelkroberto] => (item={'src': '../files/logstash-input-conf', 'dest': '/etc/logstash/conf.d/02-beats-input.conf'})
changed: [practicaelkroberto] => (item={'src': '../files/logstash-filter-conf', 'dest': '/etc/logstash/conf.d/10-syslog-filter.conf'})
changed: [practicaelkroberto] => (item={'src': '../files/logstash-output-conf', 'dest': '/etc/logstash/conf.d/30-elasticsearch-output.conf'})

TASK [Restart logstash] ********************************************************
changed: [practicaelkroberto]

PLAY [Install packages] ********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Patience, installing -- "['python-passlib', 'python3-passlib']"] *********
changed: [practicaelkroberto]

PLAY [Configure  kibana] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Set nginx config default to works with kibana] ***************************
changed: [practicaelkroberto]

TASK [Generate htpasswd configuration] *****************************************
changed: [practicaelkroberto]

TASK [restart nginx] ***********************************************************
changed: [practicaelkroberto]

TASK [restart kibana] **********************************************************
changed: [practicaelkroberto]

PLAY [Configure permissions and start elasticsearch service] *******************

TASK [Gathering Facts] *********************************************************
ok: [practicaelkroberto]

TASK [Change file ownership, group and permissions] ****************************
changed: [practicaelkroberto]

TASK [Restart elasticsearch] ***************************************************
changed: [practicaelkroberto]

PLAY RECAP *********************************************************************
practicaelkroberto         : ok=27   changed=19   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

==> practicawproberto: Importing base box 'ubuntu/focal64'...
==> practicawproberto: Matching MAC address for NAT networking...
==> practicawproberto: Setting the name of the VM: practicawproberto
==> practicawproberto: Fixed port collision for 22 => 2222. Now on port 2200.
==> practicawproberto: Clearing any previously set network interfaces...
==> practicawproberto: Preparing network interfaces based on configuration...
    practicawproberto: Adapter 1: nat
    practicawproberto: Adapter 2: intnet
==> practicawproberto: Forwarding ports...
    practicawproberto: 80 (guest) => 8081 (host) (adapter 1)
    practicawproberto: 22 (guest) => 2200 (host) (adapter 1)
==> practicawproberto: Running 'pre-boot' VM customizations...
==> practicawproberto: Booting VM...
==> practicawproberto: Waiting for machine to boot. This may take a few minutes...
    practicawproberto: SSH address: 127.0.0.1:2200
    practicawproberto: SSH username: vagrant
    practicawproberto: SSH auth method: private key
    practicawproberto: 
    practicawproberto: Vagrant insecure key detected. Vagrant will automatically replace
    practicawproberto: this with a newly generated keypair for better security.
    practicawproberto: 
    practicawproberto: Inserting generated public key within guest...
    practicawproberto: Removing insecure key from the guest if it's present...
    practicawproberto: Key inserted! Disconnecting and reconnecting using new SSH key...
==> practicawproberto: Machine booted and ready!
==> practicawproberto: Checking for guest additions in VM...
==> practicawproberto: Setting hostname...
==> practicawproberto: Configuring and enabling network interfaces...
==> practicawproberto: Mounting shared folders...
    practicawproberto: /vagrant => /home/rasir/Documentos/conocimiento/cursoDEVOPS/sysadmins/vagrant_practica_ansible
==> practicawproberto: Running provisioner: ansible...
    practicawproberto: Running ansible-playbook...

PLAY [Mount partition] *********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Check disk status] *******************************************************
ok: [practicawproberto]

TASK [Generate physical disk] **************************************************
changed: [practicawproberto]

RUNNING HANDLER [Create a volume group] ****************************************
changed: [practicawproberto]

RUNNING HANDLER [Create logical volume] ****************************************
changed: [practicawproberto]

RUNNING HANDLER [Create destiny directory] *************************************
changed: [practicawproberto]

RUNNING HANDLER [Format lv] ****************************************************
changed: [practicawproberto]

RUNNING HANDLER [Mount lv on destiny] ******************************************
changed: [practicawproberto]

PLAY [Configure APT Elastic repositories] **************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Get Elastic key] *********************************************************
changed: [practicawproberto]

TASK [Add Elastic repository] **************************************************
changed: [practicawproberto]

PLAY [Install packages] ********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Patience, installing -- "['nginx', 'mariadb-common', 'mariadb-server', 'php-cli', 'php-mysql', 'php-fpm', 'php-curl', 'php-gd', 'php-intl', 'php-mbstring', 'php-soap', 'php-xml', 'php-xmlrpc', 'php-zip', 'filebeat']"] ***
changed: [practicawproberto]

PLAY [Nginx installation and administration] ***********************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [sites-available to wordpress] ********************************************
changed: [practicawproberto]

RUNNING HANDLER [sites-enabled to wordpress] ***********************************
changed: [practicawproberto]

RUNNING HANDLER [delete default configuration] *********************************
changed: [practicawproberto]

RUNNING HANDLER [restart nginx] ************************************************
changed: [practicawproberto]

PLAY [Mariadb install] *********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [mariadb from repositories] ***********************************************
ok: [practicawproberto]

TASK [install requirements] ****************************************************
changed: [practicawproberto]

TASK [Create wp database] ******************************************************
changed: [practicawproberto]

TASK [create user wp database] *************************************************
changed: [practicawproberto]

PLAY [securize mariadb] ********************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Delete anonymous users] **************************************************
ok: [practicawproberto]

TASK [Delete test database] ****************************************************
changed: [practicawproberto]

TASK [Check root passwd] *******************************************************
ok: [practicawproberto]

TASK [Change root passwd] ******************************************************
changed: [practicawproberto]

TASK [Specify root credentials file] *******************************************
changed: [practicawproberto]

PLAY [Install WordPress] *******************************************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Check is_wordpress] ******************************************************
ok: [practicawproberto]

TASK [Download WordPress/etc/nginx/sites-available/wordpress] ******************
changed: [practicawproberto]

RUNNING HANDLER [Create config file] *******************************************
changed: [practicawproberto]

RUNNING HANDLER [Edit config file] *********************************************
changed: [practicawproberto] => (item={'regexp': "define\\( 'DB_NAME', '(.)+' \\);", 'line': "define( 'DB_NAME', 'practica' );"})
changed: [practicawproberto] => (item={'regexp': "define\\( 'DB_USER', '(.)+' \\);", 'line': "define( 'DB_USER', 'practica' );"})
changed: [practicawproberto] => (item={'regexp': "define\\( 'DB_PASSWORD', '(.)+' \\);", 'line': "define( 'DB_PASSWORD', 'Practica2023' );"})

RUNNING HANDLER [Request to create and populate WordPress database] ************
ok: [practicawproberto]

RUNNING HANDLER [Change Wordpress config to let access from localhost:8080] ****
changed: [practicawproberto]

PLAY [Playbook to install and configure filebeat] ******************************

TASK [Gathering Facts] *********************************************************
ok: [practicawproberto]

TASK [Enabling filebeat modules] ***********************************************
changed: [practicawproberto]

TASK [Configurate filebeat] ****************************************************
changed: [practicawproberto] => (item={'regexp': '- type: filestream', 'line': '- type: log'})
changed: [practicawproberto] => (item={'regexp': 'id: my-filestream-id', 'line': '  id: my-log-id'})
changed: [practicawproberto] => (item={'regexp': '  enabled: false', 'line': '  enabled: true'})
changed: [practicawproberto] => (item={'regexp': 'output.elasticsearch:', 'line': '#output.elasticsearch:'})
changed: [practicawproberto] => (item={'regexp': '  hosts:.*localhost:9200.*', 'line': '  # hosts: ["localhost:9200"]'})
changed: [practicawproberto] => (item={'regexp': '#output.logstash:', 'line': 'output.logstash:'})
changed: [practicawproberto] => (item={'regexp': '  #hosts:.*localhost:5044.*', 'line': '  hosts: ["192.168.50.3:5044"]'})

TASK [Configurate filebeat logs] ***********************************************
changed: [practicawproberto] => (item=    - /var/log/nginx/*.log)
changed: [practicawproberto] => (item=    - /var/log/mysql/*.log)

TASK [Restart filebeat] ********************************************************
changed: [practicawproberto]

PLAY RECAP *********************************************************************
practicawproberto          : ok=41   changed=27   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
