Return-Path: <clg@kaod.org>
Received: from 13.mo4.mail-out.ovh.net (13.mo4.mail-out.ovh.net [178.33.251.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFXgd3rwJzDvn2
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 19:11:41 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 094A61970C
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 09:02:25 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 4A78A180070;
 Fri, 11 Nov 2016 09:02:23 +0100 (CET)
Subject: Re: [PATCH] arm: dts: Add pnor label for wspoon and romulus
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20161111040238.5972-1-joel@jms.id.au>
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <85fa06da-c4d9-e64d-c5af-141f7aa5e074@kaod.org>
Date: Fri, 11 Nov 2016 09:02:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161111040238.5972-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8867869141729250196
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdehgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 11 Nov 2016 08:11:42 -0000

On 11/11/2016 05:02 AM, Joel Stanley wrote:
> This is required by userspace (pflash) to identify the PNOR.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 4c4c547fe412..c23627ec5e84 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -40,6 +40,7 @@
>  
>  	flash@0 {
>  		status = "okay";
> +		label = "pnor";
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 7badbda288d3..75c6b68950f9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -40,6 +40,7 @@
>  
>  	flash@0 {
>  		status = "okay";
> +		label = "pnor";
>  	};
>  };
>  
> 


So, according to :

	Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
	Documentation/devicetree/bindings/mtd/partitions.txt

we can not label the flash module node but we can label the 
partition instead. Would a patch like below fit the need ? 
Here is what we get on a palmetto and an EVB, the approach
are different.

	root@palmetto:~# cat /proc/mtd 
	dev:    size   erasesize  name
	mtd0: 00060000 00001000 "u-boot"
	mtd1: 00020000 00001000 "u-boot-env"
	mtd2: 00280000 00001000 "kernel"
	mtd3: 001c0000 00001000 "initramfs"
	mtd4: 01740000 00001000 "rofs"
	mtd5: 00400000 00001000 "rwfs"
	mtd6: 02000000 00010000 "1e630000.spi:pnor@0"

	root@evb-ast2500:~# cat /proc/mtd 
	dev:    size   erasesize  name
	mtd0: 00060000 00001000 "u-boot"
	mtd1: 00020000 00001000 "u-boot-env"
	mtd2: 00280000 00001000 "kernel"
	mtd3: 001c0000 00001000 "initramfs"
	mtd4: 01740000 00001000 "rofs"
	mtd5: 00400000 00001000 "rwfs"
	mtd6: 02000000 00010000 "pnor"

The partition definitions probably belongs to the machine dts.

And a udev rules would also fit the purpose I think.

Cheers,

C.  

From 614e34a070c852f36d7f277e4fda0da1f67293c8 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Fri, 11 Nov 2016 08:53:45 +0100
Subject: [PATCH] ARM: dts: aspeed: remove label and use partitions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 5 ++++-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      | 3 +--
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 9 +++++++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
index ca8639b52f6d..be57e7b11bac 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -1,7 +1,9 @@
 /* This file is the label for the bmc primary flash and its partitions */
-				label = "bmc";
+
+		    partitions {
 				#address-cells = < 1 >;
 				#size-cells = < 1 >;
+				compatible = "fixed-partitions";
 				u-boot {
 					reg = < 0 0x60000 >;
 					label = "u-boot";
@@ -26,3 +28,4 @@
 					reg = < 0x1c00000 0x400000 >;
 					label = "rwfs";
 				};
+		    };
\ No newline at end of file
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 0fd60c4eafad..8fe248f4d531 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -58,10 +58,9 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			flash {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
-				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index be95fd42dbd7..53bb2472664e 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -62,6 +62,15 @@
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				status = "disabled";
+				partitions {
+					   compatible = "fixed-partitions";
+					   #address-cells = < 1 >;
+					   #size-cells = < 1 >;
+					   pnor@0 {
+						reg = < 0x0 0x2000000 >;
+					   };
+				};
+
 			};
 			flash@1 {
 				reg = < 1 >;
-- 
2.7.4
