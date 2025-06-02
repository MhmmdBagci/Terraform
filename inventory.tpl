all:
  hosts:
    ${vmName}:
      ansible_host: ${ip}
      ansible_user: ${user}
      ansible_ssh_private_key_file: ${path}
      
