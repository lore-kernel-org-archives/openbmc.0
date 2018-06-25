Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.63.100; helo=6.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8411 seconds by postgrey-1.36 at bilbo;
 Mon, 25 Jun 2018 17:21:36 AEST
Received: from 6.mo68.mail-out.ovh.net (6.mo68.mail-out.ovh.net
 [46.105.63.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Dgb447vQzF14s
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 17:21:34 +1000 (AEST)
Received: from player789.ha.ovh.net (unknown [10.109.108.76])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id B9EDBE8B93
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 06:53:37 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id D4B3D26008E;
 Mon, 25 Jun 2018 06:53:34 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17 v2 1/2] ARM: dts: aspeed: Add
 "spi-max-frequency" property
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-2-clg@kaod.org>
 <CACPK8XenvZXcciV_sY-f4ZEjV+H1UtA1Ef5JYnvr2CKwM3NXtw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e4568bc9-1221-06e3-e988-dfe45f168710@kaod.org>
Date: Mon, 25 Jun 2018 06:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XenvZXcciV_sY-f4ZEjV+H1UtA1Ef5JYnvr2CKwM3NXtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8453537979115801515
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedruddvgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 07:21:37 -0000

On 06/25/2018 05:40 AM, Joel Stanley wrote:
> Hi Cedric,
> 
> On 22 June 2018 at 16:39, Cédric Le Goater <clg@kaod.org> wrote:
>> Keep the FMC controller chips at a safe 50 MHz rate and use 100 MHz
>> for the PNOR on the machines using a AST2500 SoC.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++
> 
> The changes look good. I notice you've only modified the openpower
> platforms and the evb. Is there a reason we don't do this for all of
> the ast2500 boards?

When I started working on this patchset, I am not sure these boards
existed yet. Should we just bump the max freq to 100MHz for all ?

Thanks,

C. 

> $ grep -l ast2500 arch/arm/boot/dts/aspeed-*.dts
> arch/arm/boot/dts/aspeed-ast2500-evb.dts
> arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> 
> Cheers,
> 
> Joel
> 
>>  arch/arm/boot/dts/aspeed-g4.dtsi                 | 2 ++
>>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 7 +++++++
>>  7 files changed, 20 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index c0a7f51e7eb6..6b78e40d3259 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -41,6 +41,7 @@
>>                 status = "okay";
>>                 m25p,fast-read;
>>                 label = "bmc";
>> +               spi-max-frequency = <50000000>;
>>  #include "openbmc-flash-layout.dtsi"
>>         };
>>  };
>> @@ -51,6 +52,7 @@
>>                 status = "okay";
>>                 m25p,fast-read;
>>                 label = "pnor";
>> +               spi-max-frequency = <100000000>;
>>         };
>>  };
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index e6095f51ecf5..af41973a3882 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -66,6 +66,7 @@
>>                 status = "okay";
>>                 m25p,fast-read;
>>                 label = "bmc";
>> +               spi-max-frequency = <50000000>;
>>  #include "openbmc-flash-layout.dtsi"
>>         };
>>  };
>> @@ -78,6 +79,7 @@
>>         flash@0 {
>>                 status = "okay";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <50000000>;
>>                 label = "pnor";
>>         };
>>  };
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index 347938673c83..ffe0c991d985 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -93,6 +93,7 @@
>>                 status = "okay";
>>                 m25p,fast-read;
>>                 label = "bmc";
>> +               spi-max-frequency = <50000000>;
>>  #include "openbmc-flash-layout.dtsi"
>>         };
>>  };
>> @@ -106,6 +107,7 @@
>>                 status = "okay";
>>                 m25p,fast-read;
>>                 label = "pnor";
>> +               spi-max-frequency = <100000000>;
>>         };
>>  };
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index d05ace220a09..c51e3e8ece62 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -190,6 +190,7 @@
>>                 status = "okay";
>>                 label = "bmc";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <50000000>;
>>  #include "openbmc-flash-layout.dtsi"
>>         };
>>
>> @@ -197,6 +198,7 @@
>>                 status = "okay";
>>                 label = "alt";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <50000000>;
>>         };
>>  };
>>
>> @@ -209,6 +211,7 @@
>>                 status = "okay";
>>                 label = "pnor";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <100000000>;
>>         };
>>  };
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index 80cc7cba163c..757d6b3eb041 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -124,6 +124,7 @@
>>                 status = "okay";
>>                 label = "bmc";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <50000000>;
>>  #include "openbmc-flash-layout.dtsi"
>>         };
>>  };
>> @@ -137,6 +138,7 @@
>>                 status = "okay";
>>                 label = "pnor";
>>                 m25p,fast-read;
>> +               spi-max-frequency = <100000000>;
>>         };
>>  };
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index 79257bf415a8..e526f54f400e 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -65,6 +65,7 @@
>>                         flash@0 {
>>                                 reg = < 0 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                 };
>> @@ -80,6 +81,7 @@
>>                         flash@0 {
>>                                 reg = < 0 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                 };
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index 9cc50551c42e..afd33112c329 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -65,16 +65,19 @@
>>                         flash@0 {
>>                                 reg = < 0 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                         flash@1 {
>>                                 reg = < 1 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                         flash@2 {
>>                                 reg = < 2 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                 };
>> @@ -90,11 +93,13 @@
>>                         flash@0 {
>>                                 reg = < 0 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                         flash@1 {
>>                                 reg = < 1 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                 };
>> @@ -110,11 +115,13 @@
>>                         flash@0 {
>>                                 reg = < 0 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                         flash@1 {
>>                                 reg = < 1 >;
>>                                 compatible = "jedec,spi-nor";
>> +                               spi-max-frequency = <50000000>;
>>                                 status = "disabled";
>>                         };
>>                 };
>> --
>> 2.13.6
>>
