# Create Lab VM - Optional

- Execute `create-lab-vm.azcli` or run the following remote script in Cloud Shell

    ```bash
    curl https://raw.githubusercontent.com/arambazamba/az-204/main/Setup/create-lab-vm.azcli | bash
    ```

    ![create-labvm](_images/create-lab-vm.jpg)

- Go to Ressource Group `az-lab` and connect to VM using RDP and the credentials that you have used in the script:

- Download RDP File:

    ![download-rdp](_images/download-rdp.jpg)

- Optional - Disable Login Question:

    ![disable-login](_images/disable-login.jpg)

- Trust the RDP Connection:

    ![connect-rdp](_images/trust-vm.jpg)

    Credentials:

    ```
    user=azlabadmin
    pwd=Lab@dmin1234
    ```

    ![sign-in.jpg](_images/sign-in.jpg)

- Accept default settings:

    ![accept-settings](_images/accept-settings.jpg)