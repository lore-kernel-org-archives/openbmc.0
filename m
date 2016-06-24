Return-Path: <clg@kaod.org>
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rblKC5FmRzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 03:13:19 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 26C1BFF930A
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 19:13:15 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 795D92C00A0;
 Fri, 24 Jun 2016 19:13:12 +0200 (CEST)
Subject: Re: [linux 2/2] drivers/net/ftgmac100: Adapt for Aspeed SoCs
To: Joel Stanley <joel@jms.id.au>, andrew@aj.id.au
References: <1466753146-2916-1-git-send-email-joel@jms.id.au>
 <1466753146-2916-2-git-send-email-joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <055e43c0-ce8a-a627-26b9-44ea9d17d2e1@kaod.org>
Date: Fri, 24 Jun 2016 19:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466753146-2916-2-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7649926918622448386
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 24 Jun 2016 17:13:20 -0000

On 06/24/2016 09:25 AM, Joel Stanley wrote:
> The RXDES and TXDES registers bits in the ftgmac100 indicates EDO{R,T}R
> at bit position 15 for the Faraday Tech IP. However, the version of this
> IP present in the Aspeed SoCs has these bits at position 30 in the
> registers.
> 
> It appers that ast2400 SoCs support both positions, with the 15th bit
> marked as reserved but still functional. In the ast2500 this bit is
> reused for another function, so we need a work around.
> 
> This was confirmed with engineers from Aspeed that using bit 30 is
> correct for both the ast2400 and ast2500 SoCs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Nice result.  

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

>  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 2c2675d6ee3b..e805c4d4c5f8 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1358,8 +1358,14 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  		priv->use_ncsi = false;
>  	}
>  
> -	priv->rxdes0_edorr_mask = BIT(15);
> -	priv->txdes0_edotr_mask = BIT(15);
> +	if (of_machine_is_compatible("aspeed,ast2400") ||
> +	    of_machine_is_compatible("aspeed,ast2500")) {
> +		priv->rxdes0_edorr_mask = BIT(30);
> +		priv->txdes0_edotr_mask = BIT(30);
> +	} else {
> +		priv->rxdes0_edorr_mask = BIT(15);
> +		priv->txdes0_edotr_mask = BIT(15);
> +	}
>  
>  	netdev->ethtool_ops = &ftgmac100_ethtool_ops;
>  	netdev->netdev_ops = &ftgmac100_netdev_ops;
> 
