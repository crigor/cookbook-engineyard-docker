# Docker on Engineyard

Chef repository to setup Docker on a utility instance.

## Instructions

```
berks vendor output/cookbooks
cd output
ey upload -e <target_environment>
ey apply -e <target_environment>
```
