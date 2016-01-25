Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 8745A1A001D
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2016 00:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=tnkYu9vf; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 20E32150074;
 Mon, 25 Jan 2016 05:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=nZ9FguyL6qaHLrkYwVTfFbrxNzM=; b=tnkYu9vf6b+5GTelWIkyi3JAMBF
 mbQu/Iu7tVUwfqU90zofvMVvG7bMUbLA9eXt/ZmNI6qI+owo3tQq8G8NTS1F4GZq
 7bvarhB+2tznw9vKe9RT8oOqglu38qTuFLjn8pJL64ykBmOKG9bD2C0yQyDDKaI5
 GaP5Qj98zl1+ZCfM=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id 8933315006D;
 Mon, 25 Jan 2016 05:18:53 -0800 (PST)
Message-ID: <1453727929.2773.65.camel@aj.id.au>
Subject: Re: [PATCH linux 2/3] aspeed: update bmc dts with attached flash
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 25 Jan 2016 23:48:49 +1030
In-Reply-To: <1453434621-22227-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453434621-22227-3-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 13:18:57 -0000

On Thu, 2016-01-21 at 21:50 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> Add the attached spi flash chips attached to the static memory controller
> and the SPI memory controller.  The partitions and label for the SMC
> attached flash are included in a seperate file for import from other
> build systems.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     | 35 ++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 28 +++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      | 35 ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index ebf86bb..cba561a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -7,6 +7,41 @@
>  > 	> model = "Barrelye BMC";
>  > 	> compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
>  > 	> ahb {
> +> 	> 	fmc@1e620000 {
> +> 	> 	> 	> reg = < 0x1e620000 0x94
> +> 	> 	> 	> 	> 0x20000000 0x02000000 >;
> +> 	> 	> 	> #address-cells = <1>;
> +> 	> 	> 	> #size-cells = <0>;
> +> 	> 	> 	> compatible = "aspeed,fmc";
> +> 	> 	> 	flash@0 {
> +> 	> 	> 	> 	> reg = < 0 >;
> +> 	> 	> 	> 	> compatible = "jedec,spi-nor" ;
> +> 	> 	> 	> 	> /*
> +> 	> 	> 	> 	>  * Possibly required props:
> +> 	> 	> 	> 	>  * spi-max-frequency = <>
> +> 	> 	> 	> 	>  * spi-tx-bus-width = <>
> +> 	> 	> 	> 	>  * spi-rx-bus-width  = <>
> +> 	> 	> 	> 	>  * m25p,fast-read
> +> 	> 	> 	> 	>  * spi-cpol if inverse clock polarity (CPOL)
> +> 	> 	> 	> 	>  * spi-cpha if shifted clock phase (CPHA)
> +> 	> 	> 	> 	>  */
> +#include "aspeed-bmc-opp-flash-layout.dtsi"

This feels a little surprising, but from my limited knowledge of DT I
don't know any better way.

> +			};
> +> 	> 	> };
> +> 	> 	spi@1e630000 {
> +> 	> 	> 	> reg = < 0x1e630000 0x18
> +> 	> 	> 	> 	> 0x30000000 0x02000000 >;
> +> 	> 	> 	> #address-cells = <1>;
> +> 	> 	> 	> #size-cells = <0>;
> +> 	> 	> 	> compatible = "aspeed,smc";
> +> 	> 	> 	> flash {
> +> 	> 	> 	> 	> reg = < 0 >;
> +> 	> 	> 	> 	> compatible = "jedec,spi-nor" ;
> +> 	> 	> 	> 	> label = "pnor";
> +> 	> 	> 	> 	> /* spi-max-frequency = <>; */
> +> 	> 	> 	> 	> /* m25p,fast-read; */
> +> 	> 	> 	> };
> +> 	> 	> };
>  > 	> 	> apb {
>  > 	> 	> 	> i2c: i2c@1e78a040 {
>  > 	> 	> 	> 	> i2c0: i2c-bus@40 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> new file mode 100644
> index 0000000..ca8639b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> @@ -0,0 +1,28 @@
> +/* This file is the label for the bmc primary flash and its partitions */
> +> 	> 	> 	> 	> label = "bmc";
> +> 	> 	> 	> 	> #address-cells = < 1 >;
> +> 	> 	> 	> 	> #size-cells = < 1 >;
> +> 	> 	> 	> 	> u-boot {
> +> 	> 	> 	> 	> 	> reg = < 0 0x60000 >;
> +> 	> 	> 	> 	> 	> label = "u-boot";
> +> 	> 	> 	> 	> };
> +> 	> 	> 	> 	> u-boot-env {
> +> 	> 	> 	> 	> 	> reg = < 0x60000 0x20000 >;
> +> 	> 	> 	> 	> 	> label = "u-boot-env";
> +> 	> 	> 	> 	> };
> +> 	> 	> 	> 	> kernel  {
> +> 	> 	> 	> 	> 	> reg = < 0x80000 0x280000 >;
> +> 	> 	> 	> 	> 	> label = "kernel";
> +> 	> 	> 	> 	> };
> +> 	> 	> 	> 	> initramfs {
> +> 	> 	> 	> 	> 	> reg = < 0x300000 0x1c0000 >;
> +> 	> 	> 	> 	> 	> label = "initramfs";
> +> 	> 	> 	> 	> };
> +> 	> 	> 	> 	> rofs  {
> +> 	> 	> 	> 	> 	> reg = < 0x4c0000 0x1740000 >;
> +> 	> 	> 	> 	> 	> label = "rofs";
> +> 	> 	> 	> 	> };
> +> 	> 	> 	> 	> rwfs  {
> +> 	> 	> 	> 	> 	> reg = < 0x1c00000 0x400000 >;
> +> 	> 	> 	> 	> 	> label = "rwfs";
> +> 	> 	> 	> 	> };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 92a7c77..9aacae7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -8,6 +8,41 @@
>  > 	> compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
>  
>  > 	> ahb {
> +> 	> 	fmc@1e620000 {
> +> 	> 	> 	> reg = < 0x1e620000 0x94
> +> 	> 	> 	> 	> 0x20000000 0x02000000 >;
> +> 	> 	> 	> #address-cells = <1>;
> +> 	> 	> 	> #size-cells = <0>;
> +> 	> 	> 	> compatible = "aspeed,fmc";
> +> 	> 	> 	flash@0 {
> +> 	> 	> 	> 	> reg = < 0 >;
> +> 	> 	> 	> 	> compatible = "jedec,spi-nor" ;
> +> 	> 	> 	> 	> /*
> +> 	> 	> 	> 	>  * Possibly required props:
> +> 	> 	> 	> 	>  * spi-max-frequency = <>
> +> 	> 	> 	> 	>  * spi-tx-bus-width = <>
> +> 	> 	> 	> 	>  * spi-rx-bus-width  = <>
> +> 	> 	> 	> 	>  * m25p,fast-read
> +> 	> 	> 	> 	>  * spi-cpol if inverse clock polarity (CPOL)
> +> 	> 	> 	> 	>  * spi-cpha if shifted clock phase (CPHA)
> +> 	> 	> 	> 	>  */
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +> 	> 	> 	> };
> +> 	> 	> };
> +> 	> 	spi@1e630000 {
> +> 	> 	> 	> reg = < 0x1e630000 0x18
> +> 	> 	> 	> 	> 0x30000000 0x02000000 >;
> +> 	> 	> 	> #address-cells = <1>;
> +> 	> 	> 	> #size-cells = <0>;
> +> 	> 	> 	> compatible = "aspeed,smc";
> +> 	> 	> 	> flash {
> +> 	> 	> 	> 	> reg = < 0 >;
> +> 	> 	> 	> 	> compatible = "jedec,spi-nor" ;
> +> 	> 	> 	> 	> label = "pnor";
> +> 	> 	> 	> 	> /* spi-max-frequency = <>; */
> +> 	> 	> 	> 	> /* m25p,fast-read; */
> +> 	> 	> 	> };
> +> 	> 	> };
>  > 	> 	> apb {
>  > 	> 	> 	> i2c: i2c@1e78a040 {
>  > 	> 	> 	> 	> i2c0: i2c-bus@40 {
