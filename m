Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MEXl44JM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Fn1ZXkr7"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yscFB731JzDrqV
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 11:44:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E8C9220C46;
 Wed,  6 Dec 2017 19:44:28 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Dec 2017 19:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=6/vtPq1HzAKI9Cd583LUQ1yO9Utjb
 kbJfPLVwZ9GKWw=; b=MEXl44JMieXS5mi1CrWatrqccgIqaDMD68OXZCS+wQnnR
 82ApNay8CSGXtM1COqge0luNwv/mLTZHyn0/+oha8wITn7e1dMF0M+Vp8Hn2m+Q2
 EShMg1YlzVFpKEF5luF9MTwmgbZ4n7Z22VlFjdwBGuOM8urb4i4BRLtIAFhA/5Q1
 EIouIhs9fGZTCV0wchemf4GZbWgFf4ujMZo7mQ1X5clV5u8aJBt9qH9SgFINPTlt
 nofHDdchUwv1d7umVEPzb/Pqa0KI/obGjauF2l1SZ/fkEVY5Y7oNb0vD+Uw/ZB5s
 eBLqVefQWYu700LNQGSfba481+Z3VS1JSsj2lS9BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6/vtPq
 1HzAKI9Cd583LUQ1yO9UtjbkbJfPLVwZ9GKWw=; b=Fn1ZXkr7U3o6p00RzTKWtB
 9+oy9+5R7JVpYnPtBAnnjZGz9jgo5uw5MK7W8KF2U7WlU7HFwv6ak+W9tZi27BY2
 FDSGsU3wQLTATmqeRwwo/lZLrGRQNRQpjBEZtOKdmzO0QAVCWpXUTZ4/Z0Lx6zsk
 RHXVqNFZA9hRbyWTPRalrokHFrSzcP+QcTU5blU7P6N9/P8vPt697grggwRs6Iqf
 v75np0FzdZ8+ZfBJuPm/UCc7Jhgef8b5FEaiGewleLiBXroxinqyTuHtRF91qEIu
 Gr4QQ49ycbQmAd0LIjgUlYX86oycj7EV5xkSkzAGaDHi4j5yyasvApbZWKFiBR0g
 ==
X-ME-Sender: <xms:7I4oWuNSc0Gon0DfU3N4_zBlj5a6dgw7bddlYCCICXhDtbEHfM3VTA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C3C26BA1A8; Wed,  6 Dec 2017 19:44:28 -0500 (EST)
Message-Id: <1512607468.2810029.1196681760.040FD30F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1b87d328
Subject: Re: [PATCH 5/6] ARM: dts: aspeed: peci-hwmon: Add Aspeed PECI hwmon
Date: Thu, 07 Dec 2017 11:14:28 +1030
References: <20171206210323.7185-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20171206210323.7185-1-jae.hyun.yoo@linux.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2017 00:44:31 -0000



On Thu, 7 Dec 2017, at 07:33, Jae Hyun Yoo wrote:
> This commit adds Aspeed PECI hwmon node into aspeed-g4 and
> aspeed-g5.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 64
>  ++++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 64
>  ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 128 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> b/arch/arm/boot/dts/aspeed-g4.dtsi
> index d45f6b67fecc..f9904c2ee5d9 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -250,6 +250,70 @@
>  				clk-div = <0>;
>  				cmd-timeout-ms = <1000>;
>  				status = "disabled";
> +
> +                               peci_hwmon0: peci-hwmon-cpu0 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <0>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon1: peci-hwmon-cpu1 {

I feel like this is all better left to the platform dts rather than
describing then disabling host topology in the SoC dtsi. This applies to
the g5 dtsi as well.

Cheers,

Andrew

> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <1>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon2: peci-hwmon-cpu2 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <2>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon3: peci-hwmon-cpu3 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <3>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon4: peci-hwmon-cpu4 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <4>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon5: peci-hwmon-cpu5 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <5>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon6: peci-hwmon-cpu6 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <6>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon7: peci-hwmon-cpu7 {
> +                                       compatible =
> "aspeed,ast2400-peci-hwmon";
> +                                       cpu-id = <7>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
>  			};
>  
>  			timer: timer@1e782000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> index c75998ef759c..749ed252f71e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -301,6 +301,70 @@
>  				clk-div = <0>;
>  				cmd-timeout-ms = <1000>;
>  				status = "disabled";
> +
> +                               peci_hwmon0: peci-hwmon-cpu0 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <0>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon1: peci-hwmon-cpu1 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <1>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon2: peci-hwmon-cpu2 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <2>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon3: peci-hwmon-cpu3 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <3>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon4: peci-hwmon-cpu4 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <4>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon5: peci-hwmon-cpu5 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <5>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon6: peci-hwmon-cpu6 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <6>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
> +
> +                               peci_hwmon7: peci-hwmon-cpu7 {
> +                                       compatible =
> "aspeed,ast2500-peci-hwmon";
> +                                       cpu-id = <7>;
> +                                       show-core = <1>;
> +                                       dimm-nums = <16>;
> +                                       status = "disabled";
> +                               };
>  			};
>  
>  			timer: timer@1e782000 {
> -- 
> 2.15.1
> 
