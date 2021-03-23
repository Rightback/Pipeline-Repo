FROM salesforce/salesforcedx:latest-full
RUN sfdx update
RUN sfdx plugins:install @salesforce/sfdx-scanner
RUN sfdx plugins:install @dx-cli-toolbox/sfdx-toolbox-package-utils
RUN sfdx plugins:install sfdmu
