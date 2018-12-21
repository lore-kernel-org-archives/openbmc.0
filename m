Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9mMHJf0"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LhGR62r7zDrC0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 19:13:35 +1100 (AEDT)
Received: by mail-it1-x144.google.com with SMTP id h65so5456369ith.3
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 00:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9PY/LSOlshrGbgmwtqVZULLYL3/ZidgDhPNzNrCa1A=;
 b=e9mMHJf0acClQTv88VKWGHw+U8ShiFVB3C3/d/9y9oWBHYnsUX2Mn5c287NP09q8sc
 +qyC4W+tqsxQ8yA+kh+kSmrKWG24QKpy0mum0jSx+NPeTP58prH/d1JHUOdkGAgIzZwV
 +scRwtu5SiTY+8kXy3DlrUGgJI/8dLULfsnNAq7c8CiRRfgoMWYesIRGVyC89hEnD/uJ
 6prQelLjlkQvpbSVXbg3oDzHlQOyyIsMYs9f7lb1E9/BWFQqJ+zBePVD329K9TsyNQFy
 vkOygq7j4TLuv6lAtrYJ77T3JXwZqQbAXIJtiOcVH301/UyF8Ql/n5EBWDiOj+pHu4mj
 7TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9PY/LSOlshrGbgmwtqVZULLYL3/ZidgDhPNzNrCa1A=;
 b=SPd+qZEfdT549xqUxfchsMm6sImnaEmhLObghEZJm9oSC/vGXjPcOuiOHGA0bKX2hR
 UtWhxULw2Lr84wFnRnnjeBusat5+xzdR8aqpclc33hPJHNX0Z6kOKys3gR2f/pVMCFZi
 tNsZxUcCv90utAtAkRbqBA5giJRyP3kXSdIylXqh/Hv9vJ1ut+Rr2uQ6d6Q5EThs8N+Z
 FHK/ZdSeF7HNEyCZqTyzY7/5CvSow1inEYvVQITuCXasFcnd97KsGPNqhbkIYsUXrAml
 75zjwBjUb4XD4cCuLzWs0HMbn7e3UwBgIRqgAbVymUyRMDLgBJ+CxEPw0nbMj4aZuzTi
 syog==
X-Gm-Message-State: AA+aEWaWsPzJRisEdz4G7G9qB4yucMVHLl0cM7fEyvbHta94Ls/s0BqC
 o2d0OzkZt5SmdOtoPvJFRAhm749mtqd1cDdNyXI=
X-Google-Smtp-Source: ALg8bN7VS9ejDW2n3+7DfnmKanxNBzG9yDgql7ywfYB+JOJz/pDyxziatvTrDNa5uUiQ2hsOTUaovEtRZKo83SpAblE=
X-Received: by 2002:a24:7094:: with SMTP id f142mr1307763itc.90.1545380013017; 
 Fri, 21 Dec 2018 00:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20181203091456.454030-1-tmaimon77@gmail.com>
 <20181203091456.454030-2-tmaimon77@gmail.com>
 <20181219155410.GA3925@bogus>
In-Reply-To: <20181219155410.GA3925@bogus>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 21 Dec 2018 10:19:57 +0200
Message-ID: <CAP6Zq1gZrderV12sSr532P4VxbuG_ggDdt7p3jSAOBQ+gn3yVw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: mtd: add NPCM FIU controller
To: Rob Herring <robh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, boris.brezillon@bootlin.com,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, 
 richard@nod.at, Mark Rutland <mark.rutland@arm.com>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-mtd@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b80f4f057d83d2c9"
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
X-List-Received-Date: Fri, 21 Dec 2018 08:13:37 -0000

--000000000000b80f4f057d83d2c9
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your comments,

The spi-nor drivers are moving to spi (spi-mem), I will make sure to modify
the new SPI dt-binding document according your comments once I finish the
work on the new SPI driver.

https://lkml.org/lkml/2018/12/3/545

Happy new year!

Tomer

On Wed, 19 Dec 2018 at 17:54, Rob Herring <robh@kernel.org> wrote:

> On Mon, Dec 03, 2018 at 11:14:55AM +0200, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Flash Interface Unit(FIU) SPI-NOR controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/npcm-fiu.txt | 64
> ++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> > new file mode 100644
> > index 000000000000..9746cb5b1ced
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> > @@ -0,0 +1,64 @@
> > +* Nuvoton FLASH Interface Unit (FIU) SPI Controller
> > +
> > +NPCM FIU supports single, dual and quad communication interface.
> > +
> > +The NPCM7XX supports three FIU modules,
> > +FIU0 and FIUx supports two chip selects,
> > +FIU3 support four chip select.
> > +
> > +Required properties:
> > +  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
> > +  - #address-cells : should be 1.
> > +  - #size-cells : should be 0.
> > +  - reg : the first contains the register location and length,
> > +          the second contains the memory mapping address and length
> > +  - reg-names: Should contain the reg names "control" and "memory"
> > +  - clocks : phandle of F reference clock.
> > +
> > +Required properties in case the pins can be muxed:
> > +  - pinctrl-names : a pinctrl state named "default" must be defined.
> > +  - pinctrl-0 : phandle referencing pin configuration of the device.
> > +
> > +Optional property:
> > +  - spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.
>
> Needs a vendor prefix. Unless this is some standard SPI thing (which
> I've never heard of).
>
> > +
> > +The SPI device must be a child of the FIU node and must have a
> > +compatible property as specified in bindings/mtd/jedec,spi-nor.txt
> > +
> > +Required property:
> > +- reg: chip select number.
> > +
> > +Optional property:
> > +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description.
> > +
> > +Aliases:
> > +- All the FIU controller nodes should be represented in the aliases
> node using
> > +  the following format 'fiu{n}' where n is a unique number for the
> alias.
> > +  In the NPCM7XX BMC:
> > +             fiu0 represent fiu 0 controller
> > +             fiu1 represent fiu 3 controller
> > +             fiu2 represent fiu x controller
>
> Please don't make up your own aliases. Use 'spiX' if anything, but
> really, why do you need aliases in the first place?
>
> > +
> > +Example:
> > +fiu3: fiu@c00000000 {
>
> spi@...
>
> > +     compatible = "nuvoton,npcm750-fiu";
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
> > +     reg-names = "control", "memory";
> > +     clocks = <&clk NPCM7XX_CLK_AHB>;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&spi3_pins>;
> > +     spi-nor@0 {
> > +             compatible = "jedec,spi-nor";
> > +             spi-rx-bus-width = <2>;
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             reg = <0>;
> > +             partition@0 {
> > +                     label = "flash_data";
> > +                     reg = <0x0 0x800000>;
> > +             };
> > +     };
> > +};
> > +
> > --
> > 2.14.1
> >
>

--000000000000b80f4f057d83d2c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Rob,<div><br></div><div>Thanks for you=
r comments,</div><div><br></div><div>The spi-nor drivers are moving to spi =
(spi-mem), I will make sure to modify the new SPI dt-binding document accor=
ding your comments once I finish the work on the new SPI driver.</div><div>=
<br></div><div><a href=3D"https://lkml.org/lkml/2018/12/3/545">https://lkml=
.org/lkml/2018/12/3/545</a><br></div><div><br></div><div>Happy new year!</d=
iv><div><br></div><div>Tomer</div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Wed, 19 Dec 2018 at 17:54, Rob Herring &lt;<a href=3D=
"mailto:robh@kernel.org">robh@kernel.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, Dec 03, 2018 at 11:14:55AM =
+0200, Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM Flash Interface Unit(FIU) SPI-NOR controller.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/mtd/npcm-fiu.txt | 64 ++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 64 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fi=
u.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/mtd/npcm-fiu.txt b/Docu=
mentation/devicetree/bindings/mtd/npcm-fiu.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9746cb5b1ced<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +* Nuvoton FLASH Interface Unit (FIU) SPI Controller<br>
&gt; +<br>
&gt; +NPCM FIU supports single, dual and quad communication interface.<br>
&gt; +<br>
&gt; +The NPCM7XX supports three FIU modules,<br>
&gt; +FIU0 and FIUx supports two chip selects,<br>
&gt; +FIU3 support four chip select.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +=C2=A0 - compatible : &quot;nuvoton,npcm750-fiu&quot; for the NPCM7XX=
 BMC<br>
&gt; +=C2=A0 - #address-cells : should be 1.<br>
&gt; +=C2=A0 - #size-cells : should be 0.<br>
&gt; +=C2=A0 - reg : the first contains the register location and length,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the second contains the memory map=
ping address and length<br>
&gt; +=C2=A0 - reg-names: Should contain the reg names &quot;control&quot; =
and &quot;memory&quot;<br>
&gt; +=C2=A0 - clocks : phandle of F reference clock.<br>
&gt; +<br>
&gt; +Required properties in case the pins can be muxed:<br>
&gt; +=C2=A0 - pinctrl-names : a pinctrl state named &quot;default&quot; mu=
st be defined.<br>
&gt; +=C2=A0 - pinctrl-0 : phandle referencing pin configuration of the dev=
ice.<br>
&gt; +<br>
&gt; +Optional property:<br>
&gt; +=C2=A0 - spix-mode: enable spix-mode for an expansion bus to an ASIC =
or CPLD.<br>
<br>
Needs a vendor prefix. Unless this is some standard SPI thing (which <br>
I&#39;ve never heard of).<br>
<br>
&gt; +<br>
&gt; +The SPI device must be a child of the FIU node and must have a<br>
&gt; +compatible property as specified in bindings/mtd/jedec,spi-nor.txt<br=
>
&gt; +<br>
&gt; +Required property:<br>
&gt; +- reg: chip select number.<br>
&gt; +<br>
&gt; +Optional property:<br>
&gt; +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description.<br>
&gt; +<br>
&gt; +Aliases:<br>
&gt; +- All the FIU controller nodes should be represented in the aliases n=
ode using<br>
&gt; +=C2=A0 the following format &#39;fiu{n}&#39; where n is a unique numb=
er for the alias.<br>
&gt; +=C2=A0 In the NPCM7XX BMC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fiu0 represent fiu 0 =
controller<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fiu1 represent fiu 3 =
controller<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fiu2 represent fiu x =
controller<br>
<br>
Please don&#39;t make up your own aliases. Use &#39;spiX&#39; if anything, =
but <br>
really, why do you need aliases in the first place?<br>
<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +fiu3: fiu@c00000000 {<br>
<br>
spi@...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-fiu&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xfb000000 0x1000&gt;, &lt;0x80000000=
 0x10000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg-names =3D &quot;control&quot;, &quot;memory&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk NPCM7XX_CLK_AHB&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;spi3_pins&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi-nor@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
jedec,spi-nor&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-rx-bus-width =3D =
&lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &l=
t;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0label =3D &quot;flash_data&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x0 0x800000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; -- <br>
&gt; 2.14.1<br>
&gt; <br>
</blockquote></div>

--000000000000b80f4f057d83d2c9--
