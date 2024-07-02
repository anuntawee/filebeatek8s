export GF_DASH_URL="http://<IP_ADDRESS>:<PORT>/d/rYdddlPWk/node-exporter-full?orgId=1&from=now-5m&to=now"
export GF_USER=your_username
export GF_PASSWORD=your_password
export OUTPUT_PDF=./output/node-exporter-dashboard.pdf
cd <PATH>/grafana-generate-pdf-nodejs
node grafana_pdf.js $GF_DASH_URL $GF_USER:$GF_PASSWORD $OUTPUT_PDF
