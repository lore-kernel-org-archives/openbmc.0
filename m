Return-Path: <clg@kaod.org>
X-Greylist: delayed 1801 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Apr 2017 17:35:00 AEST
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD7yD3Cd0zDqCL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:35:00 +1000 (AEST)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 13B506F641
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 08:57:52 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id DE1B126008C;
 Thu, 27 Apr 2017 08:57:46 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 10/10] aspeed: romulus: Remove manual CS
 decoding window configuration
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-11-andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, mine260309@gmail.com, raltherr@google.com,
 xow@google.com
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <34e26925-3142-9917-feac-eeb17d1eea13@kaod.org>
Date: Thu, 27 Apr 2017 08:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170427060823.32226-11-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10840164303153630152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrgeehgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 27 Apr 2017 07:35:00 -0000

On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
> This is now handled by the SMC driver.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  arch/arm/mach-aspeed/aspeed.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 837649b9fad9..14cea0825199 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -153,12 +153,6 @@ static void __init do_witherspoon_setup(void)
>  static void __init do_romulus_setup(void)
>  {
>  	do_common_setup();
> -
> -	/* Set SPI1 CE1 decoding window to 0x34000000 */
> -	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
> -
> -	/* Set SPI1 CE0 decoding window to 0x30000000 */
> -	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>  }
>  
>  #define SCU_PASSWORD	0x1688A8A8
> 
