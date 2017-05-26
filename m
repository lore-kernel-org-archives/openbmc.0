Return-Path: <clg@kaod.org>
X-Greylist: delayed 522 seconds by postgrey-1.36 at bilbo;
 Fri, 26 May 2017 16:26:12 AEST
Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [87.98.181.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYx3S1jSTzDqVF
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 16:26:12 +1000 (AEST)
Received: from player718.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 38CEB89149
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 08:17:25 +0200 (CEST)
Received: from zorba.kaod.org (ken64-2-78-199-76-109.fbx.proxad.net
 [78.199.76.109]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id DF8074E006B;
 Fri, 26 May 2017 08:17:20 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
References: <1495746791-2748-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcPUcbZt4xKHh+bNGq799ObpD1dfGaZamPL=Q9-UStS9Q@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78ec6cac-79f9-643e-71eb-dfeae156c9d4@kaod.org>
Date: Fri, 26 May 2017 08:17:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcPUcbZt4xKHh+bNGq799ObpD1dfGaZamPL=Q9-UStS9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14444169905845275633
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrfeehgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 26 May 2017 06:26:12 -0000

On 05/26/2017 06:33 AM, Joel Stanley wrote:
> On Fri, May 26, 2017 at 7:13 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Reorganize flash controllers into the ast2400 config. Barreleye wasn't
>> booting with the new aspeed-smc driver.
> 
> Your commit message mentions Barreleye, but you're also updating Palmetto.
> 
> Can you please update all of the ast2400 platforms?
> 
> Also cc Cedric on your next version so he can check that we're doing
> the correct thing.

Joel,

I would also like to add CONFIG_VMSPLIT_2G on the G4 to define 
correctly the SMC controller flash mapping window on the AHB Bus.
It is limited to 32MB currently

Do you think we can take these ?

	http://patchwork.ozlabs.org/patch/752285/
	http://patchwork.ozlabs.org/patch/752287/

C.

>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 44 ++++++++--------------
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 52 ++++++++------------------
>>  arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++++
>>  3 files changed, 66 insertions(+), 64 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> index be1f2d1..7a616bb 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> @@ -31,34 +31,6 @@
>>                 };
>>         };
>>
>> -       ahb {
>> -               bmc_pnor: fmc@1e620000 {
>> -                       reg = < 0x1e620000 0x94
>> -                               0x20000000 0x02000000 >;
>> -                       #address-cells = <1>;
>> -                       #size-cells = <0>;
>> -                       compatible = "aspeed,ast2400-fmc";
>> -                       flash@0 {
>> -                               reg = < 0 >;
>> -                               compatible = "jedec,spi-nor" ;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> -                       };
>> -               };
>> -
>> -               host_pnor: spi@1e630000 {
>> -                       reg = < 0x1e630000 0x18
>> -                               0x30000000 0x02000000 >;
>> -                       #address-cells = <1>;
>> -                       #size-cells = <0>;
>> -                       compatible = "aspeed,ast2400-spi";
>> -                       flash@0 {
>> -                               reg = < 0 >;
>> -                               compatible = "jedec,spi-nor" ;
>> -                               label = "pnor";
>> -                       };
>> -               };
>> -       };
>> -
>>         leds {
>>                 compatible = "gpio-leds";
>>
>> @@ -76,6 +48,22 @@
>>         };
>>  };
>>
>> +&bmc_pnor {
>> +       status = "okay";
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +&host_pnor {
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +       };
>> +};
>> +
>>  &pinctrl {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index b4faa1d..e55abe6 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -47,42 +47,6 @@
>>                  };
>>          };
>>
>> -       ahb {
>> -               bmc_pnor: fmc@1e620000 {
>> -                       reg = < 0x1e620000 0x94
>> -                               0x20000000 0x02000000 >;
>> -                       #address-cells = <1>;
>> -                       #size-cells = <0>;
>> -                       compatible = "aspeed,ast2400-fmc";
>> -                       aspeed,fmc-has-dma;
>> -                       interrupts = <19>;
>> -                       clocks = <&clk_ahb>;
>> -                       clock-names = "ahb";
>> -                       flash@0 {
>> -                               reg = < 0 >;
>> -                               compatible = "jedec,spi-nor" ;
>> -                               m25p,fast-read;
>> -#include "aspeed-bmc-opp-flash-layout.dtsi"
>> -                       };
>> -               };
>> -
>> -               host_pnor: spi@1e630000 {
>> -                       reg = < 0x1e630000 0x18
>> -                               0x30000000 0x02000000 >;
>> -                       #address-cells = <1>;
>> -                       #size-cells = <0>;
>> -                       compatible = "aspeed,ast2400-spi";
>> -                       clocks = <&clk_ahb>;
>> -                       clock-names = "ahb";
>> -                       flash {
>> -                               reg = < 0 >;
>> -                               compatible = "jedec,spi-nor" ;
>> -                               label = "pnor";
>> -                               m25p,fast-read;
>> -                       };
>> -               };
>> -       };
>> -
>>         gpio-fsi {
>>                 compatible = "fsi-master-gpio", "fsi-master";
>>
>> @@ -94,6 +58,22 @@
>>         };
>>  };
>>
>> +&bmc_pnor {
>> +       status = "okay";
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +#include "aspeed-bmc-opp-flash-layout.dtsi"
>> +       };
>> +};
>> +
>> +&host_pnor {
>> +       flash@0 {
>> +               status = "okay";
>> +               m25p,fast-read;
>> +       };
>> +};
>> +
>>  &pinctrl {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index d8827d5..9fb7889 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -44,6 +44,40 @@
>>                 #size-cells = <1>;
>>                 ranges;
>>
>> +               bmc_pnor: fmc@1e620000 {
>> +                       reg = < 0x1e620000 0x94
>> +                               0x20000000 0x02000000 >;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       compatible = "aspeed,ast2400-fmc";
>> +                       status = "disabled";
>> +                       aspeed,fmc-has-dma;
>> +                       interrupts = <19>;
>> +                       clocks = <&clk_ahb>;
>> +                       clock-names = "ahb";
>> +                       flash@0 {
>> +                               reg = < 0 >;
>> +                               compatible = "jedec,spi-nor" ;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               host_pnor: spi@1e630000 {
>> +                       reg = < 0x1e630000 0x18
>> +                               0x30000000 0x02000000 >;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       compatible = "aspeed,ast2400-spi";
>> +                       status = "disabled";
>> +                       clocks = <&clk_ahb>;
>> +                       clock-names = "ahb";
>> +                       flash@0 {
>> +                               reg = < 0 >;
>> +                               compatible = "jedec,spi-nor" ;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>>                 vic: interrupt-controller@1e6c0080 {
>>                         compatible = "aspeed,ast2400-vic";
>>                         interrupt-controller;
>> --
>> 1.8.3.1
>>
