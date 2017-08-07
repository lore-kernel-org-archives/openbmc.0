Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xR9wr3P9nzDqp7
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 07:42:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77Le1IM057839
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 17:42:17 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c6snw92xh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 17:42:17 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 15:42:16 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 15:42:14 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v77LgE1d66912458; Mon, 7 Aug 2017 14:42:14 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24FD56E045;
 Mon,  7 Aug 2017 15:42:14 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id F31506E044;
 Mon,  7 Aug 2017 15:42:13 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 07 Aug 2017 16:44:05 -0500
From: anoo <anoo@linux.vnet.ibm.com>
To: Rick Altherr <raltherr@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel.stan@gmail.com>
Subject: Re: u-boot: load a kernel that's in a ubi volume
In-Reply-To: <CAPLgG==3QTFkFpAr=C6HosKmdSbCAY_iPieByGHKNXLEadbJYQ@mail.gmail.com>
References: <2d17aa79d1cd24f26f7dc026bb3fed88@linux.vnet.ibm.com>
 <CACPK8Xcjh7LCDNfsR7s9fJXTHh_cz8O224dHw8grTrhgyiyCbg@mail.gmail.com>
 <fc11d97ef36876f10cc083a776737fbd@linux.vnet.ibm.com>
 <CAPLgG==3QTFkFpAr=C6HosKmdSbCAY_iPieByGHKNXLEadbJYQ@mail.gmail.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 17080721-0004-0000-0000-000012B69B41
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899027; UDB=6.00449952; IPR=6.00679232; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016579; XFM=3.00000015;
 UTC=2017-08-07 21:42:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080721-0005-0000-0000-00008096474B
Message-Id: <c03b2c2d57759c1db145d1e2be9924df@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708070358
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
X-List-Received-Date: Mon, 07 Aug 2017 21:42:20 -0000

Milton got mtdparts working by enabling the macro CONFIG_FLASH_CFI_MTD 
plus the u-boot patch I just sent to the mailing list.
Something to discuss would be where to add the UBI and MTD macros 
(instead of ast-g5-ncsi.h). Perhaps a new header file but maybe not 
generic a generic base one so that it's off by default.

On 2017-08-07 12:39, Rick Altherr wrote:
> I'm surprised you are putting the kernel in a bare UBI volume.  AFAIK,
> U-Boot can load kernels from UBIFS.  Why wouldn't you create a UBIFS
> volume for /boot and put the fitImage in there?

Is there an advantage with UBIFS? Talking with Milton there’s no need 
to access it during runtime, and we’d just have a couple kernels as 
static volumes.

> On Mon, Aug 7, 2017 at 8:34 AM, anoo <anoo@linux.vnet.ibm.com> wrote:
>> On 2017-08-07 02:36, Joel Stanley wrote:
>>> 
>>> On Mon, Aug 7, 2017 at 1:39 PM, anoo <anoo@linux.vnet.ibm.com> wrote:
>>>> 
>>>> Hi Joel,
>>>> 
>>>> Per our discussion, here are the details of what we’re trying to 
>>>> do and
>>>> the
>>>> things I’ve tried.
>>> 
>>> 
>>> Thanks. I spent the afternoon attempting to recreate your results.
>>> 
>>>> 
>>>> Goal: Have u-boot load a kernel that's in a ubi volume.
>>>> 
>>>> 1. Added ubi support to uboot by adding the following macros to
>>>> include/configs/ast-g5-ncsi.h temporarily for testing purposes (a 
>>>> new
>>>> config
>>>> header would probably need to be created for a final 
>>>> implementation):
>>>> 
>>>> | +#define CONFIG_CMD_UBI
>>>> | +#define CONFIG_CMD_UBIFS
>>>> | +#define CONFIG_RBTREE
>>>> | +#define CONFIG_MTD_DEVICE
>>>> | +#define CONFIG_MTD_PARTITIONS
>>>> | +#define CONFIG_CMD_MTDPARTS
>>>> | +#define CONFIG_LZO
>>> 
>>> 
>>> I replicated this. I noted that this increases the size of the u-boot
>>> image a lot:
>>> 
>>> Old size: 232632
>>> New size: 358320
>>> 
>>> This is an extra 122kB, or a 54% increase in the u-boot size.
>>> 
>>> It does still fit in the partition we have, which is 384 KB.
>> 
>> 
>> Definitely something to keep in mind.
>> 
>>> 
>>>> 
>>>> 2. Built a romulus image with the above u-boot change plus commit
>>>> https://gerrit.openbmc-project.xyz/#/c/5812/ which is the top-most 
>>>> commit
>>>> for a set of changes to remove the initramfs and create a flash 
>>>> image
>>>> that
>>>> builds the kernel and rootsfs into ubi volumes.
>>> 
>>> 
>>> Why Romulus? Isn't this work being done for Witherspoon?
>> 
>> 
>> Yeah, this is being done for witherspoon. I've tested with witherspoon 
>> as
>> well but also Romulus in case there were device tree changes that 
>> needed to
>> be done that's a smaller system.
>> 
>>>> 3. Used the generated obmc-phosphor-image-romulus.ubi.mtd to boot 
>>>> qemu.
>>> 
>>> 
>>> What was the Qemu command line you used?
>> 
>> 
>> After cloning the openbmc/qemu repo and building (using as reference
>> https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu):
>> 
>> ./build/arm-softmmu/qemu-system-arm -m 256 -M romulus-bmc -nographic 
>> -drive
>> file=/<path_to>/obmc-phosphor-image-romulus.ubi.mtd,format=raw,if=mtd 
>> -net
>> nic -net
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=:127.0.0.1:2300-:3000,hostname=qemu
>> 
>> For witherspoon, I use the same command, just pointing to a withespoon
>> image.
>> 
>>> 
>>> Can you share a mkfs.ubifs command line that I can use to create a 
>>> ubi
>>> image?
>> 
>> 
>> You can create a config test file (named ubi.cfg in this example) in a
>> directory where you have the kernel fit image fitImage-<system>.bin, 
>> ex:
>> 
>> $ cat ubi.cfg
>> [kernel0]
>> mode=ubi
>> image=fitImage-<system>.bin
>> vol_type=static
>> vol_name=kernel0
>> vol_id=0
>> 
>> Then use ubinize command:
>> $ ubinize -p 64 -m 1 -o <outputfilename> ubi.cfg
>> 
>> The ubinize command is being added to the openbmc build with this 
>> commit:
>> https://gerrit.openbmc-project.xyz/#/c/5801/3/meta-phosphor/classes/image_types_phosphor.bbclass
>> 
>> The rwfs is built with:
>> "UBIFS_RWFS_CMD = "mkfs.ubifs -r ubifs -c ${FLASH_UBI_RWFS_LEBS} -m
>> ${FLASH_PAGE_SIZE} -e ${FLASH_LEB_SIZE}KiB rwfs.ubifs"
>> 
>> Then the ubi image is built with:
>> "ubinize -p ${FLASH_PEB_SIZE}KiB -m ${FLASH_PAGE_SIZE} -o ubi-img 
>> $cfg"
>> 
>>> 
>>> When I tried to boot the image I downloaded from the gerrit job, none
>>> of the uboot commands you listed worked:
>> 
>> 
>> An image needs to built with the u-boot changes that enable ubi, since 
>> that
>> is not in gerrit. You'd need to build an openbmc image with the u-boot
>> recipe pointing to a local u-boot repo that has the ubi macros 
>> enabled.
>> 
>> I'll pass you in a separate msg the image I have built.
>> 
>> 
>>> 
>>> U-Boot 2016.07 (Jul 27 2017 - 21:13:25 +0000)
>>> 
>>>        Watchdog enabled
>>> DRAM:  496 MiB
>>> Flash: 32 MiB
>>> *** Warning - bad CRC, using default environment
>>> 
>>> In:    serial
>>> Out:   serial
>>> Err:   serial
>>> Net:   aspeednic#0
>>> Error: aspeednic#0 address not set.
>>> 
>>> Hit any key to stop autoboot:  0
>>> libfdt fdt_check_header(): FDT_ERR_BADMAGIC
>>> Wrong Image Format for bootm command
>>> ERROR: can't get kernel image!
>>> ast# mtdparts
>>> Unknown command 'mtdparts' - try 'help'
>>> ast# ubi part kernel0
>>> Unknown command 'ubi' - try 'help'
>>> 
>>> 
>>>> 
>>>> 4. To be able to use ubi in u-boot, the mtdparts and mtdids 
>>>> variables
>>>> need
>>>> to be set (reference:
>>>> https://fossies.org/linux/qemu/roms/u-boot/doc/README.ubi).
>>>> 
>>>> Here is where I’ve been unable to get u-boot to recognize the 
>>>> existing
>>>> mtd.
>>>> I’ve tried multiple combinations for mtdids, such as nor0=bmc,
>>>> nor0=<addr>.flash, etc etc. But when running “mtdparts” command 
>>>> from
>>>> u-boot,
>>>> or a ubi command, always get "Device nor0 not found!”. Ex:
>>>> 
>>>> ast# mtdparts
>>>> Device nor0 not found!
>>>> 
>>>> ast# ubi part kernel0
>>>> Device nor0 not found!
>>>> Error initializing mtdparts!
>>>> 
>>>> I’ve also taken a stab at adding the romulus device tree to u-boot 
>>>> to see
>>>> if
>>>> that may be the reason, by copying from the kernel and adding to 
>>>> u-boot
>>>> the
>>>> files arch/arm/dts/aspeed-g5.dtsi, aspeed-bmc-opp-flash-layout.dtsi,
>>>> aspeed-bmc-opp-romulus.dts, and adding the dts to the Makefile. Also
>>>> added a
>>>> CONFIG_DEFAULT_DEVICE_TREE macro. This might not be the correct or
>>>> complete
>>>> way to add the device tree to the openbmc version of u-boot.
>>> 
>>> 
>>> Can you explain what you were trying to do there?
>> 
>> 
>> I was trying to add the system device tree to u-boot. The device trees 
>> for
>> the openbmc systems are defined in the kernel, but they may be 
>> required to
>> be defined in u-boot for u-boot to find the mtd partitions.
>> 
>>> 
>>> Cheers,
>>> 
>>> Joel
>> 
>> 
