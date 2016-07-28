Return-Path: <clg@kaod.org>
Received: from 5.mo7.mail-out.ovh.net (5.mo7.mail-out.ovh.net [178.32.120.239])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0T9B3BdtzDrPg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 20:48:14 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E44C9101014D
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:22:28 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id B6EA95C0080;
 Thu, 28 Jul 2016 10:22:26 +0200 (CEST)
Subject: Re: [PATCH 1/2] palmetto-bmc: Cleanup whitespace to make checkpatch
 happy
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20160728012534.29447-1-andrew@aj.id.au>
 <20160728012534.29447-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6c31bde5-2754-f613-582d-f569e430acfa@kaod.org>
Date: Thu, 28 Jul 2016 10:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160728012534.29447-2-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13890227154811259859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 28 Jul 2016 10:48:14 -0000

On 07/28/2016 03:25 AM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/palmetto-bmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index 71b9ca73d2d4..ec4aed306e7b 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -45,9 +45,9 @@ enum {
>  };
>  
>  static const AspeedBoardConfig aspeed_boards[] = {
> -    [ PALMETTO_BMC ] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
> +    [PALMETTO_BMC] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
>                           AST2400_SDRAM_BASE },
> -    [ AST2500_EDK ]  = { 0x00000200, AST2500_A1_SILICON_REV,
> +    [AST2500_EDK]  = { 0x00000200, AST2500_A1_SILICON_REV,
>                           AST2500_SDRAM_BASE },
>  };
>  
> 

yes. I clearly missed the checkpatch step. I will include the fix in v2.

Thanks,

C. 
