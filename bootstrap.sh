apt update
apt upgrade -y

apt install ansible ansible-lint aptitude -y

echo "You are ready to run the playbook with:"
echo "ansible-playbook -K playbook.yaml"
