# Load testing

Sample is taken from [Tutorial: Run a load test to identify performance bottlenecks in a web app](https://learn.microsoft.com/en-us/azure/load-testing/tutorial-identify-bottlenecks-azure-portal)

- Install [Apache JMeter](https://jmeter.apache.org/)

    ```powershell
    choco install jdk8 -y
    choco install jmeter -y
    ```

- Deploy PrimeService to Azure Container Apps using Visual Studio Code using the [Container Apps extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)


    ![ext](_images/code-ext.png)


- Create a new JMeter test plan by importing the `jmeter-test-plan.jmx` into the JMeter GUI. Update with the URL of the the container app.

    ![JMeter test plan](_images/jmeter.png)    

- Update the URL in the JMeter test plan

    ```bash
    https://primes-service.jollymeadow-f45904d6.westeurope.azurecontainerapps.io/api/Primes/20000
    ```

- Create a load testing instance in Azure

    ![Load testing instance](_images/load-testing.png)
