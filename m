Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJENdgfG"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ClDq1rzkzDqFG
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 03:03:22 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id y13so4331238iop.11
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YVb70Br98RjODwcN737YyuADn/u2YPgXUpMLHh6a1wg=;
 b=lJENdgfGN0Icou7KSZknctggtkPrs2d/9hvxAY4ygPfFqfcDFBr8Zmxrk0GXFITTy+
 0sUvxzxZdYGlMa8PhhnRMDREelHWzSPmI4B+YURCYe+fQIcM/sKptsM6dNbBwHoSl27o
 IFEHCOljM6qCq1bpjBkfbwJWSTLdV6axz174lgQNAKZkbbsZmztbNyPGOruYKFHZgtvX
 gWyO1ybUS1aVnAHWtZJk6K1AZJj8B5Wa1E4QjQbNY77uZ3NtbUbFYO8z3Orqx+kKn2W4
 UD1di0WJ4ZYgcGIRdfHFVwyc4YIX6sVhedbM0K1gk3aPMd2I5UUJ+vGqEugysnwJzoPL
 fYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YVb70Br98RjODwcN737YyuADn/u2YPgXUpMLHh6a1wg=;
 b=b5geAcc9s3jhQ76yZm7q4aQxdsMU5FDisguQgag85LhR6K+IkJfHcWbn69VK9seej2
 wni5qPglQmcH0v3njs21swrAz+o16FG9onC+WC+bh+Dytil6+e8OTo38NBcioW7w54G6
 1u3/73s4M1jfy0yzPkbI8EyZv4SxEbBHH8P22NH+fYZtgMa7lDG8zu5k0VxYfwjs7pB1
 fORHU5JUMsAsxRORYiLtaS/kzFU1VHOEUy9b+S2n8iCJVyb/ueU5GlEpX8bgDJC00HNv
 eY4a6p4pjW54+WeSTRmMHHxf43DBuQZplN1xPTGWGJN7dO5KW1NxbxkhS0aOB5n0O9W9
 P/Xw==
X-Gm-Message-State: APjAAAXLOZx/AfzpY3z9+Z6GKhZTE/KNcbq4oEWKnfdlT7W7TVRb8LJW
 c97UUJEwexh83UdU/6FTuqHUUxm+92kzVKqcRbH+
X-Google-Smtp-Source: APXvYqxdQwmcU/ebRfPt3eKJZNY0wnNwH131VTnj5+n+XbRbW4+xXEQJsDuTZewsV2e/PtCcQa6mubwkGft4X3j4UKI=
X-Received: by 2002:a6b:691c:: with SMTP id e28mr8187525ioc.295.1551715399080; 
 Mon, 04 Mar 2019 08:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20190228094925.5419-1-fran.hsu@quantatw.com>
 <CACPK8XcDgnyYpg-QfZOGj5-xTScWUpyhEUigWadGzZQ8kkeH4A@mail.gmail.com>
 <6368ebf3122c4357ac469d4733c346ea@quantatw.com>
In-Reply-To: <6368ebf3122c4357ac469d4733c346ea@quantatw.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 4 Mar 2019 18:03:08 +0200
Message-ID: <CAKKbWA5cHQaQb+Yk26LTbk6QeE6F1ZfDiErjmggJxT42nhwkNA@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 v3] Add Quanta GSJ board device tree v2.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Cc: Joel Stanley <joel@jms.id.au>, Emily Shaffer <emilyshaffer@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 04 Mar 2019 16:03:25 -0000

On Mon, Mar 4, 2019 at 4:43 PM Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran=
.Hsu@quantatw.com> wrote:
>
> Hi Joel,
>     Thanks for your suggestion.
> I will push the new patch for your review soon.
> Regarding the part of nuvoton-npcm730.dtsi.
> Please have a look at this link https://patchwork.ozlabs.org/patch/104589=
9/
> This patch was pushed by Nuvoton Inc and wait for the review.
> Thank you.
> Fran
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Monday, March 4, 2019 9:10 AM
> > To: Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran.Hsu@quantatw.com>
> > Cc: Benjamin Fair <benjaminfair@google.com>; Emily Shaffer
> > <emilyshaffer@google.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: Re: [PATCH dev-4.19 v3] Add Quanta GSJ board device tree v2.
> >
> > Hello Fran,
> >
> > Thanks for the patch.
> >
> > On Thu, 28 Feb 2019 at 20:19, <fran.hsu@quantatw.com> wrote:
> > >
> > > From: FranHsu <Fran.Hsu@quantatw.com>
> > >
> > > Add device tree source include file nuvoton-npcm730-gsj-gpio.dtsi for=
 setting
> > pinctrl definition.
> >
> > I suggest you use the commit message to describe the system you are add=
ing.
> > See some of the aspeed systems for an example:
> >
> > https://git.kernel.org/torvalds/c/f88bc8e15f1
> >
> >  > ARM: dts: aspeed: Add Qanta Q71L BMC machine  >  > The Qanta Q71L
> > BMC is an ASPEED ast2400 based BMC that is part of a Qanta x86 server.
> >
> > > Tested: This commit could build successfully with the Nuvoton kernel =
branch
> > "Poleg-4.19.16-OpenBMC".
> > >     And it could be booted on EVB.
> >
> > As you're asking this to be applied to the dev-4.19 branch, you should =
be
> > testing it on top of the latest dev-4.19 kernel tree. Similarly, if you=
 were
> > submitting it for mainline inclusion, you should test on top of the lat=
est release
> > of mainline.
> >
> > I recommend submitting this patch for upstream inclusion, as we do for =
the
> > aspeed device trees.
> >
> > > Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
> > > ---
> > >  .../boot/dts/nuvoton-npcm730-gsj-gpio.dtsi    | 2452
> > +++++++++++++++++
> > >  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts     |  550 ++++
> > >  2 files changed, 3002 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> > >  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > >
> > > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> > > b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> > > new file mode 100644
> > > index 000000000000..cf51cf3281cb
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> > > @@ -0,0 +1,2452 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com //
> > > +Update by Fran.Hsu@qunatatw.com
> >
> > If your changes are copyrightable, then please add a copyright line wit=
h the
> > copyright owner (your company?). You can chose to have your name there =
too,
> > but this is not required as the git history will contain your name if s=
omeone
> > needs this information in the future.
> >
> > > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > > b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > > new file mode 100644
> > > index 000000000000..411387ee2f62
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > > @@ -0,0 +1,550 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> >
> > This copyright line looks good.
> >
> > > +
> > > +/dts-v1/;
> > > +#include "nuvoton-npcm730.dtsi"
> >
> > This file does not exist, so your patch breaks the kernel build. This i=
s why it is
> > important to test on the branch you intend the patch to apply to.
> >
> > Please send a patch to add nuvoton-npcm730.dtsi.
> >
> > > +#include "nuvoton-npcm733-gsj-gpio.dtsi"
> > > +/ {
> > > +       model =3D "Quanta GSJ Board (Device Tree v2))";
> > > +       compatible =3D "nuvoton,npcm750";
> > > +
> > > +       aliases {
> > > +               ethernet1 =3D &gmac0;
> > > +               serial3 =3D &serial3;
> > > +               udc9 =3D &udc9;
> > > +               i2c0 =3D &i2c0;
> > > +               i2c1 =3D &i2c1;
> > > +               i2c2 =3D &i2c2;
> > > +               i2c3 =3D &i2c3;
> > > +               i2c4 =3D &i2c4;
> > > +               i2c5 =3D &i2c5;
> > > +               i2c6 =3D &i2c6;
> > > +               i2c7 =3D &i2c7;
> > > +               i2c8 =3D &i2c8;
> > > +               i2c9 =3D &i2c9;
> > > +               i2c10 =3D &i2c10;
> > > +               i2c11 =3D &i2c11;
> > > +               i2c12 =3D &i2c12;
> > > +               i2c13 =3D &i2c13;
> > > +               i2c14 =3D &i2c14;
> > > +               i2c15 =3D &i2c15;
> > > +               spi0 =3D &spi0;
> > > +               spi1 =3D &spi1;
> > > +               fiu0 =3D &fiu0;
> > > +               fiu1 =3D &fiu3;
> > > +               fiu2 =3D &fiux;
> > > +       };
> >
> > Do you need all of these aliases? Most of the numbering (eg. i2c) shoul=
d come
> > out the same without these.
> >
> > > +
> > > +       chosen {
> > > +               stdout-path =3D &serial3;
> > > +       };
> > > +
> > > +       memory {
> > > +               reg =3D <0 0x40000000>;
> > > +       };
> > > +
> > > +       ahb {
> > > +               gmac0: eth@f0802000 {
> > > +                       reg =3D <0xf0802000 0x2000>;
> >
> > I haven't seen the npcm730 dtsi, but I assume it is similar to the
> > npcm750 which already contains the full ethernet node. If this is the c=
ase, you
> > only need to do this:
> >
> > &gmac0 {
> >     phy-mode =3D "rgmii-id";
> >     status =3D "okay";
> > };
> >
> > > +                       phy-mode =3D "rgmii-id";
> >
> > I don't think the phy-mode property make sense if it's using NCSI.

Joel, for gmac they don't use ncsi and indeed "use-ncsi" is not included.
Your next remark on emc0 is probably relevant.

> >
> > > +                       status =3D "okay";
> > > +               };
> > > +               emc0: eth@f0825000 {
> > > +                       phy-mode =3D "rmii";
> >
> > I don't think the phy-mode makes sense if it's using NCSI.
> >
> > We should change the NCSI layer to support phy-mode =3D "ncsi".
> >
> > > +                       use-ncsi; /* add this to support ncsi */
> >
> > You can remove this comment.
> >
> > > +                       status =3D "okay";
> > > +               };
> > > +               ehci1: usb@f0806000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               ohci1: ohci@f0807000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               udc9:udc@f0839000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               aes:aes@f0858000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               sha:sha@f085a000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               fiu0: fiu@fb000000 {
> > > +                       pinctrl-names =3D "default";
> > > +                       pinctrl-0 =3D <&spi0cs1_pins>;
> > > +                       status =3D "okay";
> > > +                       spi-nor@0 {
> > > +                               compatible =3D "jedec,spi-nor";
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <1>;
> > > +                               reg =3D <0>;
> > > +                               spi-rx-bus-width =3D <2>;
> > > +                               partitions@80000000 {
> > > +                                               compatible =3D
> > "fixed-partitions";
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <1>;
> > > +                                               bmc@0{
> > > +                                                       label =3D
> > "bmc";
> > > +                                                       reg =3D
> > <0x000000 0x4000000>;
> > > +                                               };
> > > +                                               u-boot@0 {
> > > +                                                       label =3D
> > "u-boot";
> > > +                                                       reg =3D
> > <0x0000000 0x80000>;
> > > +                                               };
> > > +
> > envparam@100000 {
> > > +                                                       label =3D
> > "env-param";
> > > +                                                       reg =3D
> > <0x0100000 0x40000>;
> > > +                                               };
> > > +                                               kernel@200000 {
> > > +                                                       label =3D
> > "kernel";
> > > +                                                       reg =3D
> > <0x0200000 0x580000>;
> > > +                                               };
> > > +                                               rofs@C00000 {
> > > +                                                       label =3D
> > "rofs";
> > > +                                                       reg =3D
> > <0x0C00000 0x2600000>;
> > > +                                               };
> > > +                                               rwfs@3200000 {
> > > +                                                       label =3D
> > "rwfs";
> > > +                                                       reg =3D
> > <0x3200000 0xE00000>;
> > > +                                               };
> > > +                               };
> > > +                       };
> > > +               };
> > > +
> > > +               fiu3: fiu@c0000000 {
> > > +                       pinctrl-0 =3D <&spi3_pins>;
> > > +                       status =3D "disabled";
> >
> > It is unnecessary to add the node and then set it to disabled. You can =
simply
> > omit these nodes.
> >
> > Reading the rest of this device tree, it looks like a number of the con=
tents
> > should be in the SoC definition (npcm730.dsti) so it can be shared amon=
g
> > systems that use the npcm730.
> >
> > Cheers,
> >
> > Joel
> >
> > > +               };
> > > +
> > > +               fiux: fiu@fb001000 {
> > > +                       status =3D "disabled";
> > > +                       spix-mode;
> > > +               };
> > > +
> > > +               sdhci0: sdhci@f0842000 {
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > > +               pcimbox: pcimbox@f0848000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               vcd: vcd@f0810000 {
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > > +               ece: ece@f0820000 {
> > > +                       status =3D "okay";
> > > +               };
> > > +
> > > +               apb {
> > > +
> > > +                       watchdog1: watchdog@901C {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       rng: rng@b000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       serial0: serial@1000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       serial1: serial@2000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       serial2: serial@3000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       serial3: serial@4000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       adc: adc@c000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +                       otp:otp@189000 {
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       i2c0: i2c@80000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +                       i2c1: i2c@81000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               lm75@5c {
> > > +                                       compatible =3D
> > "maxim,max31725";
> > > +                                       reg =3D <0x5c>;
> > > +                                       status =3D "okay";
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c2: i2c@82000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               lm75@5c {
> > > +                                       compatible =3D
> > "maxim,max31725";
> > > +                                       reg =3D <0x5c>;
> > > +                                       status =3D "okay";
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c3: i2c@83000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               lm75@5c {
> > > +                                       compatible =3D
> > "maxim,max31725";
> > > +                                       reg =3D <0x5c>;
> > > +                                       status =3D "okay";
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c4: i2c@84000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               lm75@5c {
> > > +                                       compatible =3D
> > "maxim,max31725";
> > > +                                       reg =3D <0x5c>;
> > > +                                       status =3D "okay";
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c5: i2c@85000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +                       i2c6: i2c@86000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +                       i2c7: i2c@87000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +                       i2c8: i2c@88000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       i2c9: i2c@89000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               eeprom@55 {
> > > +                                       compatible =3D
> > "atmel,24c64";
> > > +                                       reg =3D <0x55>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c10: i2c@8a000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                               eeprom@55 {
> > > +                                       compatible =3D
> > "atmel,24c64";
> > > +                                       reg =3D <0x55>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c11: i2c@8b000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +
> > > +                               /* P12V Quarter Brick DC/DC Power
> > Module Q54SH12050 @60 */
> > > +                               power-brick@36 {
> > > +                                       compatible =3D
> > "delta,dps800";
> > > +                                       reg =3D <0x36>;
> > > +                               };
> > > +                               hotswap@15 {
> > > +                                       compatible =3D "ti,lm5066i";
> > > +                                       reg =3D <0x15>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       i2c12: i2c@8c000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       i2c13: i2c@8d000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       i2c14: i2c@8e000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +                       };
> > > +
> > > +                       i2c15: i2c@8f000 {
> > > +                               #address-cells =3D <1>;
> > > +                               #size-cells =3D <0>;
> > > +                               bus-frequency =3D <100000>;
> > > +                               status =3D "okay";
> > > +
> > > +                               i2c-switch@75 {
> > > +                                       compatible =3D
> > "nxp,pca9548";
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +                                       reg =3D <0x75>;
> > > +                                       i2c-mux-idle-disconnect;
> > > +
> > > +                                       i2c_u20: i2c-bus@0 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <0>;
> > > +                                       };
> > > +
> > > +                                       i2c_u21: i2c-bus@1 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <1>;
> > > +                                       };
> > > +
> > > +                                       i2c_u22: i2c-bus@2 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <2>;
> > > +                                       };
> > > +
> > > +                                       i2c_u23: i2c-bus@3 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <3>;
> > > +                                       };
> > > +
> > > +                                       i2c_u24: i2c-bus@4 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <4>;
> > > +                                       };
> > > +
> > > +                                       i2c_u25: i2c-bus@5 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <5>;
> > > +                                       };
> > > +
> > > +                                       i2c_u26: i2c-bus@6 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <6>;
> > > +                                       };
> > > +
> > > +                                       i2c_u27: i2c-bus@7 {
> > > +                                               #address-cells =3D
> > <1>;
> > > +                                               #size-cells =3D <0>;
> > > +                                               reg =3D <7>;
> > > +                                       };
> > > +                               };
> > > +                       };
> > > +
> > > +                       pwm_fan:pwm-fan-controller@103000 {
> > > +                               pinctrl-names =3D "default";
> > > +                               pinctrl-0 =3D <   &pwm0_pins
> > &pwm1_pins &pwm2_pins
> > > +                                               &fanin0_pins
> > &fanin1_pins
> > > +                                               &fanin2_pins
> > &fanin3_pins
> > > +                                               &fanin4_pins
> > &fanin5_pins>;
> > > +                               status =3D "okay";
> > > +                               fan@0 {
> > > +                                       reg =3D <0x00>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
0
> > 0x01>;
> > > +                                       cooling-levels =3D <127 255>;
> > > +                               };
> > > +                               fan@1 {
> > > +                                       reg =3D <0x01>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
2
> > 0x03>;
> > > +                                       cooling-levels =3D /bits/ 8
> > <127 255>;
> > > +                               };
> > > +                               fan@2 {
> > > +                                       reg =3D <0x02>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
4
> > 0x05>;
> > > +                                       cooling-levels =3D /bits/ 8
> > <127 255>;
> > > +                               };
> > > +                               fan@3 {
> > > +                                       reg =3D <0x03>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
6
> > 0x07>;
> > > +                                       cooling-levels =3D /bits/ 8
> > <127 255>;
> > > +                               };
> > > +                               fan@4 {
> > > +                                       reg =3D <0x04>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
8
> > 0x09>;
> > > +                                       cooling-levels =3D /bits/ 8
> > <127 255>;
> > > +                               };
> > > +                               fan@5 {
> > > +                                       reg =3D <0x05>;
> > > +                                       fan-tach-ch =3D /bits/ 8 <0x0=
A
> > 0x0B>;
> > > +                                       cooling-levels =3D /bits/ 8
> > <127 255>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       spi0: spi@200000 {
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +                       spi1: spi@201000 {
> > > +                               status =3D "disabled";
> > > +                       };
> > > +
> > > +               };
> > > +       };
> > > +
> > > +       pinctrl: pinctrl@f0800000 {
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <
> > > +                               /* GPI pins*/
> > > +                               &gpio8_pins
> > > +                               &gpio9_pins
> > > +                               &gpio12_pins
> > > +                               &gpio13_pins
> > > +                               &gpio14_pins
> > > +                               &gpio60_pins
> > > +                               &gpio83_pins
> > > +                               &gpio91_pins
> > > +                               &gpio92_pins
> > > +                               &gpio95_pins
> > > +                               &gpio136_pins
> > > +                               &gpio137_pins
> > > +                               &gpio141_pins
> > > +                               &gpio144_pins
> > > +                               &gpio145_pins
> > > +                               &gpio146_pins
> > > +                               &gpio147_pins
> > > +                               &gpio148_pins
> > > +                               &gpio149_pins
> > > +                               &gpio150_pins
> > > +                               &gpio151_pins
> > > +                               &gpio152_pins
> > > +                               &gpio153_pins
> > > +                               &gpio154_pins
> > > +                               &gpio155_pins
> > > +                               &gpio156_pins
> > > +                               &gpio157_pins
> > > +                               &gpio158_pins
> > > +                               &gpio159_pins
> > > +                               &gpio161_pins
> > > +                               &gpio162_pins
> > > +                               &gpio163_pins
> > > +                               &gpio164_pins
> > > +                               &gpio165_pins
> > > +                               &gpio166_pins
> > > +                               &gpio167_pins
> > > +                               &gpio168_pins
> > > +                               &gpio169_pins
> > > +                               &gpio170_pins
> > > +                               &gpio177_pins
> > > +                               &gpio191_pins
> > > +                               &gpio192_pins
> > > +                               &gpio203_pins
> > > +                               /* GPO pins*/
> > > +                               &gpio0od_pins
> > > +                               &gpio1od_pins
> > > +                               &gpio2od_pins
> > > +                               &gpio3od_pins
> > > +                               &gpio4od_pins
> > > +                               &gpio5od_pins
> > > +                               &gpio6od_pins
> > > +                               &gpio7od_pins
> > > +                               &gpio10od_pins
> > > +                               &gpio11od_pins
> > > +                               &gpio15od_pins
> > > +                               &gpio17od_pins
> > > +                               &gpio18od_pins
> > > +                               &gpio19od_pins
> > > +                               &gpio24od_pins
> > > +                               &gpio25od_pins
> > > +                               &gpio37od_pins
> > > +                               &gpio59od_pins
> > > +                               &gpio72od_pins
> > > +                               &gpio73od_pins
> > > +                               &gpio74od_pins
> > > +                               &gpio75od_pins
> > > +                               &gpio76od_pins
> > > +                               &gpio77od_pins
> > > +                               &gpio78od_pins
> > > +                               &gpio79od_pins
> > > +                               &gpio84od_pins
> > > +                               &gpio85od_pins
> > > +                               &gpio86od_pins
> > > +                               &gpio87od_pins
> > > +                               &gpio88od_pins
> > > +                               &gpio89od_pins
> > > +                               &gpio90od_pins
> > > +                               &gpio93od_pins
> > > +                               &gpio94od_pins
> > > +                               &gpio125od_pins
> > > +                               &gpio126od_pins
> > > +                               &gpio127od_pins
> > > +                               &gpio142od_pins
> > > +                               &gpio143ol_pins
> > > +                               &gpio175od_pins
> > > +                               &gpio176od_pins
> > > +                               &gpio190od_pins
> > > +                               &gpio194od_pins
> > > +                               &gpio195od_pins
> > > +                               &gpio196od_pins
> > > +                               &gpio197od_pins
> > > +                               &gpio198od_pins
> > > +                               &gpio199od_pins
> > > +                               &gpio200od_pins
> > > +                               &gpio202od_pins
> > > +                               >;
> > > +       };
> > > +
> > > +
> > > +
> > > +       leds {
> > > +               compatible =3D "gpio-leds";
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&gpio143ol_pins>;
> > > +
> > > +               led {
> > > +                       label =3D "led-bmc-live";
> > > +                       gpios =3D <&gpio4 15 GPIO_ACTIVE_HIGH>;
> > > +                       linux,default-trigger =3D "heartbeat";
> > > +               };
> > > +       };
> > > +};
> > > +
> > > --
> > > 2.21.0
> > >



--
Regards,
Avi
