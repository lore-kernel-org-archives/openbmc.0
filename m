Return-Path: <jaghu@google.com>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgkY19SLzDvhn
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B6ZPrMCg"; 
 dkim-atps=neutral
Received: by mail-wm0-x230.google.com with SMTP id t79so128592027wmt.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RUR4NEZfsqnv6bv4kdy0S+KwI1ywmiiQC7accOPaPsg=;
 b=B6ZPrMCgUCM5vPpW626tIvBvmt7i/R6OyzuL5bKVI3wdNNho3Ejn1+mY9RP6Sxofvx
 YAsT+OLe+GYT8d2mw+JYVS5Fj2u2F7pD5tPeUIdUZMYdPl026mxhIldK0Y7zeKefxhWx
 w9I4V+zac7uWXTAFN48jJiPmMuwJppbIqlFnwRiO4btEgvYw+z0jqjMnY9Mxs5nFBAIk
 slB6h98p4/7YR9JSeYvzqG2ErNsq40o8nTz0fVKCO4TiaT2fUC6DZDYHneBPI48bVi/C
 MCqUT2Dt07sxjlqXsgjNLhpZp3xmggx6UYBgwkV78+vQYf3PveQe29ZG4jACcizJKDfY
 Fhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RUR4NEZfsqnv6bv4kdy0S+KwI1ywmiiQC7accOPaPsg=;
 b=OeBTlObA42nzHbnKJYk8gGAaHaQWh66rxmf/tPJGvX8h/naiU6cysYmAIITemf/VQD
 SFK1PjrDUNyMPq9O1DWFaiC7UeY2H34xVPCUOJ9c1KeB7kHiw/M08JSVzkEBSp0VgolZ
 fJNATqOlJTBhJqwaIBUXQyXNFom0xyqO8D/8XbEaY2hiv52XeFy09WN1gyJFOWi/c4VS
 P7Tn8qHoTXsmgEAn8w23VeOMn7ymhAQhJYFIIbxdszOdcycXfVMQsWyr552fxCTyYhMR
 c47hXCdYaNmGkKz7Nq5cAFkgShfDYpCW1EtJfuAGcZFPlstcGHj9H7cB0KGzr4uf8Xln
 LoPg==
X-Gm-Message-State: AKaTC03JwKQS+qOfZO5nSnA/HWLc/5ThtwA6Q3Uq3kYpbkuFNfE3O9VcxbawaKepMr55QBV1pOaJgeJK9M+23gIi
X-Received: by 10.28.158.148 with SMTP id h142mr14232934wme.59.1479714623384; 
 Sun, 20 Nov 2016 23:50:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Sun, 20 Nov 2016 23:50:02 -0800 (PST)
In-Reply-To: <CACPK8Xfd1nw94kW4q3i3hZnrViZY3d_vsXz-Zkj=zQAdVwb8iw@mail.gmail.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
 <1478657505-23109-2-git-send-email-jaghu@google.com>
 <CACPK8Xfd1nw94kW4q3i3hZnrViZY3d_vsXz-Zkj=zQAdVwb8iw@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Sun, 20 Nov 2016 23:50:02 -0800
Message-ID: <CANsWYUWMWMPJPU_ojFcBpxcB6tBZCTdTpGWhUHOczaAQMaub3Q@mail.gmail.com>
Subject: Re: [PATCH linux v2 1/3] devicetree: binding documentation update for
 ASPEED AST2500 PWM driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114b36087f5eea0541cae855
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
X-List-Received-Date: Mon, 21 Nov 2016 07:50:30 -0000

--001a114b36087f5eea0541cae855
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 4:35 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Nov 9, 2016 at 12:41 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> > Add binding documentation update for ASPEED AST2500 PWM driver.
> > The ASPEED AST2500 PWM driver supports 8 PWM output ports.
> > The parent node indicates a PWM controller and has options to:
> > provide register set information, provide pinctrl information,
> > enable PWM and Fan Tach clock, select clock source, provide settings for
> > three different PWM sources (type M, N and O).
> >
> > Each sub node indicates a PWM output port and has options to:
> > enable PWM port, select the PWM source for the PWM port, provide
> > duty cycle values to be used at startup.
> >
> > v2:
> > - Made binding documentation update as a separate patch.
> > - Included AST2500 in the description.
> > - Changed format to "aspeed,ast2500-pwm".
> > - Included explanation for types M ,N and O and calculation example to
> >   determine L, H, and period bits.
> >
> > Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >
> > ---
> >  .../bindings/hwmon/aspeed,ast2500-pwm.txt          | 116
> +++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> >  create mode 100644 Documentation/devicetree/
> bindings/hwmon/aspeed,ast2500-pwm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
> b/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
> > new file mode 100644
> > index 0000000..2c3f2b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
> > @@ -0,0 +1,116 @@
> > +ASPEED AST2500 PWM device driver
> > +
> > +The ASPEED AST2500 PWM controller can support 8 PWM outputs.
> > +
> > +Required properties:
> > +- #address-cells : should be 1.
> > +- #size-cells : should be 1.
> > +- reg : address and length of the register set for the device.
> > +- pinctrl-names : A pinctrl state named "default" must be defined.
> > +- pinctrl-0 : Phandle referencing pin configuration of the aspeed pwm
> ports.
> > +- compatible : should be "aspeed,ast2500-pwm".
> > +- clock_enable : option to enable PWM and fan tach clock. should be 1.
> > +  (D[0] in PTCR00).
> > +- clock_source : option for clock source selection. 0 indicates 24MHz
> clock
> > +  and 1 indicates MCLK (D[1] in PTCR00).
> > +- typem_pwm_clock : PWM types M, N and 0 are three types just to have
> three
> > +  independent PWM source. Each could be assigned to the 8 PWM channels
> > +  with it's own settings
> > +  This array contains 4 values.
> > +  The first value indicates if the values for type M PWM are valid.
> > +  If the first value is 1, then it indicates that the rest of the values
> > +  are valid. If it is 0, then invalid.
> > +  The second value indicates the type M PWM clock division L bit (D[3:0]
> > +  in PTCR04). (value 0 in D[3:0] indicates 1, value 1 in D[3:0]
> indicates 2,
> > +  value 2 in D[3:0] indicates 4, value 3 in D[3:0] indicates 6 and so on
> > +  with increments in multiples of two).
> > +  The third value indicates type M PWM clock divison H bit (D[7:4] in
> PTCR04).
> > +  (value 0 in D[7:4] indicates 1, value 1 in D[7:4] indicates 2,
> > +  value 2 in D[7:4] indicates 4, value 3 in D[7:4] indicates 8 and
> > +  so on with increments in powers of two).
> > +  The fourth value indicates type M PWM period bit (D[15:8] in PTCR04).
> > +  If type M is chosen and clock source is 24 MHz then:
> > +  The PWM base clock = 24Mhz / (type M clock division L bit *
> > +  type M clock division H bit).
>
> We should request the APB struct clk and calculate the PWM base clock
> from that. See drivers that do of_clk_get. This means the binding
> would require a phandle to the clock node that we have in our device
> tree.
>
> We don't need to describe the clock calculation in the bindings document.
>
> Should I indicate the clock-frequency (desired PWM base clock) in the
devicetree clock node , get that clock-frequency using clk_get_rate and
calculate type M clock division L bit and type M clock division H bit to
match that clock-frequency (having fixed clock source and type M clock
period bit values from the devicetree) ?

> +  The PWM frequency = The PWM base clock / (type M PWM period bit + 1)
> > +  If we plan to output 25Khz PWM frequency then we can use:
> > +  typem_pwm_clock = <1 5 0 95>
> > +  The PWM frequency = 24Mhz / (10 * 1  * (95 + 1)) = 25Khz
> > +- typen_pwm_clock : This array contains 4 values.
> > +  The first value indicates if the values for type N PWM are valid.
> > +  If the first value is 1, then it indicates that the rest of the values
> > +  are valid. If it is 0, then invalid.
> > +  The second value indicates the type N PWM clock division L bit
> (D[19:16]
> > +  in PTCR04).
> > +  The third value indicates type N PWM clock division H bit
> > +  (D[23:20] in PTCR04).
> > +  The fourth value indicates type N PWM period bit (D[31:24] in PTCR04).
> > +  Calculations similar as for type M.
> > +- typeo_pwm_clock : This array contains 4 values.
> > +  The first value indicates indicates if the values for type O PWM are
> valid.
> > +  If the first value is 1, then it indicates that the rest of the values
> > +  are valid. If it is 0, then invalid.
> > +  The second value indicates if the type O PWM clock division L bit
> > +  (D[3:0] in PTCR44).
> > +  The third value indicates type O PWM clock divison H bit (D[7:4] in
> PTCR44).
> > +  The fourth value indicates type O PWM period bit (D[15:8] in PTCR44).
> > +  Calculations similar as for type M.
>
> This large block is hard to read. Try adding some whitespace :)
>
> Spend some time comparing your bindings to others in the tree for the
> style of both the documentation and the bindings themselves.
>
> > +
> > +Each subnode represents a PWM output port.
> > +
> > +Subnode Format
> > +--------------
> > +Required properties:
> > +- pwm_port : Indicates the PWM port. Values 0 through 7 indicate PWM
> ports
> > +  A through H respectively.
> > +- pwm_enable : Option to enable the PWM port indicated above. 0 is
> enable
> > +  and 1 is disable.
> > +  D[8] in PTCR00 indicates enabling PWM port A,
> > +  D[9] in PTCR00 indicates enabling PWM port B,
> > +  D[10] in PTCR00 indicates enabling PWM port C,
> > +  D[11] in PTCR00 indicates enabling PWM port D,
> > +  D[8] in PTCR40 indicates enabling PWM port E,
> > +  D[9] in PTCR40 indicates enabling PWM port F,
> > +  D[10] in PTCR40 indicates enabling PWM port G,
> > +  D[11] in PTCR40 indicates enabling PWM port H.
>
> This appears to be describing the register layout, not the bindings.
>
> > +- pwm_type : Indicates the clock type for the PWM port. value 0 is type
> M
> > +  PWM clock. value 1 is type N PWM clock. value 2 is type O PWM clock.
> > +  D[12] in PTCR00 indicates type selection bit of PWM A port,
> > +  D[13] in PTCR00 indicates type selection bit of PWM B port,
> > +  D[14] in PTCR00 indicates type selection bit of PWM C port,
> > +  D[15] in PTCR00 indicates type selection bit of PWM D port,
> > +  D[12] in PTCR40 indicates type selection bit of PWM E port,
> > +  D[13] in PTCR40 indicates type selection bit of PWM F port,
> > +  D[14] in PTCR40 indicates type selection bit of PWM G port,
> > +  D[15] in PTCR40 indicates type selection bit of PWM H port.
> > +- pwm_duty_cycle_percent : duty cycle value.
> > +
> > +Examples:
> > +
> > +pwm: pwm-controller@1e786000 {
> > +       #address-cells = <1>;
> > +       #size-cells = <1>;
> > +       reg = <0x1E786000 0x78>;
> > +       pinctrl-names = "default";
> > +        pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> > +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> > +       compatible = "aspeed,ast2500-pwm";
> > +       clock_enable = /bits/ 8 <0x01>;
> > +       clock_source = /bits/ 8 <0x00>;
> > +       typem_pwm_clock = <1 5 0 95>;
> > +       typen_pwm_clock = <0 0 0 0>;
> > +       typeo_pwm_clock = <0 0 0 0>;
> > +       pwm_port0 {
> > +               pwm_port = /bits/ 8 <0x00>;
> > +               pwm_enable = /bits/ 8 <0x01>;
> > +               pwm_type = /bits/ 8 <0x00>;
> > +               pwm_duty_cycle_percent = /bits/ 8 <0x5A>;
> > +       };
> > +       pwm_port1 {
> > +               pwm_port = /bits/ 8 <0x01>;
> > +               pwm_enable = /bits/ 8 <0x01>;
> > +               pwm_type = /bits/ 8 <0x00>;
> > +               pwm_duty_cycle_percent = /bits/ 8 <0x5A>;
> > +       };
> > +};
> > +
> > --
> > 2.8.0.rc3.226.g39d4020
> >
>

--001a114b36087f5eea0541cae855
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 9, 2016 at 4:35 PM, Joel Stanley <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Wed, Nov 9, 2016 at 12:41 PM, =
Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
&gt; Add binding documentation update for ASPEED AST2500 PWM driver.<br>
&gt; The ASPEED AST2500 PWM driver supports 8 PWM output ports.<br>
&gt; The parent node indicates a PWM controller and has options to:<br>
&gt; provide register set information, provide pinctrl information,<br>
&gt; enable PWM and Fan Tach clock, select clock source, provide settings f=
or<br>
&gt; three different PWM sources (type M, N and O).<br>
&gt;<br>
&gt; Each sub node indicates a PWM output port and has options to:<br>
&gt; enable PWM port, select the PWM source for the PWM port, provide<br>
&gt; duty cycle values to be used at startup.<br>
&gt;<br>
&gt; v2:<br>
&gt; - Made binding documentation update as a separate patch.<br>
&gt; - Included AST2500 in the description.<br>
&gt; - Changed format to &quot;aspeed,ast2500-pwm&quot;.<br>
&gt; - Included explanation for types M ,N and O and calculation example to=
<br>
&gt;=C2=A0 =C2=A0determine L, H, and period bits.<br>
&gt;<br>
&gt; Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"=
mailto:jaghu@google.com">jaghu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/hwmon/aspeed,<wbr>ast2500-pwm.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 116 +++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 116 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/hwmon/=
aspeed,ast2500-<wbr>pwm.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/aspeed,ast25=
00-<wbr>pwm.txt b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed,ast25=
00-<wbr>pwm.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..2c3f2b6<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed,ast2500-<wbr=
>pwm.txt<br>
&gt; @@ -0,0 +1,116 @@<br>
&gt; +ASPEED AST2500 PWM device driver<br>
&gt; +<br>
&gt; +The ASPEED AST2500 PWM controller can support 8 PWM outputs.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- #address-cells : should be 1.<br>
&gt; +- #size-cells : should be 1.<br>
&gt; +- reg : address and length of the register set for the device.<br>
&gt; +- pinctrl-names : A pinctrl state named &quot;default&quot; must be d=
efined.<br>
&gt; +- pinctrl-0 : Phandle referencing pin configuration of the aspeed pwm=
 ports.<br>
&gt; +- compatible : should be &quot;aspeed,ast2500-pwm&quot;.<br>
&gt; +- clock_enable : option to enable PWM and fan tach clock. should be 1=
.<br>
&gt; +=C2=A0 (D[0] in PTCR00).<br>
&gt; +- clock_source : option for clock source selection. 0 indicates 24MHz=
 clock<br>
&gt; +=C2=A0 and 1 indicates MCLK (D[1] in PTCR00).<br>
&gt; +- typem_pwm_clock : PWM types M, N and 0 are three types just to have=
 three<br>
&gt; +=C2=A0 independent PWM source. Each could be assigned to the 8 PWM ch=
annels<br>
&gt; +=C2=A0 with it&#39;s own settings<br>
&gt; +=C2=A0 This array contains 4 values.<br>
&gt; +=C2=A0 The first value indicates if the values for type M PWM are val=
id.<br>
&gt; +=C2=A0 If the first value is 1, then it indicates that the rest of th=
e values<br>
&gt; +=C2=A0 are valid. If it is 0, then invalid.<br>
&gt; +=C2=A0 The second value indicates the type M PWM clock division L bit=
 (D[3:0]<br>
&gt; +=C2=A0 in PTCR04). (value 0 in D[3:0] indicates 1, value 1 in D[3:0] =
indicates 2,<br>
&gt; +=C2=A0 value 2 in D[3:0] indicates 4, value 3 in D[3:0] indicates 6 a=
nd so on<br>
&gt; +=C2=A0 with increments in multiples of two).<br>
&gt; +=C2=A0 The third value indicates type M PWM clock divison H bit (D[7:=
4] in PTCR04).<br>
&gt; +=C2=A0 (value 0 in D[7:4] indicates 1, value 1 in D[7:4] indicates 2,=
<br>
&gt; +=C2=A0 value 2 in D[7:4] indicates 4, value 3 in D[7:4] indicates 8 a=
nd<br>
&gt; +=C2=A0 so on with increments in powers of two).<br>
&gt; +=C2=A0 The fourth value indicates type M PWM period bit (D[15:8] in P=
TCR04).<br>
&gt; +=C2=A0 If type M is chosen and clock source is 24 MHz then:<br>
&gt; +=C2=A0 The PWM base clock =3D 24Mhz / (type M clock division L bit *<=
br>
&gt; +=C2=A0 type M clock division H bit).<br>
<br>
</div></div>We should request the APB struct clk and calculate the PWM base=
 clock<br>
from that. See drivers that do of_clk_get. This means the binding<br>
would require a phandle to the clock node that we have in our device<br>
tree.<br>
<br>
We don&#39;t need to describe the clock calculation in the bindings documen=
t.<br>
<span class=3D"gmail-"><br></span></blockquote><div>Should I indicate the c=
lock-frequency (desired PWM base clock) in the devicetree clock node , get =
that clock-frequency using clk_get_rate and calculate type M clock division=
 L bit and type M clock division H bit to match that clock-frequency=C2=A0(=
having fixed clock source and type M clock period bit values from the devic=
etree) ?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span class=3D"gmail-">
&gt; +=C2=A0 The PWM frequency =3D The PWM base clock / (type M PWM period =
bit + 1)<br>
&gt; +=C2=A0 If we plan to output 25Khz PWM frequency then we can use:<br>
&gt; +=C2=A0 typem_pwm_clock =3D &lt;1 5 0 95&gt;<br>
&gt; +=C2=A0 The PWM frequency =3D 24Mhz / (10 * 1=C2=A0 * (95 + 1)) =3D 25=
Khz<br>
&gt; +- typen_pwm_clock : This array contains 4 values.<br>
&gt; +=C2=A0 The first value indicates if the values for type N PWM are val=
id.<br>
&gt; +=C2=A0 If the first value is 1, then it indicates that the rest of th=
e values<br>
&gt; +=C2=A0 are valid. If it is 0, then invalid.<br>
&gt; +=C2=A0 The second value indicates the type N PWM clock division L bit=
 (D[19:16]<br>
&gt; +=C2=A0 in PTCR04).<br>
&gt; +=C2=A0 The third value indicates type N PWM clock division H bit<br>
&gt; +=C2=A0 (D[23:20] in PTCR04).<br>
&gt; +=C2=A0 The fourth value indicates type N PWM period bit (D[31:24] in =
PTCR04).<br>
&gt; +=C2=A0 Calculations similar as for type M.<br>
&gt; +- typeo_pwm_clock : This array contains 4 values.<br>
&gt; +=C2=A0 The first value indicates indicates if the values for type O P=
WM are valid.<br>
&gt; +=C2=A0 If the first value is 1, then it indicates that the rest of th=
e values<br>
&gt; +=C2=A0 are valid. If it is 0, then invalid.<br>
&gt; +=C2=A0 The second value indicates if the type O PWM clock division L =
bit<br>
&gt; +=C2=A0 (D[3:0] in PTCR44).<br>
&gt; +=C2=A0 The third value indicates type O PWM clock divison H bit (D[7:=
4] in PTCR44).<br>
&gt; +=C2=A0 The fourth value indicates type O PWM period bit (D[15:8] in P=
TCR44).<br>
&gt; +=C2=A0 Calculations similar as for type M.<br>
<br>
</span>This large block is hard to read. Try adding some whitespace :)<br>
<br>
Spend some time comparing your bindings to others in the tree for the<br>
style of both the documentation and the bindings themselves.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +Each subnode represents a PWM output port.<br>
&gt; +<br>
&gt; +Subnode Format<br>
&gt; +--------------<br>
&gt; +Required properties:<br>
&gt; +- pwm_port : Indicates the PWM port. Values 0 through 7 indicate PWM =
ports<br>
&gt; +=C2=A0 A through H respectively.<br>
&gt; +- pwm_enable : Option to enable the PWM port indicated above. 0 is en=
able<br>
&gt; +=C2=A0 and 1 is disable.<br>
&gt; +=C2=A0 D[8] in PTCR00 indicates enabling PWM port A,<br>
&gt; +=C2=A0 D[9] in PTCR00 indicates enabling PWM port B,<br>
&gt; +=C2=A0 D[10] in PTCR00 indicates enabling PWM port C,<br>
&gt; +=C2=A0 D[11] in PTCR00 indicates enabling PWM port D,<br>
&gt; +=C2=A0 D[8] in PTCR40 indicates enabling PWM port E,<br>
&gt; +=C2=A0 D[9] in PTCR40 indicates enabling PWM port F,<br>
&gt; +=C2=A0 D[10] in PTCR40 indicates enabling PWM port G,<br>
&gt; +=C2=A0 D[11] in PTCR40 indicates enabling PWM port H.<br>
<br>
</span>This appears to be describing the register layout, not the bindings.=
<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +- pwm_type : Indicates the clock type for the PWM port. value 0 is ty=
pe M<br>
&gt; +=C2=A0 PWM clock. value 1 is type N PWM clock. value 2 is type O PWM =
clock.<br>
&gt; +=C2=A0 D[12] in PTCR00 indicates type selection bit of PWM A port,<br=
>
&gt; +=C2=A0 D[13] in PTCR00 indicates type selection bit of PWM B port,<br=
>
&gt; +=C2=A0 D[14] in PTCR00 indicates type selection bit of PWM C port,<br=
>
&gt; +=C2=A0 D[15] in PTCR00 indicates type selection bit of PWM D port,<br=
>
&gt; +=C2=A0 D[12] in PTCR40 indicates type selection bit of PWM E port,<br=
>
&gt; +=C2=A0 D[13] in PTCR40 indicates type selection bit of PWM F port,<br=
>
&gt; +=C2=A0 D[14] in PTCR40 indicates type selection bit of PWM G port,<br=
>
&gt; +=C2=A0 D[15] in PTCR40 indicates type selection bit of PWM H port.<br=
>
&gt; +- pwm_duty_cycle_percent : duty cycle value.<br>
&gt; +<br>
&gt; +Examples:<br>
&gt; +<br>
&gt; +pwm: pwm-controller@1e786000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1E786000 0x78&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_pwm0_defau=
lt &amp;pinctrl_pwm1_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;pinctrl_pwm2_default &amp;pinctrl_pwm3_default&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;aspeed,ast2500-pwm&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_enable =3D /bits/ 8 &lt;0x01&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clock_source =3D /bits/ 8 &lt;0x00&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typem_pwm_clock =3D &lt;1 5 0 95&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typen_pwm_clock =3D &lt;0 0 0 0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typeo_pwm_clock =3D &lt;0 0 0 0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_port0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_port =3D /=
bits/ 8 &lt;0x00&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_enable =3D=
 /bits/ 8 &lt;0x01&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_type =3D /=
bits/ 8 &lt;0x00&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_duty_cycle=
_percent =3D /bits/ 8 &lt;0x5A&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_port1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_port =3D /=
bits/ 8 &lt;0x01&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_enable =3D=
 /bits/ 8 &lt;0x01&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_type =3D /=
bits/ 8 &lt;0x00&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_duty_cycle=
_percent =3D /bits/ 8 &lt;0x5A&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114b36087f5eea0541cae855--
