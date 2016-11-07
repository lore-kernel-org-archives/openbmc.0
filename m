Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC0vx1qNKzDvNV
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:13:32 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 76D801729B
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:13:27 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 37DCC3C006E;
 Mon,  7 Nov 2016 06:13:25 +0100 (CET)
Subject: Re: U-Boot upstreaming
To: Maxim Sloyko <maxims@google.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
 <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <447124da-f83c-b4f7-0549-2fc52417582d@kaod.org>
Date: Mon, 7 Nov 2016 06:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 969962773800454914
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleefgddvgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 07 Nov 2016 05:13:33 -0000

On 11/04/2016 06:46 PM, Maxim Sloyko wrote:
> 
> 
> On Fri, Nov 4, 2016 at 8:54 AM, Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>     Hello !
> 
>     On 11/03/2016 09:44 PM, Maxim Sloyko wrote:
>     > Hi Cedric,
>     >
>     > My manager (Rick Alther) mentioned that you were working on some
>     > minimal "upstreamable" commit for Aspeed in U-Boot. How far were
>     > you able to get?
> 
>     Please check :
> 
>       https://github.com/openbmc/u-boot/wiki <https://github.com/openbmc/u-boot/wiki>
> 
>     This is where we track the ugly details and here is my tree :
> 
>        https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc <https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc>
> 
>     Patch one is the "minimum" we have been working on with Joel these
>     last 6 months to :
> 
>      * make it compatible with upstream
>      * extract all exoticisms
>      * extract funky drivers
>      * isolate ugly hacks
> 
>     I think we are at a point where we need to rewrite bits of lowlevel_init
>     or move them later on in the code. This big asm routines does :
> 
>      * LPC patching for ast2300 (we can kill that)
>      * uart init (if SDRAM calibration is done, easy we can keep)
>      * SDRAM calibration (we could use static calibration values instead)
>      * SDRAM size calculation (may be we can move that in a C part)
>      * video clock setting (one reg setting)
>      * JTAG master (one reg setting)
>      * RMII/RGMII clock setting (one reg setting)
>      * GPIO massive reset (not sure if this is useful, should ask Andrew)
>      * SPI Calibration (I have done in C so we can move)
> 
> 
> Yes, I looked at it too and it does not look like any of that has any 
> business being in lowlevel_init, let alone being implemented in asm.

I agree that the biggest part goes to dram_init and the rest can be 
moved in different areas.

> Did you try moving this whole function further down the init sequence? 

I don't think there are any early inits needed in this file.

I have moved all the relevant code to C routines. lowlevel_init 
is now empty, resets, inits are done in C, console is OK. For DRAM 
calibration, which is the hairy part, I tried to use pre-calculated 
values from an another system but the sequence is not good enough 
and so the DRAM controller has issues.

Here is my dev v2016.11-rc3 branch for you to see :

	https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc-sdmc

and the DRAM part :

	https://github.com/legoater/u-boot/commit/b3fb9523e1f37a7057d5b3bee3122ef7a78dafb4

beware, it can brick your system. Mine has died a couple of time 
when accessing RAM. But it is a good base to start rewriting the 
DRAM calibration.

Cheers,

C. 

> board_early_init_f might be a good candidate. It might cause problems 
> because it does not restore registers properly, but should be an easy fix --
> at this point we would already have stack setup for us (need to be configured 
> via CONFIG_SYS_INIT_SP_ADDR to point to the top of SRAM) and even have a
>  basic malloc (need to be configured). This would make calling into C 
> somewhat easier. 
>  
> 
> 
>     > This is also what I was thinking of doing, so we should be able to join forces on this.
>     >
>     > I talked to Simon Glass recently (he's an active contributor to mainline U-Boot)
>     > and basically that's the path that he also recommended -- just getting minimal amount
>     > of code in, that can just boot to a prompt. He also said that DRAM driver would have
>     > to be part of it.
> 
>     yes. See my comments above.
> 
>     > So, the way I see it, there are two big chunks of work here:
>     >  1. Setting up the whole structure. This would include actually adding a board, minimum
>     > amount of supporting code, debug serial console init,
> 
>     yes. that is patch one above, in which we still need to cleanup
>     stuff in the .S part.
> 
>     >  2. DDR3/DDR4 driver. This is the biggest part of what we have in platform.S now. A lot
>     > of work, but relatively straightforward, just rewrite ~1.5k lines of assembly in C.
> 
>     I am not sure this is feasible, AFAIK, you can not call C. I might
>     be wrong.
> 
> 
> You can. I tried it and it works. We just need stack (see above). Even if moving the whole lowlevel_init further down will prove too hard, we can at least call
> 
> mov sp, =TOP_OF_SRAM
> 
> at top of lowlevel_init. after this you can write (and call into) pretty complicated C functions. This is what I've tried in my early experiments.
>  
> 
> 
>     > Personally, I don't have preference on who does what, as long as we don't step on each
>     > other's toes. It would probably be easier for me to take (1), because I can easily talk
>     > to two people who are in our time zone and have a lot of mainline U-Boot experience.
>     >
>     > Thoughts?
> 
>     you could send patches on top of my tree to cleanup what ever
>     part you want in lowlevel_init. when lowlevel_init reaches a
>     minimum acceptable level, with a full patchset working on top
>     of it, I think we can send for review. Then, we will work on
>     the next details :
> 
>      * extra settings
>      * spi/nor driver
>      * ftgmac100 extensions for Aspeed
>      * NCSI support
>      * DTS support
>      * etc.
> 
>     There is also a massive hack on the ast2500 mmu disablement in
>     the core part of u-boot that I don't understand. So we could
>     try to fix now or ask help when the patchset is sent.
> 
> 
>     Cheers,
> 
>     C.
> 
> 
> 
> 
> -- 
> *M*axim *S*loyko
