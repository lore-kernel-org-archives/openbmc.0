Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.165.38; helo=6.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2129 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Apr 2019 04:38:10 AEDT
Received: from 6.mo2.mail-out.ovh.net (6.mo2.mail-out.ovh.net [87.98.165.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZCwL6sFSzDqBX
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 04:38:07 +1100 (AEDT)
Received: from player760.ha.ovh.net (unknown [10.109.160.93])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id DECDE18D1CD
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 19:02:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 6188C464667B;
 Wed,  3 Apr 2019 17:02:25 +0000 (UTC)
Subject: Re: [PATCH v2] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
To: Adriana Kobylak <anoo@linux.ibm.com>, joel@jms.id.au,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, Adriana Kobylak <anoo@us.ibm.com>
References: <962b866599ac4dfd866d7433b7ddb276@linux.vnet.ibm.com>
 <1554310751-52446-1-git-send-email-anoo@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <599ff977-9e23-d1de-24c9-a5f0f1585495@kaod.org>
Date: Wed, 3 Apr 2019 19:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554310751-52446-1-git-send-email-anoo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16656563226056559496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrtdefgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 17:38:11 -0000

On 4/3/19 6:59 PM, Adriana Kobylak wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add simplified partitions for BMC and alternate flash. Include these by
> default in Witherspoon.

at last ! :

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 37 ++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 1cdc96d..82f63aa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -194,14 +194,47 @@
>  		label = "bmc";
>  		m25p,fast-read;
>  		spi-max-frequency = <50000000>;
> -#include "openbmc-flash-layout.dtsi"
> +		partitions {
> +			#address-cells = < 1 >;
> +			#size-cells = < 1 >;
> +			compatible = "fixed-partitions";
> +			u-boot@0 {
> +				reg = < 0 0x60000 >;
> +				label = "u-boot";
> +			};
> +			u-boot-env@60000 {
> +				reg = < 0x60000 0x20000 >;
> +				label = "u-boot-env";
> +			};
> +			obmc-ubi@80000 {
> +				reg = < 0x80000 0x1F80000 >;
> +				label = "obmc-ubi";
> +			};
> +		};
>  	};
>  
>  	flash@1 {
>  		status = "okay";
> -		label = "alt";
> +		label = "alt-bmc";
>  		m25p,fast-read;
>  		spi-max-frequency = <50000000>;
> +		partitions {
> +			#address-cells = < 1 >;
> +			#size-cells = < 1 >;
> +			compatible = "fixed-partitions";
> +			u-boot@0 {
> +				reg = < 0 0x60000 >;
> +				label = "alt-u-boot";
> +			};
> +			u-boot-env@60000 {
> +				reg = < 0x60000 0x20000 >;
> +				label = "alt-u-boot-env";
> +			};
> +			obmc-ubi@80000 {
> +				reg = < 0x80000 0x1F80000 >;
> +				label = "alt-obmc-ubi";
> +			};
> +		};
>  	};
>  };
>  
> 
