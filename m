Return-Path: <clg@kaod.org>
Received: from 5.mo7.mail-out.ovh.net (5.mo7.mail-out.ovh.net [178.32.120.239])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0Q3q0P8ZzDrPj
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 18:28:23 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id D7FD7100C5B3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:21:19 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id F32125C009D;
 Thu, 28 Jul 2016 10:21:15 +0200 (CEST)
Subject: Re: [PATCH 2/2] ast2500-edk: Configure HW strap register
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20160728012534.29447-1-andrew@aj.id.au>
 <20160728012534.29447-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0f2beb05-e04e-91c9-9772-e84cf0903684@kaod.org>
Date: Thu, 28 Jul 2016 10:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160728012534.29447-3-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13870805381605460947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 28 Jul 2016 08:28:23 -0000

On 07/28/2016 03:25 AM, Andrew Jeffery wrote:
> Strap register value was read off the hardware after boot.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/palmetto-bmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index ec4aed306e7b..9e9c7e403133 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -47,7 +47,7 @@ enum {
>  static const AspeedBoardConfig aspeed_boards[] = {
>      [PALMETTO_BMC] = { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
>                           AST2400_SDRAM_BASE },
> -    [AST2500_EDK]  = { 0x00000200, AST2500_A1_SILICON_REV,
> +    [AST2500_EDK]  = { 0x7100c2e6, AST2500_A1_SILICON_REV,
>                           AST2500_SDRAM_BASE },

so maybe we could define the ast2500 hw-strap1 value in :

	include/hw/misc/aspeed_scu.h,

comments are sufficient enough. So you can replace the version I did
for the ast2400. We can always come back to the macros when the u-boot 
code is merged.


Thanks,

C.  
