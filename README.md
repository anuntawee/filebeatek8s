# Generate Grafana Dashboard to PDF and send Email # 
## PrePare Environment ##

- OS : Ubuntu 22.04

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/798c8787-a117-4419-87aa-846ec6dc0003)

## Require Install Grafana, Promethheus, node-exporter ##
- Grafana : https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/
- Prometheus : https://prometheus.io/docs/prometheus/latest/installation/
- node_exporter : https://prometheus.io/docs/guides/node-exporter/


## Install Step by Step ##
1. Install Grafana https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/

1.1 Install the prerequisite packages:
```sh
apt install -y apt-transport-https software-properties-common wget
```
1.2 Import the GPG key:
```sh
mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
```
1.3 To add a repository for stable releases, run the following command:
```sh
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```

1.4 Run the following command to update the list of available packages:
```sh
apt update
```

1.5 To install Grafana OSS, run the following command:
```sh
apt-get install grafana
```

1.6 Start Grafana
```sh
systemctl start grafana-server
```

1.7 Check status & Check Port Listen
> Result :
> 
> Service grafana-server is Running
> 
> Port Listen 3000 is Default

```sh
# Check Status grafana-server
systemctl status grafana-server

# Check port Listen
ss -plnt
```
1.8 Open Grafana with Web Browser and Login
> Default Username/Password
> 
> User : admin
> 
> Password : admin
> 
> *** You can change on frist login ***

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/7cdc187a-628d-46b4-a790-6d319b170bb9)


2. Install Prometheus
https://prometheus.io/docs/prometheus/latest/installation/

2.1 Download Prometheus (***in case we download stable version(LTS) ) 
URL : https://prometheus.io/download/
![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/ee5cb691-266c-462c-801d-246c57903f7a)

```sh
wget https://github.com/prometheus/prometheus/releases/download/v2.45.2/prometheus-2.45.2.linux-amd64.tar.gz
```

2.2 Unzip file
```sh
 tar -xzf prometheus-2.45.2.linux-amd64.tar.gz
```

2.3 Backup Origin Configure file
```sh
cd prometheus-2.45.2.linux-amd64
mv prometheus.yml prometheus.yml.bak
```

Configure prometheus & Save & Exit
```sh
vi prometheus.yml
*** Input This to File ***
global:
  scrape_interval: 15s

scrape_configs:
- job_name: node
  static_configs:
  - targets: ['localhost:9100']

```

2.4 Run Prometheus
```sh
./prometheus --config.file=prometheus.yml
```

*** When You start prometheus, Your terminal is active mode.
*** You can start prometheus to daemon process(Background Process)

2.5 Run Prometheus to daemon process(Background Process)
```sh
nohup ./prometheus --config.file=prometheus.yml &
```

2.6 You can Check prometheus is running on Port listen
```sh
ss -plnt|grep 9090
```
![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/6380008b-daed-4efe-bcb0-baf77e0a935e)

> You can follow Configure Promethheus Official
>
> https://prometheus.io/docs/prometheus/latest/getting_started/

3. Configure Grafana Dashboard

3.1 Configure DataSource

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/0259ab6b-cb04-4877-a81c-6640cea863ab)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/80a9a3c0-32a5-4efc-91f7-874b820c20e9)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/993083ea-8edc-4bac-bee9-e50a7425f627)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/369da51d-af15-489d-9ef1-ffe0d9c3cfac)

Scroll to End Page
![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/c21d23f2-f431-489a-a9ce-ea8607396996)

This Success
![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/4dacc968-0765-478d-8eec-0dd0f58c354d)

3.2 Configure Dashboard

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/cf958c58-2288-4db2-ad88-f51e88a8e8fa)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/47fa9c86-1350-465b-a0d1-6c85b6bf37d5)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/a0f43dea-f0a5-4025-a084-f87ec662a5af)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/15879db8-96f5-424a-8893-382fc09f0ad3)

![image](https://github.com/Arctica-th/DevPedOps/assets/105619969/757d8564-2597-4914-87a6-9ba9fc2456f7)


>
> You can get grafana dashboard from : https://grafana.com/grafana/dashboards
>

4. Install Node-Exporter
4.1 Download Node-Exporter
```sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
```

4.2 Run Node-Exporter
```sh
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
nohup ./node_exporter &
```

# Grafana report #

## Install NodeJS ##
```sh
apt install nodejs npm -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt -f install && apt install libgbm-dev libasound2
```

1. Unzip file
```sh
unzip grafana-generate-pdf-nodejs.zip
```

2. Install Lib
```sh
cd grafana-generate-pdf-nodejs
npm install
npm audit fix
```

3. Run grafana-generate-pdf-nodejs
```sh
export GF_DASH_URL="http://<IP_ADDRESS>:<PORT>/d/rYdddlPWk/node-exporter-full?orgId=1"
export GF_USER=user_username
export GF_PASSWORD=your_password
export OUTPUT_PDF=./output/dashboard-report.pdf
node grafana_pdf.js $GF_DASH_URL $GF_USER:$GF_PASSWORD $OUTPUT_PDF
```
