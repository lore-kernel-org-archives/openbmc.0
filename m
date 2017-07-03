Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1LCD5Mt0zDr47
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 18:39:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ooZIz1to"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id a12so3836803ywh.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aQ3cwwA6Op05XCsdDrJgmBYxUWtCeuYV4tc2X6KksIA=;
 b=ooZIz1toWZzm7/XHoNVdR5G7xDvlFRUm7nH++Xs6HrY5WZmuma79F9e/ZZlF2+qtti
 61d58XmDzxqWo6hmXqXkhCJobu0wphxlMYaC9h1SX4FnoeOGIIczQkPE04Rc+D4YZM4a
 ii7inbKint7eH29LuOECOsyyzCswnYNhyhmF1amkbWtYW9yfPVQwZMRm9ftcIVTNAK+y
 MmUAm8yyRvljs+hyrx77fTnixdg53EQPoW3AI8uzywgvYxDdm5IZUSSpTA3E2SYgHRoD
 5Lad9Yx113qiEUVkZouGQFe+LRoWd+++eqOfNhVG240Nz7pJoY28I8r6YfqjXKOTzweA
 SpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aQ3cwwA6Op05XCsdDrJgmBYxUWtCeuYV4tc2X6KksIA=;
 b=aMCKo70Aiw1IqhKbPCNgJf4uPZfsbJxDwxzl29bu1+B8rJ+Z3rtRlSllceKsFd2sLz
 pZg+FcZPvKj3BZ8Bm4Gg+0Yizs3/rrkKpyvHq3Z12D42+G/rAm9MtzG+G+ZRWSMzfB2H
 DND6xXa7ZHg9Ax34jOGvyaAT9XAyee2x1oRpE9VG2vvwh2bOzwRNRnu/PJnnnrpVDPvF
 A04WIZrlsP/csj/uXNutB/+5Few0RhdWEysQsQ5MpmqsbVgJKCUvpmJKomP8v+FUpqxv
 0e4VBWGiFIVxyIBMERTI8sFfVK5tKMRms1eBKXHdKsRiRytdPNBnUtpj/HaLNosqg8/a
 kGlg==
X-Gm-Message-State: AKS2vOxUZ0/JbGFNpN2uA1iIoTkSux5w9JD6FY1MPZIeR9FdNnbD8L0h
 K1elxIUBF3QRpSXl5TFwUuEYdqN2rw==
X-Received: by 10.129.93.133 with SMTP id r127mr25554789ywb.135.1499071142612; 
 Mon, 03 Jul 2017 01:39:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Mon, 3 Jul 2017 01:38:42 -0700 (PDT)
In-Reply-To: <1498754556-21020-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498754556-21020-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 18:08:42 +0930
X-Google-Sender-Auth: zgwr05qPZhYP2WN-YPJcmx4--3A
Message-ID: <CACPK8XfAaTkp-dOf01q+=rW1=5ip-ndmnVSoO2Jh7EiAiQPTcw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/2] arm/dts: Add I2C master and ports
 to FSI cfam
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 03 Jul 2017 08:39:05 -0000

On Fri, Jun 30, 2017 at 2:12 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> FSI I2C master algorithm probes port devices based on dts.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 120 +++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 120 +++++++++++++++++
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
>  3 files changed, 404 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index d53dc59..4a1a390 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -72,6 +72,126 @@
>
>  #include "ibm-power9-cfam.dtsi"
>
> +&cfam0_i2c0 {
> +       status = "okay";
> +};

The point of separating out the description and enabling of these i2c
nodes was so we could selectively enable the ones that are in use by
OpenBMC kernel drivers and userspace applications.

With this change we enable 30 i2c character devices, and consume the
associated kernel memory.

Did you make any progress with discovering the devices that are required?

I can see from a bug report that the SBE EEPROM is one use case:

 errorMessage  : ServerI2CInstruction::iic_open invalid device open
attempt /dev/i2c-100

Could we enable just that one on each processor to unblock people
using it for this use case while you investigate other uses?

Cheers,

Joel
> +
> +&cfam0_i2c1 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c2 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c3 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c4 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c5 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c6 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c7 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c8 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c9 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c10 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c11 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c12 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c13 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c14 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c0 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c1 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c2 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c3 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c4 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c5 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c6 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c7 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c8 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c9 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c10 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c11 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c12 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c13 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c14 {
> +       status = "okay";
> +};
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..4cc99e2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -84,6 +84,126 @@
>
>  #include "ibm-power9-cfam.dtsi"
>
> +&cfam0_i2c0 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c1 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c2 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c3 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c4 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c5 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c6 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c7 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c8 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c9 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c10 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c11 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c12 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c13 {
> +       status = "okay";
> +};
> +
> +&cfam0_i2c14 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c0 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c1 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c2 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c3 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c4 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c5 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c6 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c7 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c8 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c9 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c10 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c11 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c12 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c13 {
> +       status = "okay";
> +};
> +
> +&cfam1_i2c14 {
> +       status = "okay";
> +};
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> index f29c6e3..ede778d 100644
> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -4,6 +4,88 @@
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
> +               i2c@1800 {
> +                       compatible = "ibm,fsi-i2c-master";
> +                       reg = <0x1800 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       cfam0_i2c0: i2c-bus@0 {
> +                               status = "disabled";
> +                               reg = <0>;
> +                       };
> +
> +                       cfam0_i2c1: i2c-bus@1 {
> +                               status = "disabled";
> +                               reg = <1>;
> +                       };
> +
> +                       cfam0_i2c2: i2c-bus@2 {
> +                               status = "disabled";
> +                               reg = <2>;
> +                       };
> +
> +                       cfam0_i2c3: i2c-bus@3 {
> +                               status = "disabled";
> +                               reg = <3>;
> +                       };
> +
> +                       cfam0_i2c4: i2c-bus@4 {
> +                               status = "disabled";
> +                               reg = <4>;
> +                       };
> +
> +                       cfam0_i2c5: i2c-bus@5 {
> +                               status = "disabled";
> +                               reg = <5>;
> +                       };
> +
> +                       cfam0_i2c6: i2c-bus@6 {
> +                               status = "disabled";
> +                               reg = <6>;
> +                       };
> +
> +                       cfam0_i2c7: i2c-bus@7 {
> +                               status = "disabled";
> +                               reg = <7>;
> +                       };
> +
> +                       cfam0_i2c8: i2c-bus@8 {
> +                               status = "disabled";
> +                               reg = <8>;
> +                       };
> +
> +                       cfam0_i2c9: i2c-bus@9 {
> +                               status = "disabled";
> +                               reg = <9>;
> +                       };
> +
> +                       cfam0_i2c10: i2c-bus@10 {
> +                               status = "disabled";
> +                               reg = <10>;
> +                       };
> +
> +                       cfam0_i2c11: i2c-bus@11 {
> +                               status = "disabled";
> +                               reg = <11>;
> +                       };
> +
> +                       cfam0_i2c12: i2c-bus@12 {
> +                               status = "disabled";
> +                               reg = <12>;
> +                       };
> +
> +                       cfam0_i2c13: i2c-bus@13 {
> +                               status = "disabled";
> +                               reg = <13>;
> +                       };
> +
> +                       cfam0_i2c14: i2c-bus@14 {
> +                               status = "disabled";
> +                               reg = <14>;
> +                       };
> +               };
> +
>                 sbefifo@2400 {
>                         compatible = "ibm,p9-sbefifo";
>                         reg = <0x2400 0x400>;
> @@ -31,6 +113,88 @@
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
>
> +                               i2c@1800 {
> +                                       compatible = "ibm,fsi-i2c-master";
> +                                       reg = <0x1800 0x400>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       cfam1_i2c0: i2c-bus@0 {
> +                                               status = "disabled";
> +                                               reg = <0>;
> +                                       };
> +
> +                                       cfam1_i2c1: i2c-bus@1 {
> +                                               status = "disabled";
> +                                               reg = <1>;
> +                                       };
> +
> +                                       cfam1_i2c2: i2c-bus@2 {
> +                                               status = "disabled";
> +                                               reg = <2>;
> +                                       };
> +
> +                                       cfam1_i2c3: i2c-bus@3 {
> +                                               status = "disabled";
> +                                               reg = <3>;
> +                                       };
> +
> +                                       cfam1_i2c4: i2c-bus@4 {
> +                                               status = "disabled";
> +                                               reg = <4>;
> +                                       };
> +
> +                                       cfam1_i2c5: i2c-bus@5 {
> +                                               status = "disabled";
> +                                               reg = <5>;
> +                                       };
> +
> +                                       cfam1_i2c6: i2c-bus@6 {
> +                                               status = "disabled";
> +                                               reg = <6>;
> +                                       };
> +
> +                                       cfam1_i2c7: i2c-bus@7 {
> +                                               status = "disabled";
> +                                               reg = <7>;
> +                                       };
> +
> +                                       cfam1_i2c8: i2c-bus@8 {
> +                                               status = "disabled";
> +                                               reg = <8>;
> +                                       };
> +
> +                                       cfam1_i2c9: i2c-bus@9 {
> +                                               status = "disabled";
> +                                               reg = <9>;
> +                                       };
> +
> +                                       cfam1_i2c10: i2c-bus@10 {
> +                                               status = "disabled";
> +                                               reg = <10>;
> +                                       };
> +
> +                                       cfam1_i2c11: i2c-bus@11 {
> +                                               status = "disabled";
> +                                               reg = <11>;
> +                                       };
> +
> +                                       cfam1_i2c12: i2c-bus@12 {
> +                                               status = "disabled";
> +                                               reg = <12>;
> +                                       };
> +
> +                                       cfam1_i2c13: i2c-bus@13 {
> +                                               status = "disabled";
> +                                               reg = <13>;
> +                                       };
> +
> +                                       cfam1_i2c14: i2c-bus@14 {
> +                                               status = "disabled";
> +                                               reg = <14>;
> +                                       };
> +                               };
> +
>                                 sbefifo@2400 {
>                                         compatible = "ibm,p9-sbefifo";
>                                         reg = <0x2400 0x400>;
> --
> 1.8.3.1
>
