Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQjs44rMCzDql1
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 13:37:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v773Y1wk089769
 for <openbmc@lists.ozlabs.org>; Sun, 6 Aug 2017 23:37:25 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c5xrg4aqq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 06 Aug 2017 23:37:25 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Sun, 6 Aug 2017 23:37:24 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 6 Aug 2017 23:37:21 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v773bKfk23527520; Mon, 7 Aug 2017 03:37:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0664124044;
 Sun,  6 Aug 2017 23:34:44 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 5F57E124047;
 Sun,  6 Aug 2017 23:34:44 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 06 Aug 2017 22:39:09 -0500
From: anoo <anoo@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: u-boot: load a kernel that's in a ubi volume
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 17080703-2213-0000-0000-00000205ABAC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007498; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00898666; UDB=6.00449735; IPR=6.00678871; 
 BA=6.00005512; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016565; XFM=3.00000015;
 UTC=2017-08-07 03:37:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080703-2214-0000-0000-000057229623
Message-Id: <2d17aa79d1cd24f26f7dc026bb3fed88@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070061
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Aug 2017 03:37:29 -0000

Hi Joel,

Per our discussion, here are the details of what we’re trying to do 
and the things I’ve tried.

Goal: Have u-boot load a kernel that's in a ubi volume.

1. Added ubi support to uboot by adding the following macros to 
include/configs/ast-g5-ncsi.h temporarily for testing purposes (a new 
config header would probably need to be created for a final 
implementation):

| +#define CONFIG_CMD_UBI
| +#define CONFIG_CMD_UBIFS
| +#define CONFIG_RBTREE
| +#define CONFIG_MTD_DEVICE
| +#define CONFIG_MTD_PARTITIONS
| +#define CONFIG_CMD_MTDPARTS
| +#define CONFIG_LZO

2. Built a romulus image with the above u-boot change plus commit 
https://gerrit.openbmc-project.xyz/#/c/5812/ which is the top-most 
commit for a set of changes to remove the initramfs and create a flash 
image that builds the kernel and rootsfs into ubi volumes.

3. Used the generated obmc-phosphor-image-romulus.ubi.mtd to boot qemu.

4. To be able to use ubi in u-boot, the mtdparts and mtdids variables 
need to be set (reference: 
https://fossies.org/linux/qemu/roms/u-boot/doc/README.ubi).

Here is where I’ve been unable to get u-boot to recognize the existing 
mtd. I’ve tried multiple combinations for mtdids, such as nor0=bmc, 
nor0=<addr>.flash, etc etc. But when running “mtdparts” command from 
u-boot, or a ubi command, always get "Device nor0 not found!”. Ex:

ast# mtdparts
Device nor0 not found!

ast# ubi part kernel0
Device nor0 not found!
Error initializing mtdparts!

I’ve also taken a stab at adding the romulus device tree to u-boot to 
see if that may be the reason, by copying from the kernel and adding to 
u-boot the files arch/arm/dts/aspeed-g5.dtsi, 
aspeed-bmc-opp-flash-layout.dtsi, aspeed-bmc-opp-romulus.dts, and adding 
the dts to the Makefile. Also added a CONFIG_DEFAULT_DEVICE_TREE macro. 
This might not be the correct or complete way to add the device tree to 
the openbmc version of u-boot.


Let me know if you need additional details and thanks in advance for 
your insight.
