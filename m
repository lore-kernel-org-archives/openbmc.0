Return-Path: <clg@kaod.org>
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sr1Gw179SzDrPL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 18:24:08 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D964812D0E
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 09:24:03 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id A23842A0069;
 Fri,  7 Oct 2016 09:24:02 +0200 (CEST)
Subject: Re: [PATCH u-boot 00/12] config cleanups and small fixes
To: openbmc@lists.ozlabs.org
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
Date: Fri, 7 Oct 2016 09:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5589811563159325651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 07 Oct 2016 07:24:08 -0000

On 10/06/2016 11:26 PM, Cédric Le Goater wrote:
> Hello,
> 
> Here is a set of cleanups on the configuration. It should ease the
> port on v2016.11 which is a little more strict on CONFIG_ defines.

You will need this patch to start with :

	https://github.com/legoater/u-boot/commit/d76a5e74286cd903c4eb96c3b5f762672121b02a

forgot to send it :/

Thanks,

C.

> I also included a couple of fixes on the timer and ramdisk relocation.
> 
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (12):
>   aspeed: add CONFIG_AST_SPI_NOR
>   aspeed: rework top level configuration of the Aspeed SoC
>   aspeed: use CONFIG_TARGET_AST_G{4,5}
>   aspeed: remove CONFIG_SYS_INIT_RAM_END
>   aspeed: replace CONFIG_ASPEED_TIMER_CLK with CONFIG_TIMER_CLK_FREQ
>   aspeed: timer cleanups
>   aspeed: add configuration for the network devices
>   aspeed: remove CONFIG_MAC_NUM
>   aspeed: add CONFIG_DRAM_ECC
>   aspeed: remove CONFIG_PHY_MAX_ADDR
>   bootm: fix ramdisk relocation
>   aspeed: remove hack loading ramdisk in memory
> 
>  arch/arm/Kconfig                             | 14 +++----
>  arch/arm/include/asm/arch-aspeed/aspeed.h    | 29 --------------
>  arch/arm/include/asm/arch-aspeed/ast-ahbc.h  |  2 +-
>  arch/arm/include/asm/arch-aspeed/platform.h  | 10 +----
>  arch/arm/include/asm/arch-aspeed/regs-ahbc.h |  4 +-
>  arch/arm/include/asm/arch-aspeed/regs-scu.h  | 56 ++++++++++++++--------------
>  arch/arm/mach-aspeed/Kconfig                 | 50 +++++++++++++++++++++++++
>  arch/arm/mach-aspeed/Makefile                |  4 +-
>  arch/arm/mach-aspeed/ast-ahbc.c              |  5 +--
>  arch/arm/mach-aspeed/ast-scu.c               | 19 ++++++----
>  arch/arm/mach-aspeed/cpuinfo.c               |  5 +--
>  arch/arm/mach-aspeed/flash.c                 | 21 +----------
>  arch/arm/mach-aspeed/timer.c                 | 27 ++++++++++----
>  board/aspeed/Kconfig                         | 16 --------
>  board/aspeed/ast-g4/Kconfig                  |  6 ---
>  board/aspeed/ast-g4/ast-g4.c                 |  1 -
>  board/aspeed/ast-g5/Kconfig                  | 15 +++++---
>  cmd/bootm.c                                  |  3 ++
>  common/image.c                               | 11 ------
>  configs/ast_g4_ncsi_defconfig                |  3 ++
>  configs/ast_g4_phy_defconfig                 |  4 ++
>  configs/ast_g5_ncsi_defconfig                |  3 ++
>  configs/ast_g5_phy_defconfig                 |  4 ++
>  drivers/net/Kconfig                          | 19 +++++++++-
>  drivers/net/ftgmac100.c                      | 15 ++++----
>  include/configs/ast-common.h                 | 15 +++-----
>  include/configs/ast-g4-ncsi.h                |  6 +--
>  include/configs/ast-g4-phy.h                 |  9 ++---
>  include/configs/ast-g5-ncsi.h                |  9 ++---
>  include/configs/ast-g5-phy.h                 | 11 ++----
>  30 files changed, 194 insertions(+), 202 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-aspeed/aspeed.h
>  create mode 100644 arch/arm/mach-aspeed/Kconfig
>  delete mode 100644 board/aspeed/Kconfig
> 
