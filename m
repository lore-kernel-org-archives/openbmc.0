Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.5; helo=cpsmtpb-ews02.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="WLrchbYw"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews02.kpnxchange.com (cpsmtpb-ews02.kpnxchange.com
 [213.75.39.5])
 by lists.ozlabs.org (Postfix) with ESMTP id 44QBCW58jxzDqSY
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 02:53:25 +1100 (AEDT)
Received: from cpsps-ews26.kpnxchange.com ([10.94.84.192]) by
 cpsmtpb-ews02.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 21 Mar 2019 16:53:19 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=IZVWplia c=1 sm=1 tr=0 cx=a_idp_e
 a=qDt3RXe/W/RMJVjRtURR+Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10
 a=NTGMnVQrEZIA:10 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=EhcD180WAAAA:20
 a=uoIxLzx0AAAA:20 a=WEaZBa3fPe1FPyTFQJsA:9 a=mFL4UGny2b1gzOZj:21
 a=4_UxgdlKDtCnssSE:21 a=CjuIK1q_8ugA:10 a=tQDfTFm-_g4A:10
 a=hKc7EnmM1UwA:10 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT106.kpnxchange.com ([195.121.3.22]) by
 cpsps-ews26.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 21 Mar 2019 16:53:19 +0100
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1553183599;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=ngfnNnNkbzRHZpAD2GWJVD6gO3m0/YP201bWh704Mmc=;
 b=WLrchbYwOAocO4S+nlziBi6TJFsvooO9m3RW9D60SsQGGA20PnNS+4Y3cVEx8VC11INAhT97V9U
 okd3ButEe+2c+R3JeuW6U+Xf5HKbbF9hoU2V4lMh3JdERR1YYgwZvlqa8lq8l7Tkw37f9jeFFw+Zg
 vVjA21yts1QMwvoMYLk=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT106.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Thu, 21 Mar 2019 16:53:19 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 21 Mar
 2019 16:52:40 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 21 Mar 2019 16:52:21 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Intel-BMC on github
Thread-Topic: Intel-BMC on github
Thread-Index: AdTf/IltDAWI0MW3SQaS17IFStXdww==
Date: Thu, 21 Mar 2019 15:52:21 +0000
Message-ID: <fcb1a7d84270488fa573ec25efe76443@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Mar 2019 15:53:19.0374 (UTC)
 FILETIME=[345C52E0:01D4DFFE]
X-RcptDomain: lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 15:53:30 -0000

Hello James,

Good to see the Intel BMC code is on github so we can give it a try and use=
 it.

In the mean time we downloaded and built the image without problem.

The issue is that we don't have a Wolfpass board. In order to get around th=
is I create a woldpass-bmc devices in the OpenBMC qemu.

As far as I now the major difference is in the flash size(I added a 64 MB p=
art), I also updated the strapping according to the schematic.

I can use this device in Qemu and it starts the image I built for the s2600=
wf (if I catenate two of them to achieve the 64MB).

The issue is that if I try the wolfpass image u-boot is starting,  it also =
reports the kernel is loaded etc but it freezes after is passes control to =
the kernel.

I included the qemu logging below:

U-Boot 2016.07 (Mar 21 2019 - 14:30:46 +0000)

SOC : AST2500-A1
RST : 0x01
PLL :     25 MHz
CPU :    825 MHz
MEM :	2.333 MHz, EEC: Disable, Cache: Disable=20
VGA :    16 MiB
DRAM :   init by SOC
       Watchdog enabled
DRAM:  112 MiB
Flash: 64 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   MAC0 : RMII/NCSI
MAC1 : RGMII
FTGMAC100#0
Error: FTGMAC100#0 address not set.
, FTGMAC100#1
Error: FTGMAC100#1 address not set.

Hit any key to stop autoboot:  0=20
## Loading kernel from FIT Image at 20080000 ...
   Using 'conf@aspeed-bmc-intel-purley.dtb' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x20080110
     Data Size:    2670096 Bytes =3D 2.5 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80001000
     Entry Point:  0x80001000
   Verifying Hash Integrity ... OK
## Loading ramdisk from FIT Image at 20080000 ...
   Using 'conf@aspeed-bmc-intel-purley.dtb' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  uncompressed
     Data Start:   0x2031897c
     Data Size:    21827584 Bytes =3D 20.8 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
## Loading fdt from FIT Image at 20080000 ...
   Using 'conf@aspeed-bmc-intel-purley.dtb' configuration
   Trying 'fdt@aspeed-bmc-intel-purley.dtb' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x2030bfe8
     Data Size:    51480 Bytes =3D 50.3 KiB
     Architecture: ARM
   Verifying Hash Integrity ... OK
   Booting using the fdt blob at 0x2030bfe8
   Loading Kernel Image ... OK
   Loading Ramdisk to 856c0000, end 86b91000 ... OK
   Loading Device Tree to 856b0000, end 856bf917 ... OK
## Transferring control to Linux (at address 80001000)...

Starting kernel ...

## youhou 2...
## Transferring control to Linux (at address 80001000)...






Message: 4
Date: Tue, 19 Mar 2019 19:34:02 +0000
From: "Mihm, James" <james.mihm@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Intel-BMC on github
Message-ID:
	<C599FC839619124CAC44E062ABB7DFE2D7A61D0F@ORSMSX115.amr.corp.intel.com>
=09
Content-Type: text/plain; charset=3D"us-ascii"

Intel announces that its internal repository based on the OpenBMC project i=
s being made public on github under the organization name of Intel-BMC.

Intel is sharing the latest internal repositories in response to requests f=
rom partners and customers to be able to build an OpenBMC firmware image th=
at will run on an existing Intel server platform. The repositories include =
content that has not yet been upstreamed to the LF OpenBMC project.

Currently the only supported platform is the Wolf Pass platform (S2600WF). =
Support for more platforms will be added in the future.

The Intel-BMC can be found at https://github.com/Intel-BMC<https://github.c=
om/Intel-BMC/openbmc>.
For further information, please refer to the readme file (https://github.co=
m/Intel-BMC/openbmc/blob/intel/README.md).

James Mihm
Intel DCG BMC Core Firmware
(503) 264-5129
