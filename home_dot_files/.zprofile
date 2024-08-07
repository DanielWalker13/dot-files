alias cls="clear"
alias cfv="lvim ~/nvim-commander/nvim/.config/nvim"
# alias cdv="cd ~/nvim-commander/nvim/.config/nvim"
alias cfv="lvim ~/.local/share/lunarvim/lvim"
alias cdv="cd ~/.local/share/lunarvim/lvim"

alias cfz="lvim ~/.zshrc"
alias cfzp="lvim ~/.zprofile"
alias cft="lvim ~/.tmux.conf"
alias cfo="lvim ~/.tmux.conf"
alias hist="lvim ~/.zsh_history"

alias zsc="source ~/.zshrc; source ~/.zprofile"
alias tsc="tmux source-file ~/.tmux.conf"

# SSH Hosts
alias sshvpn="ssh -i ~/.ssh/magic_mirror_dirty dirty@192.168.1.80"
alias sshmm="ssh -i ~/.ssh/magic_mirror_dirty marvin@192.168.1.90"
alias sshm1="ssh -i ~/.ssh/k3s_main marvin@192.168.1.200"
alias sshn1="ssh -i ~/.ssh/k3s_main marvin@192.168.1.101"
alias sshn2="ssh -i ~/.ssh/k3s_main marvin@192.168.1.102"
alias sshn3="ssh -i ~/.ssh/k3s_main marvin@192.168.1.103"
alias sshn4="ssh -i ~/.ssh/k3s_main marvin@192.168.1.104"
alias sshn5="ssh -i ~/.ssh/k3s_main marvin@192.168.1.105"


alias t="terraform"
alias boom="aws-fed login vault-dev && export AWS_PROFILE='saml' && terraform destroy"
alias md="macdown"
alias ti="terraform init"
alias tp="terraform plan"
alias tpb="terraform plan -out input.binary"
alias ts="terraform show -json input.binary >"
alias yolo="terraform apply -auto-approve"
alias ct="conftest test"
# alias fg="fregot"


alias nfl="/Users/rant/Work/Initech/nfl_app_data_explore/my_nfl_data_py_explore"
alias tpy="cd ~/Documents/Development/Python"
alias mark="nvim ~/Documents/Development/Git/markdown.md"
alias es="nvim ~/Documents/Development/Git/markdown.md"
alias vman="nvim ~/Documents/Development/Git/vim.md"
alias research="nvim ~/Documents/Security/Notes/research.md"
# alias vim="nvim"
alias vim="lvim"

alias coe="aws-fed login coe-dev && export AWS_PROFILE='saml'"
alias tunzip="tar zxvf"
alias gctl="glooctl"
alias mgwr="sudo /usr/local/McAfee/Mcp/bin/mcpcontrol.sh restart"
alias mgws="curl 'http://wdccipmon01.internal.cigna.com/ticket/index.php' && sleep 600"

alias ff='nvim $(fzf)'

### Cli
# less | vim -
# more | vim -

### Grep
alias gtfr="grep -r 'resource \"' ."

### AWS SSO

alias orgmgmt="aws sso login --profile trainingsetup-management && export AWS_PROFILE='trainingsetup-management'"
alias inidev="aws sso login --profile initech-dev && export AWS_PROFILE='initech-dev'"

### Tmux


# alias tll="tmux ls"
# alias tnew="tmux new -s "  # Investigate initiating without enters session
# alias ta="tmux attach"
# alias tar="tmux attach -t "


### Work Dirs
alias team="cd ~/Work/team_structure"
alias infra="cd ~/Work/Vault/vault-infra/"
alias gsil="cd ~/Work/gsil"
alias ggo="cd ~/Work/gsil/temp_py_testing/_go_ingestion"
alias pro="cd /Users/c03104/Work/protegirty"
alias esc="cd ~/Work/gsil/_es_cluster"
alias tmap="cd ~/Work/scripts/python_testing/terra_map"
alias spot="~/Development/Python/Mini_Projects/spotify/src"


alias adecode="aws sts decode-authorization-message --encoded-message"

### Git

# ="export VAULT_TOKEN=$(vault login -method=aws -field=token role=v-dev) && vault write aws/creds/deploy_infra -format=json ttl=900"

alias ssm="aws ssm start-session --target"
alias b="bash"
alias c-="cd -"
alias g-="git -"
alias gb="git branch"
alias gbr="git branch -a"
alias gc="git commit -ma"
alias gch="git checkout"
alias gdel="git branch -d"
alias gd="git diff --staged"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias gl="git log --graph"
alias glp='git log --pretty=format:"%h %s" --graph'
alias grl="git reflog"
alias gdrb="git push origin --delete"
alias gamend="git commit --amend --no-edit"
alias gurl="git config --get remote.origin.url"
alias gsrc="git remote show origin"

#### Git Worktrees
alias gcb="git clone --bare"
alias gwa="git worktree add "

### Python
#
# alias python="python3"
alias py ="python3"
# alias pip="pip3"

alias venvn="python3 -m venv ./venv"
alias venva="source ./venv/bin/activate"
alias venvd="deactivate"

### Poetry 

alias ps="poetry show"
alias pso="poetry show --outdated"
alias psh="poetry shell"
alias pa="poetry add"
alias pad="poetry add --dev"
alias pr="poetry run"
alias prapp="poetry run uvicorn src.main:app --reload"
alias pu="poetry update"
alias pi="poetry install"
alias pin="poetry install --no-dev"
alias ppath="poetry env info --path" 



### Docker compose

alias dcr="docker compose down && docker compose up -d --build"
alias dcl="docker compose logs"
alias dclt="docker compose logs -f"

dce()
{
  docker compose exec $1 bash
}

# # Elastic Search
# alias curlj="curl -H 'Content-Type:json' -X$@ https://vpc-sdl-es-tcwkixc2b3uss6m3ketxr2zi5y.us-east-1.es.amazonaws.com/$@"

alias gl="git log --graph"

## Googler

alias goog="googler --notweak"


# Project Dirs

alias wrk="cd ~/Work/"
alias dev="cd ~/Development/"
alias prj="cd ~/Development/Projects/"
alias flash="cd ~/Development/Python/Projects/flash_cards/services/"


### Brew
alias brewd="ll /usr/local/cellar/"
alias bp="brew --prefix"


### AWS Commands ###

alias eksdesc="aws eks describe-cluster --region us-east-1 --name"
# NOTE: Example connection to eks cluster
# alias eksgseconf="aws eks --region us-east-1 update-kubeconfig --name <cluster_name>"


#### Kubernetes Commands ####
# Cheat sheet: https://kubernetes.io/docs/reference/kubectl/cheatsheet/

## General ##

alias kc="kubectl"
alias kcf="kubectl config "
alias kcfls="kubectl config view"
alias kmap="kubectl get configmap"
alias kmapdel="kubectl delete configmap"
alias kall="kubectl get all"
alias kalla="kubectl get all -A"
alias ke="kubectl get events"

alias kea="kubectl get events --all-namespaces --sort-by='.metadata.creationTimestamp'"


# Followed by pod name
alias kl="kubectl logs"

## Services ##
alias ksvc="kubectl get svc"
alias ksvcd="kubectl describe svc"
alias ksvcdel="kubectl delete svc"
alias ksa="kubectl get sa"
alias ksad="kubectl describe sa"
alias ki="kubectl get Ingress"

## Namespaces  ##

alias kns="kubectl get namespace"
alias knsc="kubectl create namespace"
alias knsd="kubectl describe namespace"
alias knsdel="kubectl delete namespace"
# TODO: Fix get namespace
alias knschk="kubectl config view --minify | grep namespace:"

alias kctx="kubectl config get-contexts"
alias kctxs="kubectl config use-context"
alias kctxd="kubectl config unset contexts."

## Pods ##

alias kp="kubectl get pods"
alias kpd="kubectl describe pods"
alias kpdel="kubectl delete pod"
alias kpns="kubectl get pods --A"
alias kpl="kubectl get pods --show-labels"

## Nodes ##

alias kn="kubectl get nodes"
alias knd="kubectl describe nodes"


# Deployments
alias kd="kubectl get deployment"
alias kdd="kubectl describe deployment"

# Daemonset
alias kds="kubectl get daemonset"
alias kdsd="kubectl describe daemonset"

# Pod Security Policies
alias kpsp="kubectl get psp"
alias kpspd="kubectl describe psp"

## Deploy ##

alias kyolo="kubectl apply -f"
alias kdc="kubectl create deployment"
alias kddel="kubectl delete deployment"
alias kexec="kubectl exec -- bash -it"
# alias kc=""
# alias kc=""


## Destroy ##
alias kdel="kubectl delete -f"

## Proxy ##
alias kproxy="kubectl proxy"
# creates temporyary admin for pushing commands to cluster as mac local admin for troubleshooing isseus via curl in dev
# kubectl create clusterrolebinding --user {username} {rulename} --clusterrole cluster-admin

# Helm

## General ##
alias hls="helm ls"
alias hlsa="helm list --all-namespaces"
alias hlsn="helm ls --namespace"
alias hpl="helm plugin list"
# Prints All environment variables
alias henv="helm env"

# Charts
alias hcc="helm create"

## Repo ##
alias hrl="helm repo list"
alias hra="helm repo add"
alias hrd="helm repo remove"
alias hru="helm repo update"

## Deployment ##
alias hi="helm install"
alias hu="helm upgrade"
alias hrb="helm rollback"
alias hui="helm uninstall"


## Release Info ##
# -> release numbeer
# -> helm ls prints release names
alias hrla="helm get all"
alias hrlh="helm get hooks"
alias hrlhis="helm history"
alias hrlm="helm get manifest"
alias hrln="helm get notes"
alias hrlv="helm get values"


kctxns ()
{
    kubectl config set-context --current --namespace="$1"
}

fgrep ()
{
    grep -r "$1" . | fzf
}

cdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

### -------  AWS -------- ###

# Login Profiles
alias inidev='aws sso login --profile initech-dev; export AWS_PROFILE=initech-dev'

#
# TODO: Break out non applicable command for Cigna to personal file
# TODO: Fix all aliases
# TODO: explore additional commands:
#
### _______ Well Vetted ________ ##

## Get all resource Arns

alias awsall="aws resourcegroupstaggingapi  get-resources --region us-east-1 | jq '.ResourceTagMappingList | [.[].ResourceARN]'"

## API Gateway

###
alias awsid="aws sts get-caller-identity --output json | jq ' . | {Account: .Account, Arn: .Arn}'"

alias awsido="aws sts get-caller-identity --output json | jq ' .Account'"

### Lambda


alias lambdaall="aws lambda list-functions | jq -r ' .[][]'"
alias lambda="aws lambda list-functions | jq -r ' .[][] | { Name: .FunctionName, Arn: .FunctionArn, Role: .Role, Handler: .Handler, Vpc: .VpcConfig}'"
alias lambdal="aws lambda list-layers | jq -r '.Layers[ ]'"


### RDS

alias rds="aws rds describe-db-instances --output json | jq '. | .[] | .[] | { Type: .StorageType, CluserId: .DBClusterIdentifier, Arn: .DBInstanceArn,  KmsArn: .KmsKeyId, Encrypted: .StorageEncrypted, Public:.PubliclyAccessible, Tags: .TagList }'"
alias rdspg="aws rds describe-db-parameter-groups --output json | jq '. | .[]'"
alias rdssg="aws rds describe-db-subnet-groups --output json | jq '.'"


### Security Groups
alias sgs="aws ec2 describe-security-groups | jq '.SecurityGroups[]|\"{ Security Group: \"+.GroupId+\", Security Group Name: \"+.GroupName+\" }\"'"

### Subnets
alias subnets="aws ec2 describe-subnets --filter Name=vpc-id,Values=vpc-0ec6479de7f4445c2| jq  '.Subnets[] | .SubnetId, .VpcId, .CidrBlock, .AvailabilityZone, (.Tags | .[] | select(.Key==\"Name\" ) | .Value ), (.Tags | .[] | select(.Key!=\"Name\" ))'"

alias subnetid="aws ec2 describe-subnets | jq  '.Subnets[] | .SubnetId, .VpcId, (.Tags | .[] | select(.Key==\"Name\" ) | .Value )'"

alias vpc="aws ec2 describe-vpcs | jq  '.Vpcs[] | { Name: .Tags | .[] | select(.Key==\"Name\") | .Value, VpcId: .VpcId }'"



### _______ Well Vetted ________ ##

### List API Gateway IDs and Names
alias apigwid="aws apigateway get-rest-apis | jq -r ‘.items[ ] | .id+\” \“+.name’"

### List API Gateway keys
alias apigwkey="aws apigateway get-api-keys | jq -r ‘.items[ ] | .id+\” \“+.name’"


### List API Gateway domain names
alias apigwdn="aws apigateway get-domain-names | jq -r ‘.items[ ] | .domainName+\” \“+.regionalDomainName’"


### List resources for API Gateway
alias apigwres="aws apigateway get-resources --rest-api-id ee86b4cde | jq -r ‘.items[ ] | .id+\” \“+.path’"

### Find Lambda for API Gateway resource
alias apigwlambda="aws apigateway get-integration --rest-api-id (id) --resource-id (resource id) --http-method GET | jq -r ‘.uri’"

## Amplify

### List Amplify apps and source repository
# aws amplify list-apps | jq -r ‘.apps[ ] | .name+” “+.defaultDomain+”

## CloudFront

### List CloudFront distributions and origins
# aws cloudfront list-distributions | jq -r ‘.DistributionList.Items[ ] | .DomainName+” “+.Origins.Items[0].DomainName’


### Create a new invalidation
# aws cloudfront create-invalidation [distribution-id]


## CloudWatch

### List information about an alarm
alias cwaws="cloudwatch describe-alarms | jq -r ‘.MetricAlarms[ ] | .AlarmName+\” \“+.Namespace+\” \“+.StateValue’"

### Delete an alarm or alarms (you can delete up to 100 at a time)
alias cwdela="aws cloudwatch delete-alarms --alarm-names"


## Cognito
#
### List user pool IDs and names
# aws cognito-idp list-user-pools --max-results 60 | jq -r ‘.UserPools[ ] | .Id+” “+.Name’


### List phone and email of all users
# aws cognito-idp list-users --user-pool-id (resource) | jq -r ‘.Users[ ].Attributes | from_entries | .sub + “ “ + .phone_number + “ “ + .email’


## DynamoDB

###List DynamoDB tables
alias ddb= "aws dynamodb list-tables | jq -r .TableNames [ ]"

### Get all items from a table
alias ddbai="aws dynamodb scan --table-name events"


### Get item count from a table
alias ddbic="aws dynamodb scan --table-name events --select count | jq .ScannedCount"


### Get item using key
# alias ddbibk="aws dynamodb get-item --table-name events --key ‘{\“email\”\”\"email@example.com\”}}’"


### Get specific fields from an item
# aws dynamodb get-item --table-name events --key ‘{“email””"email@example.com"}}’ --attributes-to-get event_type


### Delete item using key
# aws dynamodb delete-item --table-name events --key ‘{“email””email@domain.com”}}’


## EBS

### Complete a Snapshot
alias ebscoms="aws ebs complete-snapshot" #<snapshot-id>


### Start a Snapshot
# aws ebs start-snapshot --volume-size (value)


### Get a Snapshot block

# aws ebs get-snapshot-block
# --snapshot-id (value)
# --block-index (value)
# --block-token (value)


## EC2

### List Instance ID, Type and Name
alias ec2="aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|.InstanceId+\" \"+.InstanceType+\" \"+(.Tags[] | select(.Key == \"Name\").Value)'"


### List Instances with public IP address and Name
alias ec2pip="aws ec2 describe-instances --query 'Reservations[*].Instances[?not_null(PublicIpAddress)]' | jq -r '.[][]|.PublicIpAddress+\" \"+(.Tags[]|select(.Key==\"Name\").Value)'"


alias eni="aws ec2 describe-network-interfaces --output json | jq '.NetworkInterfaces'"



### Print Security Groups for an Instance
alias sgsid="aws ec2 describe-instances --instance-ids i-0dae5d4daa47fe4a2 | jq -r '.Reservations[].Instances[].SecurityGroups[]|.GroupId+\" \"+.GroupName'"


## Edit Security Groups of an Instance
alias sgsinst="aws ec2 modify-instance-attribute --instance-id i-0dae5d4daa47fe4a2 --groups"


### Print Security Group Rules as FromAddress and ToPort
alias sgsr="aws ec2 describe-security-groups --group-ids sg-02a63c67684d8deed | jq -r '.SecurityGroups[].IpPermissions[]|. as $parent|(.IpRanges[].CidrIp+" "+($parent.ToPort|tostring))'"


### Add Rule to Security Group
# aws ec2 authorize-security-group-ingress --group-id sg-02a63c67684d8deed --protocol tcp --port 443 --cidr 35.0.0.1


### Delete Rule from Security Group
# aws ec2 revoke-security-group-ingress --group-id sg-02a63c67684d8deed --protocol tcp --port 443 --cidr 35.0.0.1

### Edit Rules of Security Group
# alias sgseditr="aws ec2 update-security-group-rule-descriptions-ingress --group-id sg-02a63c67684d8deed --ip-permissions 'ToPort=443,IpProtocol=tcp,IpRanges=[{CidrIp=202.171.186.133/32,Description=Home}]'


### Delete Security Group
# aws ec2 delete-security-group --group-id sg-02a63c67684d8deed

## ECS

###Create an ECS cluster
# TODO: replace <name>
# alias ecs="aws ecs create-cluster --cluster-name=<name> --generate-cli-skeleton"

### Create an ECS service
# alias ecscs="aws ecs create-service"

## EKS

### Create a cluster
# aws eks create-cluster --name (cluster name)


### Delete a cluster
# aws eks delete-cluster --name (cluster name)


### List descriptive information about a cluster
alias eksd="aws eks describe-cluster --name" # <cluster name>


### List clusters in your default region
alias eks="aws eks list-clusters"

### Tag a resource
# aws eks tag-resource --resource-arn (resource_ARN) --tags (tags)

## Untag a resource
# aws eks untag-resource --resource-arn (resource_ARN) --tag-keys (tag-key)

## ElastiCache

# Get information about a specific cache cluster
# aws elasticache describe-cache-clusters | jq -r ‘.CacheClusters[ ] | .CacheNodeType+” “+.CacheClusterId’


# List ElastiCache replication groups
# aws elasticache describe-replication-groups | jq -r ‘.ReplicationGroups [ ] | .ReplicationGroupId+” “+.NodeGroups[ ].PrimaryEndpoint.Address’


# List ElastiCache snapshots
# aws elasticache describe-snapshots | jq -r ‘.Snapshots[ ] | .SnapshotName’


# Create ElastiCache snapshot
# aws elasticache create-snapshot --snapshot-name backend-login-hk-snap-1 --replication-group-id backend-login-hk --cache-cluster-id backend-login-hk


# Delete ElastiCache snapshot
# aws elasticache delete-snapshot --snapshot-name login-snap-1


# Scale up/down ElastiCache replica
# aws elasticache increase-replica-count --replication-group-id backend-login --apply-immediately
# aws elasticache decrease-replica-count --replication-group-id backend-login --apply-immediately

## ELB

# List ELB Hostnames
# aws elbv2 describe-load-balancers --query ‘LoadBalancers[*].DNSName’ | jq -r ‘to_entries[ ] | .value’


# List ELB ARNs
# aws elbv2 describe-load-balancers | jq -r ‘.LoadBalancers[ ] | .LoadBalancerArn’


# List of ELB target group ARNs
# aws elbv2 describe-target-groups | jq -r ‘.TargetGroups[ ] | .TargetGroupArn’


# Find instances for a target group
# aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:ap-northwest-1:20394823094:targetgroup/wordpress-ph/203942b32a23 | jq -r ‘.TargetHealthDescriptions[ ] | .Target.Id’

## IAM Group

# List groups
# aws iam list-groups | jq -r .Groups[ ].GroupName


# Add/Delete groups
# aws iam create-group --group-name (groupName)


# List policies and ARNs
# aws iam list-policies | jq -r ‘.Policies[ ]|.PolicyName+” “+.Arn’
# aws iam list-policies --scope AWS | jq -r ‘.Policies[ ]|.PolicyName+” “+.Arn’
# aws iam list-policies --scope Local | jq -r ‘.Policies[ ]|.PolicyName+” “+.Arn’


# List user/group/roles for a policy
# aws iam list-entities-for-policy --policy-arn arn:aws:iam:2308345:policy/example-ReadOnly

# List policies for a group
# aws iam list-attached-group-policies --group-name (groupname)

# Add policy to a group
# aws iam attach-group-policy --group-name (groupname) --policy-arn arn:aws:iam::aws:policy/exampleReadOnlyAccess


# Add user to a group
# aws iam add-user-to-group --group-name (groupname) --user-name (username)

# Remove user from a group
# aws iam remove-user-from-group --group-name (groupname) --user-name (username)

# List users in a group
# aws iam get-group --group-name (groupname)

# List groups for a user
# aws iam list-groups-for-user --user-name (username)

# Attach/detach policy to a group
# aws iam attach-group-policy --group-name (groupname) --policy-arn arn:aws:iam::aws:policy/DynamoDBFullAccess
# aws iam detach-group-policy --group-name (groupname) --policy-arn arn:aws:iam::aws:policy/DynamoDBFullAccess

# IAM User
# List userId and UserName
# aws iam list-users | jq -r ‘.Users[ ]|.UserId+” “+.UserName’

# List access keys for user
# aws iam list-access-keys --user-name (username) | jq -r .AccessKeyMetadata[ ].AccessKeyId

# Delete access key for user
# aws iam delete-access-key --user-name (username) --access-key-id (accessKeyID)

# Activate/deactivate access key for user
# aws iam update-access-key --status Active --user-name (username) --access-key-id (access key)
# aws iam update-access-key --status Inactive --user-name (username) --access-key-id (access key)

# Generate new access key for user
# aws iam create-access-key --user-name (username) | jq -r ‘.AccessKey | .AccessKeyId+” “+.SecretAccessKey’

## Lambda




### List source event for Lambda
# aws lambda list-event-source-mappings | jq -r ‘.EventSourceMappings[ ] | .FunctionArn+” “+.EventSourceArn’

# "aws lambda list-functions | jq -r ' .[][] | { Name: .FunctionName, Arn: .FunctionArn, Role: .Role,       Handler: .Handler, Vpc: .VpcConfig}'"

### RDS
# aws rds create-db-snapshot --db-snapshot-identifier snapshot-1 --db-instance-identifier dev-1
# aws rds describe-db-snapshots --db-snapshot-identifier snapshot-1 --db-instance-identifier general


### Take DB cluster snapshot
# aws rds create-db-cluster-snapshot --db-cluster-snapshot-identifier

## Route53

### Create hosted zone
# aws route53 create-hosted-zone --name exampledomain.com


# Delete hosted zone
# aws route53 delete-hosted-zone --id example

### Get hosted zone
alias r53ghz="aws route53 get-hosted-zone --id" #<example>

### List hosted zones
alias r53hz="aws route53 list-hosted-zones"


### Create a record set
# To do this you’ll first need to create a JSON file with a list of change items in the body and use the CREATE action. For example the JSON file would look like this.

# {
#      "Comment": "CREATE/DELETE/UPSERT a record",
#      "Changes": [{
#      "Action": "CREATE",
#           "ResourceRecordSet":{
#                "Name": "a.example.com",
#                "Type": "A",
#                "TTL": 300,
#           "ResourceRecords":[{"Value":"4.4.4.4"}]
# }}]
# }
# Once you have a JSON file with the correct information like above you will be able to enter the command

# aws route53 change-resource-record-sets --hosted-zone-id (zone-id) --change-batch file://exampleabove.json


# Update a record set

# To do this you’ll first need to create a JSON file with a list of change items in the body and use the UPSERT action. This will either create a new record set with the specified value, or updates a record set if it already exists. For example the JSON file would look like this.

# {
#      "Comment": "CREATE/DELETE/UPSERT a record",
#      "Changes": [{
#      "Action": "UPSERT",
#           "ResourceRecordSet":{
#                "Name": "a.example.com",
#                "Type": "A",
#                "TTL": 300,
#           "ResourceRecords": [{"Value":"4.4.4.4"}]
# }}]
# }
# Once you have a JSON file with the correct information like above you will be able to enter the command

# aws route53 change-resource-record-sets --hosted-zone-id (zone-id) --change-batch file://exampleabove.json


# Delete a record set
