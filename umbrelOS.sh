sudo virt-install     \
    --connect qemu:///system     \
    --virt-type kvm     \
    --name umbrelOS     \
    --memory 2048     \
    --disk size=32,sparse=true     \
    --graphics vnc     \
    --os-variant debian12     \
    --cdrom /path/to/isos/umbrelos-amd64-usb-installer.iso
    
    
