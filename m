Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BlwofrNz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JavWM+4N"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysc9N23tTzDrvV
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 11:41:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F403921264;
 Wed,  6 Dec 2017 19:41:09 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Dec 2017 19:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=UgKmFa0+WEhtvT3DtTCoYHeySMxnn
 mdkcRF4sWi2EGA=; b=BlwofrNzzTfk9z3srLiOrTJrJSMo/RDRyJjT9bXA4nE//
 9IGaoefDLyJIrkXsrwAhdbmtxkCyiZWRBx+4RlamENu8J4Iv8PohVBY92QaxAC1k
 QDRB2aB0hkujLr7FaheNJEbQGEmIPM2DPuy6iMAfUaT/a5/N2RpJqA0UofUfPl1l
 B3sciXpUKz/1MLA+F5kZKJzXT0e5sxbJ5ZzqUa89ASUX0DP7xSX1ciFtj1oyYNw/
 iFDHy/xVh/6dBvvO0PMIbRN1gJTdNM+kdbg+BkqAxh+ENZxR0Vc64ki50Aopb7SU
 OM1M2z+aNiXNsTlo+bHIBXD2aRZfvgroEEhonAUEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UgKmFa
 0+WEhtvT3DtTCoYHeySMxnnmdkcRF4sWi2EGA=; b=JavWM+4NDdvzMWtrnpRuge
 WAWGTUfvv1aUXGtomRhSJ6vwgTL6GvJzDEN1HJcZPo7NgD7lqWJQokuSa0+MIIib
 Z8389oeMzNqcqOKxJ5/K6fKKuZU9/Yooz57KpAPb+12SstOtt1btKbYdP1b7URmd
 o++Fh11WvRQs3MI7KRmvpw6UKYTM/8qWM3W8AIzqyUX+321bpZcsuCTnysAlPGre
 Tx2XdqHOJYJfrr97hPLisE0sembAGXNDBIwfLG3T8Cr2YT2CAAuNIwfdeS2r4YtC
 Vx3OVlTP++YmmQ08dLDiWP3G3gHiGXQt6tK/6wQe2uhldtDdyh3uUFMZDcq7RR/g
 ==
X-ME-Sender: <xms:JY4oWuCKotfDDpdAU6QL389ZTFASYWwZPBqnbEMXVh65GPF2uW02Ew>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id CE0E9BA1A8; Wed,  6 Dec 2017 19:41:09 -0500 (EST)
Message-Id: <1512607269.2808930.1196642712.54A8CC54@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1b87d328
In-Reply-To: <20171206210313.7138-1-jae.hyun.yoo@linux.intel.com>
References: <20171206210313.7138-1-jae.hyun.yoo@linux.intel.com>
Date: Thu, 07 Dec 2017 11:11:09 +1030
Subject: Re: [PATCH 4/6] Documentation: dt-bindings,
 hwmon: Add Aspeed PECI hwmon
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
X-List-Received-Date: Thu, 07 Dec 2017 00:41:13 -0000

On Thu, 7 Dec 2017, at 07:33, Jae Hyun Yoo wrote:
> This commit add dt-bindings and hwmon documents for Aspeed PECI
> hwmon.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../bindings/hwmon/aspeed-peci-hwmon.txt           | 89
>  ++++++++++++++++++++++
>  Documentation/hwmon/aspeed-peci-hwmon              | 64 ++++++++++++++++
>  2 files changed, 153 insertions(+)
>  create mode 100644
>  Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
>  create mode 100644 Documentation/hwmon/aspeed-peci-hwmon

I'd recommend splitting out these changes, it will make upstream a bit
happier. I'd recommend sending upstream as soon as possible as well.

> 
> diff --git
> a/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
> b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
> new file mode 100644
> index 000000000000..a20a82f3380c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
> @@ -0,0 +1,89 @@
> +* ASPEED PECI (Platform Environment Control Interface) hwmon driver.
> +
> +Dependency:
> +- This driver uses ASPEED PECI kernel misc driver as a controller
> interface
> +  which can be enabled by setting CONFIG_ASPEED_PECI as yes.
> +
> +Required properties:
> +- multi-functional device body: "aspeed,ast2400-peci" or
> "aspeed,ast2500-peci"
> +       - aspeed,ast2400-peci: Aspeed AST2400 family PECI MFD
> +       - aspeed,ast2500-peci: Aspeed AST2500 family PECI MFD
> +- compatible: "aspeed,ast2400-peci-hwmon" or "aspeed,ast2500-peci-hwmon"
> +       - aspeed,ast2400-peci-hwmon: Aspeed AST2400 family PECI hwmon
> +       - aspeed,ast2500-peci-hwmon: Aspeed AST2500 family PECI hwmon
> +- cpu-id: Should contain CPU socket ID
> +       - 0 ~ 7
> +
> +Optional properties:
> +- show-core: If this property is 1, core temperature attributes will be
> +             enumerated.
> +       0 or 1 (default: 1)
> +            In fact, these will be appeared when first reading on other
> attr
> +            happens because it needs cpu info reading. The number of
> generated
> +            core attrs depends on the number of cores of the cpu
> package.

A couple of points here:

It seems show-core is actually a boolean property. In this case you
don't need to describe a value; you can simple measure the presence or
absence of the property in the node rather than assigning the property 0
or 1.

Separately, from the description it sounds like the hwmon attributes
will appear "dynamically", i.e. after probe time. If that's not the case
then disregard the following, but i expect this will have a tough time
upstream. probe() should do the reads and determine the number of
attributes required. Whilst I think you're right to document this
behaviour, I don't think the bindings documentation is the right place
for it

> +- dimm-nums: Should contain the number of DIMM slots that attached to
> the CPU
> +            which is indicated by cpu-id.
> +       0 ~ 16 (default: 16)
> +            In case of 0, DIMM temperature attrs will not be enumerated.
> +
> +Example:
> +       peci: peci@1e78b000 {
> +               compatible = "aspeed,ast2500-peci", "simple-mfd";
> +
> +               peci_hwmon0: peci-hwmon-cpu0 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <0>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon1: peci-hwmon-cpu1 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <1>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon2: peci-hwmon-cpu2 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <2>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon3: peci-hwmon-cpu3 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <3>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon4: peci-hwmon-cpu4 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <4>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon5: peci-hwmon-cpu5 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <5>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon6: peci-hwmon-cpu6 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <6>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +
> +               peci_hwmon7: peci-hwmon-cpu7 {
> +                       compatible = "aspeed,ast2500-peci-hwmon";
> +                       cpu-id = <7>;
> +                       show-core = <1>;
> +                       dimm-nums = <16>;
> +               };
> +       };

Example is probably a little verbose. You get the same effect with
describing just two sockets.

> +
> diff --git a/Documentation/hwmon/aspeed-peci-hwmon
> b/Documentation/hwmon/aspeed-peci-hwmon
> new file mode 100644
> index 000000000000..2debf1353e74
> --- /dev/null
> +++ b/Documentation/hwmon/aspeed-peci-hwmon
> @@ -0,0 +1,64 @@
> +Kernel driver aspeed-peci-hwmon
> +===============================
> +
> +Supported chips:
> +       ASPEED AST2400/2500
> +
> +Author:
> +       Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +
> +Hardware Interfaces
> +-------------------
> +
> +This driver uses ASPEED PECI kernel misc driver as a controller
> interface which
> +can be enabled by setting CONFIG_ASPEED_PECI as yes.
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the ASPEED AST2400/2500 PECI hwmon.
> +
> +
> +sysfs files
> +-----------
> +
> +temp1_input            Provides current die temperature of the CPU
> package.
> +temp1_max              Provides thermal control temperature of the CPU
> package
> +                       which is also known as Tcontrol.
> +temp1_crit             Provides shutdown temperature of the CPU package
> which
> +                       is also known as the maximum processor junction
> +                       temperature, Tjmax or Tprochot.
> +temp1_crit_hyst                Provides the hysteresis value from
> Tcontrol to Tjmax of
> +                       the CPU package.
> +
> +temp2_input            Provides current DTS thermal margin to Tcontrol
> of the
> +                       CPU package. Value 0 means it reaches to Tcontrol
> +                       temperature. Sub-zero value means the die
> temperature
> +                       goes across Tconrtol to Tjmax.
> +temp2_min              Provides the minimum DTS thermal margin to
> Tcontrol of
> +                       the CPU package.
> +temp2_lcrit            Provides the value when the CPU package
> temperature
> +                       reaches to Tjmax.
> +
> +temp3_input            Provides current Tcontrol temperature of the CPU
> +                       package which is also known as Fan Temperature
> target.
> +                       Indicates the relative value from thermal monitor
> trip
> +                       temperature at which fans should be engaged.
> +temp3_crit             Provides Tcontrol critical value of the CPU
> package
> +                       which is same to Tjmax.
> +
> +temp4_input            Provides current Tthrottle temperature of the CPU
> +                       package. Used for throttling temperature. If this
> value
> +                       is allowed and lower than Tjmax - the throttle
> will
> +                       occur and reported at lower than Tjmax.
> +
> +temp[100-127]_input    Provides current core temperature.
> +temp[100-127]_max      Provides thermal control temperature of the core.
> +temp[100-127]_crit     Provides shutdown temperature of the core.
> +temp[100-127]_crit_hyst        Provides the hysteresis value from
> Tcontrol to Tjmax of
> +                       the core.
> +
> +temp[200-215]_input    Provides current temperature of the DDR DIMM.

I think you're going to struggle getting support for the discontinuities
in the numbering.

Cheers

Andrew

> +
> -- 
> 2.15.1
> 
