Return-Path: <clg@kaod.org>
Received: from 6.mo5.mail-out.ovh.net (6.mo5.mail-out.ovh.net [178.32.119.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDzmW2Z0SzDvWV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 21:28:59 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1D35D44859
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 10:13:24 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id BD811600076;
 Thu, 10 Nov 2016 10:13:21 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 0/8] BT driver sync up
To: openbmc@lists.ozlabs.org
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <40804db4-242b-8e46-d435-ebae8a55ad7a@kaod.org>
Date: Thu, 10 Nov 2016 10:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477465067-19034-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4193977156983622611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 10 Nov 2016 10:28:59 -0000

Joel,

On 10/26/2016 08:57 AM, Cédric Le Goater wrote:
> Hello,
> 
> Here is a serie syncing the OpenBMC kernel with the BT driver merged
> in mainline linux. This kernel needs an updated version of btbridged :
> 
>      https://github.com/legoater/btbridge/commits/master
> 
> The last two patches add a request expiry list and some configuration
> through sysfs. These are for review only as they need to be sent to
> mainline first.

So please drop these two patches. This is too early.

I will send later an interesting fix from Corey which handles 
concurrent reads and writes a little better than we do today. 
But after this is all merged.

Thanks,
 
C.


> 
> Cédric Le Goater (8):
>   Revert "misc: Add Aspeed BT IPMI host driver"
>   ARM: aspeed: remove previous definitions in default config
>   ARM: dts: aspeed: remove previous iBT definitions
>   ipmi: add an Aspeed BT IPMI BMC driver
>   ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>   ARM: dts: aspeed: Enable BT IPMI BMC device
>   ipmi: maintain a request expiry list
>   ipmi: add a sysfs file for configure maximum response time
> 
>  .../bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt   |  23 +
>  arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
>  arch/arm/configs/aspeed_g4_defconfig               |   2 +-
>  arch/arm/configs/aspeed_g5_defconfig               |   2 +-
>  drivers/Makefile                                   |   2 +-
>  drivers/char/ipmi/Kconfig                          |   8 +
>  drivers/char/ipmi/Makefile                         |   1 +
>  drivers/char/ipmi/bt-bmc.c                         | 668 +++++++++++++++++++++
>  drivers/misc/Kconfig                               |   5 -
>  drivers/misc/Makefile                              |   1 -
>  drivers/misc/bt-host.c                             | 427 -------------
>  include/uapi/linux/Kbuild                          |   2 +-
>  include/uapi/linux/{bt-host.h => bt-bmc.h}         |  12 +-
>  14 files changed, 712 insertions(+), 445 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/char/ipmi/aspeed,ast2400-bt-bmc.txt
>  create mode 100644 drivers/char/ipmi/bt-bmc.c
>  delete mode 100644 drivers/misc/bt-host.c
>  rename include/uapi/linux/{bt-host.h => bt-bmc.h} (55%)
> 
