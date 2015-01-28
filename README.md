cloudwatch_logs Cookbook
========================

Installs and configures the AWS Cloud Watch Logs Agent. 

This is basically just a reworked version of the OpsWorks Quickstart that Amazon provides, which installs the agent and confugures the list of logs to send to Amazon.

http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/QuickStartChef.html 


Attributes
----------

e.g.
#### cloudwatch_logs::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['cwlogs']['logs']</tt></td>
    <td>Array</td>
    <td>List of logs</td>
  </tr>
</table>

##### Each log block

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>'name'</tt></td>
    <td>String</td>
    <td>Name of the destination log group.</td>
  </tr>
  <tr>
    <td><tt>'file'</tt></td>
    <td>String</td>
    <td>Path of log file for the agent to monitor and upload.</td>
  </tr>
  <tr>
    <td><tt>'date_format'</tt></td>
    <td>String</td>
    <td>Format specifier for timestamp parsing (http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/AgentReference.html)</td>
  </tr>
</table>


Usage
-----
#### cloudwatch_logs::default

Just include `cloudwatch_logs` in your node's `run_list` and configure the list of logs:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloudwatch_logs]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Joshua Halickman
