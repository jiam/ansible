#!/usr/bin/python
# coding=utf-8
import sys
import os
def HW():
    hw = os.popen('/usr/sbin/dmidecode -t system | grep Product').readlines()
    return hw

def raid_type():
    r1=os.popen("/sbin/lspci | awk -F: '/storage/{print $3}'").readlines()
    if len(r1) != 0:
        type=r1[0].strip()
        return type
    r2=os.popen("/opt/MegaRAID/MegaCli/MegaCli64 -cfgdsply –aALL | awk -F: '/Product/{print $2}'").readlines()
    if len(r2) != 0:
        type=r2[0].strip()
        return type
def ldisk_type():
    types = []
    r1=os.popen("/opt/MegaRAID/MegaCli/MegaCli64 -LDInfo -LALL –aAll | awk '/RAID Level/{print}'").readlines()
    if len(r1) != 0:
        for  i  in range(len(r1)):
            if r1[i] =="RAID Level          : Primary-1, Secondary-0, RAID Level Qualifier-0\n":
                type='RAID1'
                types.append(type)
            elif r1[i] =="RAID Level          : Primary-0, Secondary-0, RAID Level Qualifier-0\n":
                type='RAID0'
                types.append(type)
            elif r1[i] =="RAID Level          : Primary-5, Secondary-0, RAID Level Qualifier-3\n":
                type="RAID5"
                types.append(type)
            elif r1[i] =="RAID Level          : Primary-1, Secondary-3, RAID Level Qualifier-0\n":
                type="RAID10"
                types.append(type)
        return types
    r2=os.popen("/opt/zenoss_scripts/lsiutil.x86_64 -p1 -a21,1,0,0 | awk  -F, '/IM/{print $2}'").readlines()
    if len(r2) != 0:
        print "lsi"
        for j  in range(len(r2)):
            if "Type IM (Integrated Mirroring)" in r2[j]:
                type='RAID1'
                types.append(type)
        return types
    return types
def ldisk_size():
    sizes = []
    r1 = os.popen("/opt/MegaRAID/MegaCli/MegaCli64  -PDList -aAll  | awk '/Raw/{if($4==\"TB\"){print $3*1024*1024}else{print $3*1024}}'").readlines()
    if len(r1) != 0:
        return r1
    r2 = os.popen("/opt/zenoss_scripts/lsiutil.x86_64 -p1 -a21,1,0,0 | awk '/Volume Size/{print $3}'").readlines()
    if len(r2) !=0:
        return r2
    return sizes
def disk_model():
    r1 = os.popen("/opt/MegaRAID/MegaCli/MegaCli64  -PDList -aAll  | awk '/PD/{print $3}'").readlines()
    if len(r1) != 0:
        return r1
    r2 = os.popen("/opt/zenoss_scripts/lsiutil.x86_64 -p1 -a21,2,0,0 | awk   '/PhysDisk Size/{print $9}'").readlines()
    if len(r2) != 0:
        return r2
    r3 = os.popen("cat /proc/scsi/scsi | grep ATA | grep -v CD  | grep -v Logical | awk -F: '{print $3}'").readlines()
    if len(r3) != 0:
        return r3

def disk_size():
    r1 = os.popen("/opt/zenoss_scripts/lsiutil.x86_64 -p1 -a21,2,0,0 | awk '/PhysDisk Size/{print $3}'").readlines()
    if len(r1) != 0:
        return r1
    r2 = os.popen("/opt/MegaRAID/MegaCli/MegaCli64  -PDList -aAll  | awk '/Raw/{if($4==\"TB\"){print $3*1024*1024}else{print $3*1024}}'").readlines()
    if len(r2) != 0:
        return r2
    r3 = os.popen("/sbin/fdisk -l 2>/dev/null | egrep  -v '(identifier|mapper)' |awk '/Disk/{print $5/1024/1024}'").readlines()
    if len(r3) != 0:
        return r3

def disk_sn():
    sns=[]
    if len(disk_model()) != 0:
        r1 = os.popen("/opt/MegaRAID/MegaCli/MegaCli64  -PDList -aAll  | awk  '/Inquiry Data/{print $3}'").readlines()
        if len(r1) != 0:
            return r1
    
    return []


if __name__ == '__main__':
    if sys.argv[1] == 'disk_model':
        for i in disk_model():
            print i.strip()
    elif sys.argv[1] == 'disk_size':
        for i in disk_size():
            print int(float(i.strip()))
    elif sys.argv[1] == 'disk_sn':
        for i in disk_sn():
            print i.strip()
    elif sys.argv[1] == 'raid_type':
        print raid_type() 
    elif sys.argv[1] == 'ldisk_type':
        if len(ldisk_type()) != 0:
            for i in  ldisk_type():
                print i
    elif sys.argv[1] == 'ldisk_size':
        if len(ldisk_size()) !=0:
            for i in ldisk_size():
                print int(float(i.strip()))
