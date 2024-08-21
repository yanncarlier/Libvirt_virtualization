sudo virt-install     \
    --connect qemu:///system     \
    --virt-type kvm     \
    --name ubuntu-22.04.4-live-server-amd64     \
    --memory 2048     \
    --disk size=1000,sparse=true     \
    --graphics vnc     \
    --os-variant ubuntu24.04     \
    --cdrom /home/y/MY_ISOFILES/ubuntu-22.04.4-live-server-amd64.iso
    