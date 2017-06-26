Return-Path: <venture@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxDV02B1VzDr24
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 02:07:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iQyrp0UR"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id c73so2483591pfk.2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/t8SJAx/86+CEPYcWWJJhN3DCzI9SENAiKRp/k8S6Zw=;
 b=iQyrp0UR/6KRE/v4u0igaQKpUaX9HzWL44udIgLs+cUB9C0HLIyQOH0D52ezEhhmFS
 WkKXYFFLYF25ssrXMftOcE9Yxbs7jL4S/giEAsITYyIOo1XXAAUHfzU+PlMHjdza4fHM
 ElFe/9TJgn7EC0zDoK6kiK3Lo/29nYE35U+QQ9Ma3P68+EwICXIWjyROl5CS7E8VZzg4
 yDKXQ8PeU7AZyhY84CO9BnPYZb1Axq2YvatCkJmtN8wLzRCdpPJ9sePiEksaeApkN2JD
 FjfcsNtzIitKVZEdrsxBb2cHjFavWkJIRpY2VQtZNf4GjuFdJ3BUNHcAUa9Ga+DIcDjg
 sRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/t8SJAx/86+CEPYcWWJJhN3DCzI9SENAiKRp/k8S6Zw=;
 b=GGXWHlceZykpbzhnGJ/MU0BnrFiQeDgMLWJJz+VOSc/Vkp5J7rUkXY9Mny78fUMWxt
 zwEWO4MgqpEYloH0KEwbtd5XyPbct+x4GVPVsa7WtBXEPtZAogISdRdm15dTe+KHCOfV
 L4M9xyick/L0UfYItFH8tV/foU5jY9pN6ZkhiRj8MTFE6XZJ0y4JLFmuFtAOQWvDo9Yu
 BcONCTFO748mGs6ieUpP57MHXXZjVp6zD0lpROfkJ5utuT7OIjSnA5SsUjG0pDV/6zoZ
 o1UiYBUOZ0cNmFNkGk9WyZiqLZlCwBgFMHJWMQyY8lxRNxIkKABB8hNBnD6qVIKaQo/U
 MlPg==
X-Gm-Message-State: AKS2vOx0CFHOTYYyJapMPyzELSrvqj4THaLIqeu9Mh39jpcrpCR23g6+
 JiuADvPyJRWC9j+1kWxYZxfLHZ8PECTA
X-Received: by 10.98.85.196 with SMTP id j187mr841071pfb.19.1498493252385;
 Mon, 26 Jun 2017 09:07:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Mon, 26 Jun 2017 09:07:11 -0700 (PDT)
In-Reply-To: <CACPK8XfuBONVYNEQyymzL_g3beDSwwOjvJG5NgL6gL6f1CM-tg@mail.gmail.com>
References: <20170623012421.63639-1-venture@google.com>
 <CACPK8XfuBONVYNEQyymzL_g3beDSwwOjvJG5NgL6gL6f1CM-tg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 26 Jun 2017 09:07:11 -0700
Message-ID: <CAO=notxN66ZN1HFvBSKpFrCETcqpsQ7N4q3dUh-iE3gqBje3MQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: Enable pwm fans
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c0cd2fa0231e80552df26a5"
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
X-List-Received-Date: Mon, 26 Jun 2017 16:07:37 -0000

--94eb2c0cd2fa0231e80552df26a5
Content-Type: text/plain; charset="UTF-8"

If you're referring strictly to the clock, maybe I should put it under:

https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-g4.dtsi#L38

Which I didn't notice before :)

Patrick

On Mon, Jun 26, 2017 at 12:18 AM, Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Jun 23, 2017 at 10:54 AM, Patrick Venture <venture@google.com>
> wrote:
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51
> ++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/aspeed-g4.dtsi             |  6 ++++
> >  2 files changed, 57 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> > index e609c53d58f5..3abc2954d26e 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> > @@ -46,6 +46,57 @@
> >                         gpios = <&gpio ASPEED_GPIO(B, 3)
> GPIO_ACTIVE_LOW>;
> >                 };
> >         };
> > +
> > +       pwm_tacho: pwm-tacho-controller@1e786000 {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               reg = <0x1E786000 0x1000>;
> > +               compatible = "aspeed,ast2500-pwm-tacho";
> > +               clocks = <&pwm_tacho_fixed_clk>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> > +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
> > +
> > +               fan@0 {
> > +                       reg = <0x00>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> > +               };
> > +
> > +               fan@1 {
> > +                       reg = <0x01>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> > +               };
> > +
> > +               fan@2 {
> > +                       reg = <0x02>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> > +               };
> > +
> > +               fan@3 {
> > +                       reg = <0x03>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> > +               };
> > +
> > +               fan@4 {
> > +                       reg = <0x00>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> > +               };
> > +
> > +               fan@5 {
> > +                       reg = <0x01>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> > +               };
> > +
> > +               fan@6 {
> > +                       reg = <0x02>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> > +               };
> > +
> > +               fan@7 {
> > +                       reg = <0x03>;
> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> > +               };
> > +       };
> >  };
> >
> >  &fmc {
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index a998a00a2728..c93b0460cada 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -184,6 +184,12 @@
> >                                         reg = <0x2c>;
> >                                 };
> >
> > +                               pwm_tacho_fixed_clk: fixedclk {
> > +                                       compatible = "fixed-clock";
> > +                                       #clock-cells = <0>;
> > +                                       clock-frequency = <24000000>;
> > +                               };
>
> This is a bit strange. I don't think it should live at this spot in
> the device tree.
>
>
> > +
> >                                 hwrng@1e6e2078 {
> >                                         compatible = "timeriomem_rng";
> >                                         reg = <0x1e6e2078 0x4>;
> > --
> > 2.13.1.611.g7e3b11ae1-goog
> >
>

--94eb2c0cd2fa0231e80552df26a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SWYgeW91JiMzOTtyZSByZWZlcnJpbmcgc3RyaWN0bHkgdG8gdGhlIGNs
b2NrLCBtYXliZSBJIHNob3VsZCBwdXQgaXQgdW5kZXI6PGRpdj48YnI+PC9kaXY+PGRpdj48YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9saW51eC9ibG9iL2Rldi00LjEwL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpI0wzOCI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvbGludXgvYmxvYi9kZXYtNC4xMC9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSNM
Mzg8L2E+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2hpY2ggSSBkaWRuJiMzOTt0IG5v
dGljZSBiZWZvcmUgOik8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlBhdHJpY2s8L2Rpdj48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5P
biBNb24sIEp1biAyNiwgMjAxNyBhdCAxMjoxOCBBTSwgSm9lbCBTdGFubGV5IDxzcGFuIGRpcj0i
bHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmpvZWxAam1zLmlkLmF1IiB0YXJnZXQ9Il9ibGFuayI+
am9lbEBqbXMuaWQuYXU8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAj
Y2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFz
cz0iaDUiPk9uIEZyaSwgSnVuIDIzLCAyMDE3IGF0IDEwOjU0IEFNLCBQYXRyaWNrIFZlbnR1cmUg
Jmx0OzxhIGhyZWY9Im1haWx0bzp2ZW50dXJlQGdvb2dsZS5jb20iPnZlbnR1cmVAZ29vZ2xlLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogUGF0cmljayBWZW50dXJl
ICZsdDs8YSBocmVmPSJtYWlsdG86dmVudHVyZUBnb29nbGUuY29tIj52ZW50dXJlQGdvb2dsZS5j
b208L2E+Jmd0Ozxicj4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1ibWMtPHdicj5xdWFudGEtcTcxbC5kdHMgfCA1MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC48d2JyPmR0c2nC
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCA2ICsrKys8YnI+DQomZ3Q7wqAgMiBmaWxlcyBjaGFuZ2Vk
LCA1NyBpbnNlcnRpb25zKCspPGJyPg0KJmd0Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC08d2JyPmJtYy1xdWFudGEtcTcxbC5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtPHdicj5ibWMtcXVhbnRhLXE3MWwuZHRzPGJyPg0KJmd0OyBpbmRleCBl
NjA5YzUzZDU4ZjUuLjNhYmMyOTU0ZDI2ZSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC08d2JyPmJtYy1xdWFudGEtcTcxbC5kdHM8YnI+DQomZ3Q7ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC08d2JyPmJtYy1xdWFudGEtcTcxbC5kdHM8YnI+DQom
Z3Q7IEBAIC00Niw2ICs0Niw1NyBAQDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7Z3BpbyBBU1BFRURfR1BJTyhCLCAzKSBHUElP
X0FDVElWRV9MT1cmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oHB3bV90YWNobzogcHdtLXRhY2hvLWNvbnRyb2xsZXJAMWU3ODYwMDAgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFFNzg2MDAwIDB4MTAwMCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
YXNwZWVkLGFzdDI1MDAtcHdtLXRhY2hvJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7cHdtX3RhY2hvX2ZpeGVkX2NsayZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVs
dCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZs
dDsmYW1wO3BpbmN0cmxfcHdtMF9kZWZhdWx0ICZhbXA7cGluY3RybF9wd20xX2RlZmF1bHQ8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7cGluY3RybF9w
d20yX2RlZmF1bHQgJmFtcDtwaW5jdHJsX3B3bTNfZGVmYXVsdCZndDs7PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYW5AMCB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2gg
PSAvYml0cy8gOCAmbHQ7MHgwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFuQDEg
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MDEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXNwZWVkLGZhbi10YWNoLWNoID0gL2JpdHMvIDggJmx0OzB4MDEmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGZhbkAyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDAyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGFzcGVlZCxmYW4tdGFjaC1jaCA9IC9iaXRzLyA4ICZsdDsweDAy
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYW5AMyB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMyZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2gg
PSAvYml0cy8gOCAmbHQ7MHgwMyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFuQDQg
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXNwZWVkLGZhbi10YWNoLWNoID0gL2JpdHMvIDggJmx0OzB4MDQmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGZhbkA1IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDsweDAxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGFzcGVlZCxmYW4tdGFjaC1jaCA9IC9iaXRzLyA4ICZsdDsweDA1
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmYW5ANiB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMiZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2gg
PSAvYml0cy8gOCAmbHQ7MHgwNiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZmFuQDcg
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzB4MDMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXNwZWVkLGZhbi10YWNoLWNoID0gL2JpdHMvIDggJmx0OzB4MDcmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0
O8KgIH07PGJyPg0KJmd0Ozxicj4NCiZndDvCoCAmYW1wO2ZtYyB7PGJyPg0KJmd0OyBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0Ljx3YnI+ZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2FzcGVlZC1nNC48d2JyPmR0c2k8YnI+DQomZ3Q7IGluZGV4IGE5OThhMDBhMjcyOC4u
YzkzYjA0NjBjYWRhIDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc0Ljx3YnI+ZHRzaTxicj4NCiZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWc0Ljx3YnI+ZHRzaTxicj4NCiZndDsgQEAgLTE4NCw2ICsxODQsMTIgQEA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgyYyZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwd21fdGFjaG9fZml4ZWRfY2xr
OiBmaXhlZGNsayB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7Zml4ZWQtY2xvY2sm
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xvY2stY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MjQwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQo8YnI+DQo8L2Rp
dj48L2Rpdj5UaGlzIGlzIGEgYml0IHN0cmFuZ2UuIEkgZG9uJiMzOTt0IHRoaW5rIGl0IHNob3Vs
ZCBsaXZlIGF0IHRoaXMgc3BvdCBpbjxicj4NCnRoZSBkZXZpY2UgdHJlZS48YnI+DQo8ZGl2IGNs
YXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij48YnI+DQo8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBod3JuZ0Ax
ZTZlMjA3OCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3RpbWVyaW9tZW1fcm5n
JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFlNmUyMDc4IDB4NCZndDs7PGJyPg0K
Jmd0OyAtLTxicj4NCiZndDsgMi4xMy4xLjYxMS5nN2UzYjExYWUxLWdvb2c8YnI+DQomZ3Q7PGJy
Pg0KPC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4NCg==
--94eb2c0cd2fa0231e80552df26a5--
