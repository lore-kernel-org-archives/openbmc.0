Return-Path: <clg@kaod.org>
Received: from e06smtp08.uk.ibm.com (e06smtp08.uk.ibm.com [195.75.94.104])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Y4SKLzDqPP
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:36 +1000 (AEST)
Received: from localhost
 by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:33 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:30 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5C43A2190046
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:20:03 +0100 (BST)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
 [9.149.37.213])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKTob10748384
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:29 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKSpI004984
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:29 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKShL004981; Sun, 29 May 2016 15:20:28 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id B4B92220164;
 Sun, 29 May 2016 23:20:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 00/12] SMC and network support
Date: Sun, 29 May 2016 23:19:53 +0200
Message-Id: <1464556805-4340-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0033-0000-0000-00001AE70E88
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 21:20:38 -0000

Hello,

The following patchset adds to the qemu palmetto-bmc platform initial
support for the AST2400 SMC controllers and for the FTGMAC100 network
adapter. The device models don't implement all the features the HW
proposes but they are complete enough to run OpenBMC on a qemu guest.

To boot one, use the following command line :

  $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
	-mtdblock ./flash-palmetto-20160512040959  \
	-mtdblock ./palmetto.pnor 
	-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu
	
or, if you have a libvirt bridge, you can tie the nic to it :
	
	-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100 \
	-net bridge,id=net0,helper=/usr/lib/qemu/qemu-bridge-helper,br=virbr0 

The first block device uses the file './flash-palmetto-20160512040959'
which will act as a SPI flash module for the BMC, handled by the
SMC/FMC controller. The second block device uses the file
'./palmetto.pnor' which is an OpenPower firmware image for a palmetto
OpenPower system. This one will be handled by the SMC/SPI controller.


Code is based on Andrew's qemu and the full tree can be found here

    https://github.com/legoater/qemu/commits/aspeed

Flash images can be grabbed here :

    https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
    https://openpower.xyz/job/openpower-op-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

Thanks,

Cédric Le Goater (12):
  ast2400: add SMC controllers (FMC and SPI)
  ast2400: add SPI flash slave object
  ast2400: create SPI flash slaves
  m25p80: add a get storage routine
  ast2400: handle SPI flash Command mode (read only)
  ast2400: use contents of first SPI flash as a rom
  m25p80: add RDCR instruction for Macronix chip
  m25p80: add mx25l25635f chip
  ast2400: use a mx25l25635f chip
  ast2400: add a BT device
  net: add FTGMAC100 support
  ast2400: add a FTGMAC100 nic

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/ast2400.c                |  68 ++++
 hw/arm/palmetto-bmc.c           |  12 +
 hw/block/m25p80.c               |  21 +
 hw/misc/Makefile.objs           |   2 +-
 hw/misc/aspeed_bt.c             | 175 ++++++++
 hw/net/Makefile.objs            |   1 +
 hw/net/ftgmac100.c              | 873 ++++++++++++++++++++++++++++++++++++++++
 hw/ssi/Makefile.objs            |   1 +
 hw/ssi/aspeed_smc.c             | 444 ++++++++++++++++++++
 include/hw/arm/ast2400.h        |   7 +
 include/hw/block/flash.h        |   2 +
 include/hw/misc/aspeed_bt.h     |  31 ++
 include/hw/net/ftgmac100.h      |  62 +++
 include/hw/ssi/aspeed_smc.h     |  88 ++++
 15 files changed, 1787 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_bt.c
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 hw/ssi/aspeed_smc.c
 create mode 100644 include/hw/misc/aspeed_bt.h
 create mode 100644 include/hw/net/ftgmac100.h
 create mode 100644 include/hw/ssi/aspeed_smc.h

-- 
2.1.4
