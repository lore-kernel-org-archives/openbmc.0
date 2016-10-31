Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6kym6pD0zDvNY
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:31:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4E26A17345
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 07:31:07 +0100 (CET)
Received: from hermes.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 8478E2A0074
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 07:31:06 +0100 (CET)
Subject: Re: [PATCH linux] pinctrl-aspeed-g5: Never set SCU90[6]
To: openbmc@lists.ozlabs.org
References: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5f847be5-12a9-c8ca-8365-69c92f831ed6@kaod.org>
Date: Mon, 31 Oct 2016 07:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16513292460240767746
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrjeekgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecu
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
X-List-Received-Date: Mon, 31 Oct 2016 06:31:13 -0000

On 10/31/2016 07:11 AM, Andrew Jeffery wrote:
> The description of SCU90[6] from the datasheet: 'Reserved, must keep at
> value ”0”'.
> 
> Switch from the bit-flipping macro to explicitly configuring
> .enable = .disable = 0.
> 
> If a pin depending on SCU90[6] is requested for GPIO, the export will
> succeed but changes to the GPIO's value fail to stick. With the fix the
> value can be toggled as expected. The patch has been tested on an
> AST2500 EVB.

That is an important condition for SP1 also. Could that have an impact on 
the spi1debug setting in the witherspoon DTS ? Is it still needed ? 

C.

> Reported-by: Uma Yadlapati <yadlapat@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 481e836d12e5..9a3139c13ffc 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -26,7 +26,7 @@
>  
>  #define ASPEED_G5_NR_PINS 232
>  
> -#define COND1		SIG_DESC_BIT(SCU90, 6, 0)
> +#define COND1		{ SCU90, BIT(6), 0, 0 }
>  #define COND2		{ SCU94, GENMASK(1, 0), 0, 0 }
>  
>  #define LHCR0		SIG_DESC_TO_REG(ASPEED_IP_LPC, 0xA0)
> 
