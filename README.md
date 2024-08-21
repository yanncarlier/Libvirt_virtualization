sudo apt install qemu-kvm libvirt-daemon-system  
sudo adduser $USER libvirt  

usermod --append --groups libvirt `whoami`
sudo chown libvirt-qemu:libvirt -R /var/lib/libvirt/

sudo usermod -a -G libvirt-qemu y
cat /etc/group
sudo usermod -a -G libvirt-dnsmasq y


virsh list  
sudo systemctl start libvirtd  
sudo systemctl enable libvirtd  

kvm-ok

virsh pool-define /dev/stdin <<EOF
<pool type='dir'>
  <name>default</name>
  <target>
    <path>/var/lib/libvirt/images</path>
  </target>
</pool>
EOF

virsh pool-start default
virsh pool-autostart default



sudo virt-install     \
    --connect qemu:///system     \
    --virt-type kvm     \
    --name ubuntu-22.04.4-desktop-amd64     \
    --memory 2048     \
    --disk size=1000,sparse=true     \
    --graphics vnc     \
    --os-variant ubuntu24.04     \
    --cdrom ubuntu-22.04.4-desktop-amd64.iso


    # to try:
    #  preallocation=<str>    - Preallocation mode (allowed values: off, metadata, falloc, full)


sudo virt-manager


sudo qemu-img convert -f qcow2 -O qcow2 -o preallocation=off ubuntu-22.04.4-desktop-amd64.qcow2 ubuntu-22.04.4-desktop-amd64.qcow2.new  





references:  

https://www.server-world.info/en/note?os=Ubuntu_20.04&p=kvm&f=2  

https://manpages.ubuntu.com/manpages/xenial/en/man1/virt-install.1.html  

https://linux.die.net/man/1/virt-install  

https://cloud-images.ubuntu.com/jammy/current/  

