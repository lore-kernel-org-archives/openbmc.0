Return-Path: <clg@kaod.org>
Received: from 8.mo3.mail-out.ovh.net (8.mo3.mail-out.ovh.net [87.98.172.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq5cT5YnkzDq8B
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 02:36:57 +1000 (AEST)
Received: from player771.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A8A67EB95B
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 18:27:15 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player771.ha.ovh.net (Postfix) with ESMTPSA id 92C60840089;
 Fri, 16 Jun 2017 18:27:12 +0200 (CEST)
Subject: Re: [PATCH] ARM: dts: witherspoon: enable wdt2
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <20170616161229.6639-1-mspinler@linux.vnet.ibm.com>
Cc: Matt Spinler <spinler@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <58d6b0bd-13cb-f161-661a-fbb8ab8e6f6b@kaod.org>
Date: Fri, 16 Jun 2017 18:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170616161229.6639-1-mspinler@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 496240386260241336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrjeelgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 16 Jun 2017 16:36:58 -0000

On 06/16/2017 06:12 PM, Matt Spinler wrote:
> From: Matt Spinler <spinler@us.ibm.com>
> 
> WDT1 is used for a fan watchdog, so enable WDT2
> for use by others.
> 
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 99003b9fb54b..1c99e22b256b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -84,6 +84,10 @@
>  
>  #include "ibm-power9-cfam.dtsi"
>  
> +&wdt2 {
> +    status = "okay";
> +};
> +
>  &fmc {
>  	status = "okay";
>  	flash@0 {
> @@ -367,7 +371,7 @@
>  			type = <PCA955X_TYPE_GPIO>;
>  		};
>  		gpio@14 {
> -			reg = <14>;
> +			reg = <14>;./arch/arm/boot/dts/

may be not ? :)

C. 

>  			type = <PCA955X_TYPE_GPIO>;
>  		};
>  		gpio@15 {
> 
