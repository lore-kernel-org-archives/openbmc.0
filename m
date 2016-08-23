Return-Path: <clg@kaod.org>
X-Greylist: delayed 1798 seconds by postgrey-1.35 at bilbo;
 Tue, 23 Aug 2016 17:29:16 AEST
Received: from 16.mo6.mail-out.ovh.net (16.mo6.mail-out.ovh.net
 [87.98.139.208])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJMWc2XbwzDrK6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 17:29:15 +1000 (AEST)
Received: from player776.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D6408FFA122
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 08:51:41 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id 727E0400084;
 Tue, 23 Aug 2016 08:51:39 +0200 (CEST)
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
 <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9020c99d-e863-7fae-dc82-2073845dc4da@kaod.org>
Date: Tue, 23 Aug 2016 08:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17473122132035799894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrfeefgdduudekucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 23 Aug 2016 07:29:17 -0000

Gavin,

>>   net/faraday: Mask PHY interrupt with NCSI mode
>>   net/faraday: Disallow using reversed MAC address from hardware
>>   net/faraday: Avoid PHYSTS_CHG interrupt
> 
> I gave it a try on a palmetto and a ast2500 evb. Both boot fine but
> the evb dmesg is full of :  
>
> net_ratelimit: 299522 callbacks suppressed
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
> 
> Below is a possible fix,

Does that look like a correct fix  ? 

Thanks,

C.

> Cheers,
> 
> C.
> 
> 
> From: Cédric Le Goater <clg@kaod.org>
> Subject: [PATCH] net/ftgmac100: raise PHY link sensor level
> Date: Mon, 22 Aug 2016 16:29:02 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Commit 5f5d3d87370f ("net/faraday: Avoid PHYSTS_CHG interrupt")
> lowered the sensivity of the PHY link by setting Bit#11 in the MAC
> Control Register. But this seems to generate bogus PHY interrupts on
> non NC-SI adapters :
> 
>     net_ratelimit: 299522 callbacks suppressed
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x250: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x203: PHYSTS_CHG
>     ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
>     ...
> 
> Let's lower the sensivity only for NC-SI adapters.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Index: linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
> ===================================================================
> --- linux-openbmc-4.7.git.orig/drivers/net/ethernet/faraday/ftgmac100.c
> +++ linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -215,7 +215,6 @@ static void ftgmac100_init_hw(struct ftg
>  				 FTGMAC100_MACCR_RXMAC_EN	| \
>  				 FTGMAC100_MACCR_FULLDUP	| \
>  				 FTGMAC100_MACCR_CRC_APD	| \
> -				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
>  				 FTGMAC100_MACCR_RX_RUNT	| \
>  				 FTGMAC100_MACCR_RX_BROADPKT)
>  
> @@ -223,6 +222,9 @@ static void ftgmac100_start_hw(struct ft
>  {
>  	int maccr = MACCR_ENABLE_ALL;
>  
> +	if (priv->use_ncsi)
> +		maccr |= FTGMAC100_MACCR_PHY_LINK_LEVEL;
> +
>  	switch (speed) {
>  	default:
>  	case 10:
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
> 
