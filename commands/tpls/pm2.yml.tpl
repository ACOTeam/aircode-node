apps:
  - script     : ./src/server.js
    name       : '{{projectName}}'
    instances  : 2
    exec_mode  : cluster
    log_date_format: 'YYYY-MM-DD HH:mm Z'
    instance_var: 'INSTANCE_ID'