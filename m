Return-Path: <clg@kaod.org>
Received: from mo1.mail-out.ovh.net (mo1.mail-out.ovh.net [178.32.228.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYj8m35CMzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 19:28:56 +1000 (AEST)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 6E7F6FF9639
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 10:11:24 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 137243C009D;
 Tue, 21 Jun 2016 10:11:20 +0200 (CEST)
Subject: Re: [u-boot 0/3] Add minimal ast2400 support
To: Joel Stanley <joel@jms.id.au>, teddy.reed@gmail.com, andrew@aj.id.au
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <47db0c5d-907c-4622-0659-2cef581a467c@kaod.org>
Date: Tue, 21 Jun 2016 10:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466494185-24459-1-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17774581829845682946
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrleeigddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 21 Jun 2016 09:28:57 -0000

On 06/21/2016 09:29 AM, Joel Stanley wrote:
> Hello OpenBMC u-boot hackers!
> 
> This series adds minimal ast2400 support to the v2016.05 tag of u-boot. It
> applies on top of the v2016.05-ast2500 tree that Cedric created for the
> ast2500-evb.
> 
> It is a copy of the code from the Aspeed SDK with minimal changes to get it to
> compile in a modern u-boot tree.
> 
> Pending review, I will add this to a branch called v2016.05-aspeed-openbmc in
> the openbmc u-boot repository and point all of our 2400 and 2500 systems at
> this branch.

Looks good to me. 

> Joel Stanley (3):
>   ast-g5: Simplify config and board file

The configuration system has changed and a lot more can be configured 
through Kconfig now. I think the aspeed code relies a bit too much on 
#define still. 

>   ARM: AST2400: add support
>   arm: aspeed: Remove cpu directory

We could to the same for G5.

G5 also has this hunk which needs investigation :

--- a/arch/arm/cpu/arm1176/start.S
+++ b/arch/arm/cpu/arm1176/start.S
@@ -35,7 +35,6 @@
  */
 
        .globl reset
-
 reset:
        /*
         * set the cpu to SVC32 mode
@@ -82,8 +81,9 @@ cpu_init_crit:
        orr     r0, r0, #0x00001000     @ set bit 12 (I) I-Cache
 
        /* Prepare to disable the MMU */
-       adr     r2, mmu_disable_phys
-       sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BASE)
+       /* Ryan TODO ....*/
+#      adr     r2, mmu_disable_phys
+#      sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BASE)
        b       mmu_disable
 
        .align 5
@@ -92,7 +92,7 @@ mmu_disable:
        mcr     p15, 0, r0, c1, c0, 0
        nop
        nop
-       mov     pc, r2
+#      mov     pc, r2
 mmu_disable_phys:
 
 #endif

Thanks

C.





> 
>  arch/arm/Kconfig                                   |    4 +
>  .../arm/include/asm/arch-aspeed/ast2400_platform.h |   84 +
>  board/aspeed/ast-g4/Kconfig                        |   21 +
>  board/aspeed/ast-g4/Makefile                       |    1 +
>  board/aspeed/ast-g4/ast-g4.c                       |  113 +
>  board/aspeed/ast-g4/platform.S                     | 3092 ++++++++++++++++++++
>  board/aspeed/ast-g5/ast-g5.c                       |    1 -
>  configs/ast_g4_defconfig                           |    9 +
>  include/configs/ast-g4.h                           |  187 ++
>  include/configs/ast-g5.h                           |   85 +-
>  10 files changed, 3522 insertions(+), 75 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/ast2400_platform.h
>  create mode 100644 board/aspeed/ast-g4/Kconfig
>  create mode 100644 board/aspeed/ast-g4/Makefile
>  create mode 100644 board/aspeed/ast-g4/ast-g4.c
>  create mode 100644 board/aspeed/ast-g4/platform.S
>  create mode 100644 configs/ast_g4_defconfig
>  create mode 100644 include/configs/ast-g4.h
> 
