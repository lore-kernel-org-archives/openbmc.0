Return-Path: <clg@kaod.org>
X-Greylist: delayed 11996 seconds by postgrey-1.35 at bilbo;
 Tue, 23 Aug 2016 05:09:12 AEST
Received: from 17.mo1.mail-out.ovh.net (17.mo1.mail-out.ovh.net
 [87.98.179.142])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJ35h6W26zDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 05:09:12 +1000 (AEST)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D4802FF9525
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 17:29:47 +0200 (CEST)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 897A02A00BD;
 Mon, 22 Aug 2016 17:29:45 +0200 (CEST)
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
Date: Mon, 22 Aug 2016 17:29:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1903615271756794626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrfedvgddtgeculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 22 Aug 2016 19:09:13 -0000

On 08/09/2016 05:13 PM, Joel Stanley wrote:
> Hello OpenBMCers,
> 
> I've pushed a new Linux tree to https://github.com/openbmc/linux as
> dev-4.7. I intend this to become the new tree used for openbmc's
> master branch.
> 
> Linux 4.7 contained basic Aspeed SoC support. This tree contains 50
> patches atop v4.7 that fall in to four categories:
> 
>  * backports of code that has gone into 4.8-rc1
>    * nsci
>    * ftgmac100 changes for ncsi
>    * watchdog
>    * irqchip
> 
>  * drivers that are out for review
>    * pinmux
>    * gpio
>    * clk
>    * clocksource
> 
>  * backports of dependencies for the above
> 
>  * drivers that require further cleanup and submission upstream
>    * i2c
>    * vuart
>    * ftgmac100 fixes for ast2500
>    * bt
>    * spi-nor
>    * p8 occ hwmon
> 
> This represents a lot of work done by Andrew, Gavin, Milton and
> myself, with help from Yi, Jeremy, Cedric, Alistair and Ben. Recently
> we've had contributions from Xo and Brendan too which has been great
> to see.
> 
> I will not be rebasing this branch. We will use it for development
> until 4.8 is released, at which time we will move to that as a base.
> As we move our drivers upstream, each subsequent dev- branch will
> contain fewer patches, with the goal being to use upstream as-is.
> 
> Before switching the builds over to this tree I would like to have
> some testing done. Please give the kernel a spin on your development
> system(s) and report back to the list on how it goes.
> 
> I recommend testing with the 2016.07-aspeed-openbmc u-boot tree.
> Testing on other u-boot versions is welcome, as the kernel should not
> be making assumptions about the system state (outside of those that
> are required, such as system UART being available).
> 
> Please jump on #openbmc at irc.freenode.net and ping me ('shenki') if
> you have any questions.
> 
> Cheers,
> 
> Joel
> 
> --
> Alistair Popple (1):
>   misc: Add Aspeed BT IPMI host driver
> 
> Andrew Jeffery (13):
>   pinctrl: dt-bindings: Add documentation for Aspeed pin controllers
>   pinctrl: Add core pinctrl support for Aspeed SoCs
>   pinctrl: Add pinctrl-aspeed-g4 driver
>   pinctrl: Add pinctrl-aspeed-g5 driver
>   gpio: dt-bindings: Add documentation for Aspeed GPIO controllers
>   syscon: dt-bindings: Add documentation for Aspeed system control units
>   aspeed-g4: Add syscon and pin controller nodes
>   palmetto: Request relevant mux functions in devicetree
>   aspeed-g4: Add gpio controller to devicetree
>   aspeed-g5: Add syscon and pin controller nodes
>   aspeed-g5: Add gpio controller to devicetree
>   net/ftgmac100: Separate rx page storage from rxdesc
>   net/ftgmac100: Make EDO{R,T}R bits configurable
> 
> Arnd Bergmann (1):
>   net/ncsi: avoid maybe-uninitialized warning
> 
> Benjamin Herrenschmidt (1):
>   irqchip/aspeed-vic: Add irq controller for Aspeed
> 
> Brendan Higgins (1):
>   i2c: aspeed: added support for slave mode
> 
> Daniel Lezcano (4):
>   of: Add a new macro to declare_of for one parameter function returning
>     a value
>   clocksource/drivers/clksrc-probe: Introduce init functions with return
>     code
>   clocksource/drivers/moxart: Add the COMPILE_TEST option
>   clocksource/drivers/moxart: Convert init function to return error
> 
> Gavin Shan (13):
>   net/ncsi: Resource management
>   net/ncsi: NCSI command packet handler
>   net/ncsi: NCSI response packet handler
>   net/ncsi: Package and channel management
>   net/ncsi: NCSI AEN packet handler
>   net/faraday: Helper functions to create or destroy MDIO interface
>   net/faraday: Read MAC address from chip
>   net/faraday: Support NCSI mode
>   net/faraday: Match driver according to compatible property
>   net/faraday: Mask PHY interrupt with NCSI mode
>   net/faraday: Disallow using reversed MAC address from hardware
>   net/faraday: Avoid PHYSTS_CHG interrupt

I gave it a try on a palmetto and a ast2500 evb. Both boot fine but
the evb dmesg is full of :  

net_ratelimit: 299522 callbacks suppressed
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG

Below is a possible fix,

Cheers,

C.


From: Cédric Le Goater <clg@kaod.org>
Subject: [PATCH] net/ftgmac100: raise PHY link sensor level
Date: Mon, 22 Aug 2016 16:29:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 5f5d3d87370f ("net/faraday: Avoid PHYSTS_CHG interrupt")
lowered the sensivity of the PHY link by setting Bit#11 in the MAC
Control Register. But this seems to generate bogus PHY interrupts on
non NC-SI adapters :

    net_ratelimit: 299522 callbacks suppressed
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
    ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
    ...

Let's lower the sensivity only for NC-SI adapters.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/net/ethernet/faraday/ftgmac100.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
===================================================================
--- linux-openbmc-4.7.git.orig/drivers/net/ethernet/faraday/ftgmac100.c
+++ linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
@@ -215,7 +215,6 @@ static void ftgmac100_init_hw(struct ftg
 				 FTGMAC100_MACCR_RXMAC_EN	| \
 				 FTGMAC100_MACCR_FULLDUP	| \
 				 FTGMAC100_MACCR_CRC_APD	| \
-				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
 				 FTGMAC100_MACCR_RX_RUNT	| \
 				 FTGMAC100_MACCR_RX_BROADPKT)
 
@@ -223,6 +222,9 @@ static void ftgmac100_start_hw(struct ft
 {
 	int maccr = MACCR_ENABLE_ALL;
 
+	if (priv->use_ncsi)
+		maccr |= FTGMAC100_MACCR_PHY_LINK_LEVEL;
+
 	switch (speed) {
 	default:
 	case 10:
