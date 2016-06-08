Return-Path: <clg@kaod.org>
X-Greylist: delayed 2100 seconds by postgrey-1.35 at bilbo;
 Wed, 08 Jun 2016 22:33:50 AEST
Received: from 4.mo178.mail-out.ovh.net (4.mo178.mail-out.ovh.net
 [46.105.49.171])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPnt659R5zDqHw
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 22:33:50 +1000 (AEST)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9D8511008C96
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 14:16:05 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 5EC8E520077;
 Wed,  8 Jun 2016 14:16:04 +0200 (CEST)
Subject: Re: AST2500 support questions
To: Shay Slobodkin <shays@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57580C83.9060205@kaod.org>
Date: Wed, 8 Jun 2016 14:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 902127303883721474
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeefgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 08 Jun 2016 12:33:51 -0000

On 06/07/2016 08:43 PM, Shay Slobodkin wrote:
> Hi,
> 
>  
> 
> Following the latest great news of adding support for AST2500 into main code, we boost up our work to align with yours.
> 
> Several questions regarding our current status, appreciate the assistance hopefully it will be merged into openbmc code as well soon.
> 
>  
> 
> 1. We were trying to fetch latest code from origin, hoping AST2500 will be inside already.
> 
> After fetch, we couldn’t find the new AST2500 addition under:
> 
> meta-openbmc-bsp/meta-aspeed/ or meta-openbmc-machines/
> 
> Is it held somewhere else, on a different git branch?
> 
>  
> 
>  
> 
> 2. We have loaded ast2500-evb with aspped-ast2500-evb.dtb file on aspeed evb, but we faced some problems with DTB.
> 
> We tried kernels 4.6 and 4.7 from:
> 
> <https://github.com/shenki/linux/tree/dev-4.7>
> 
> <https://github.com/openbmc/linux/tree/dev-4.6>

I have added these for the ramfs :

	CONFIG_KERNEL_LZMA=y
	CONFIG_RD_LZMA=y
	CONFIG_SHMEM=y
	CONFIG_TMPFS=y
	CONFIG_DECOMPRESS_LZMA=y

and create the uImage as specified here : 

	https://github.com/openbmc/docs/blob/master/kernel-development.md

do the same with the ramfs. 


> We tried to boot it with uImage and separate DTB image using the command ‘bootm <KERNEL_ADDR> - <DTB_ADDR>’
> 
> but the kernel seems to halt during boot, the only messages we got were:
> 
>  
> 
> ## Booting kernel from Legacy Image at 83000000 ...
> 
>    Image Name:   Linux-4.7.0-rc1-12701-gca25849-d
> 
>    Image Type:   ARM Linux Kernel Image (uncompressed)
> 
>    Data Size:    2102392 Bytes = 2 MiB
> 
>    Load Address: 80800000
> 
>    Entry Point:  80800000
> 
>    Verifying Checksum ... OK
> 
> ## Flattened Device Tree blob at 82000000
> 
>    Booting using the fdt blob at 0x82000000
> 
>    Loading Kernel Image ... OK
> 
> OK
> 
>    Loading Device Tree to 9eb7b000, end 9eb7f971 ... OK
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> 
>  
> 
> We added CONFIG_OF_LIBFDT to ast-g5.h and it allow us to get to boot with a separate DTB file (aspeed-ast2500-evb.dtb) as seen above.
> 
>  
> 
> We also tried to boot zImage, we failed with the following message (for that we added CONFIG_CMD_BOOTZ to u-boot config):
> 
>  
> 
> ast# bootz 0x83000000
> 
>  
> 
> Our initial try, we received this output:
> 
>  
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> 
> no ATAGS support: can't continue
> 
>  
> 
> Then we added CONFFIG_ATAGS to kernel config and failed with the below:
> 
>  
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> 
> Error: unrecognized/unsupported machine ID (r1 = 0x000022b8).
> 
> Available machine support:
> 
> ID (hex)        NAME
> 
> ffffffff        Generic DT based system
> 
> ffffffff        ASpeed SoC
> 
>  
> 
>  
> 
> Which u-boot command do you suggest for booting with DTB file?
> 
> How did you guys managed to boot?
> 
>  
> 
> 3. We saw in a latest updates that there is a new u-boot https://github.com/legoater/u-boot/tree/v2016.05-ast2500.
> 
> Is it stable enough for using it?

That is what use. I could not boot a openbmc kernel with the original uboot, 
probably because of how it  configured the HW. I did not investigate yet.

Cheers,

C. 

>  
> 
> Thank you guys for the great support,
> 
> Shay
> 
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
