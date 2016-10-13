Return-Path: <xow@google.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svyW306XJzDt1d
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 04:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=YYF9DLRM; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id z190so103743361qkc.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7oTOAQdwBi+G9K1Kuy3zW0DT+tFNUij2h6l/b0Sd5+Y=;
 b=YYF9DLRMoh4zdHIUo85d/c0xTlkYqs5cU6Bvge4IzwLHeSKPWPSZcmkve5kXYtPRVw
 XG8kG5hP2WSPj2IoPkUkn6kH4k54cBda3q0IWtpQUNHYctjlx1RkSuvnCniuVJly7Wnx
 os4zqGvrF6yEkOyJvSm8yuXz9WUniDC0voUgwbQVUOwyHxczofnau7xuqF4qBNSczM/Y
 LnEaaNJftnmoFSsKaTNefSmPtPBVSvr+OzXhgjBapkWaGRpETI9/0OYnEcVckqr+7U3X
 avx2+Eprwxdd89flq2H66ZuEcyfLPrkQh46kDr1J6lpMH5e/JdF2aztN9HUVqA/ISVn7
 qlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7oTOAQdwBi+G9K1Kuy3zW0DT+tFNUij2h6l/b0Sd5+Y=;
 b=RTw6cxTcr8DSHc+rQB0dAuoM2dFIIs4Iy4Mwq1GS7qJ0heso4P7GsKvDeP1wR3XatB
 29EUWQtpmwQDMkDFCdUv61wpz4tbPGAbJZTTXi2k1oUf3MEkbUiAurnMoWRHKq9tCGJ4
 OABhFQ2WkuEFOENHp8PCyvPZZGhuz5en4OthIkYi9261HfO8bSCHieini1gc7jpzmtZ0
 3jIEn5PuW0Cs7eMef7Rh8fb08AWPEcQOBxvqRj0aQq1zKWYRWKRU6Du6WKahKw6RZNw0
 2Tv7CMcTcdWnCNisIrkeCEIRTF5Ohvrb595dYRcKeNufCoj9DWssI2ZxpeA93OLelaM8
 6Q4A==
X-Gm-Message-State: AA6/9RkyuQk8n1XgyfvVl3P8/PA3H5fWaxTxShh0H3jdIVW79V2v7JmxNSxwLYE5RIIueCRhFhE8rRaGejwP2vEm
X-Received: by 10.55.33.21 with SMTP id h21mr8853168qkh.297.1476379995609;
 Thu, 13 Oct 2016 10:33:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Thu, 13 Oct 2016 10:33:15 -0700 (PDT)
In-Reply-To: <1476319305-29981-4-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-4-git-send-email-jaghu@google.com>
From: Xo Wang <xow@google.com>
Date: Thu, 13 Oct 2016 10:33:15 -0700
Message-ID: <CAPH-5w6SYfTxgfTm_QcLQQTx6SM8S_nBhsvOWf7CmxOGfOK7xQ@mail.gmail.com>
Subject: Re: [PATCH linux v1 3/3] devicetree : Add device tree info for POST
 card display on zaius
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1144cdf6316935053ec281b1
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
X-List-Received-Date: Thu, 13 Oct 2016 17:33:19 -0000

--001a1144cdf6316935053ec281b1
Content-Type: text/plain; charset=UTF-8

Hi Jagha,

On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> Add clock, data and clear signal lines to control POST card display on
> zaius
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  .../devicetree/bindings/misc/postcard-disp.txt         | 18
> ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts             |  8 ++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/postcard-disp.
> txt
>
> diff --git a/Documentation/devicetree/bindings/misc/postcard-disp.txt
> b/Documentation/devicetree/bindings/misc/postcard-disp.txt
> new file mode 100644
> index 0000000..164449e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/postcard-disp.txt
>

This doc file belongs in the same commit as the driver that it describes.
The Zaius dts change should stand alone.


> @@ -0,0 +1,18 @@
> +POST card display (two seven segment LEDs) connected to GPIO lines
> +
> +Required properties:
> +- compatible : should be "postcard-display".
> +- clk-gpios :  Should specify the GPIO pin connected to the Clock line on
> the POST card.
>

For consistency and readability, please don't abbreviate these names. We
should use "clock-gpios" instead of "clk-gpios."


> +- data-gpios : Should specify the GPIO pin connected to Data line on the
> POST card.
> +- clear-gpios : Should specify the GPIO pin connected to Clear line on
> the POST card.
>

Ex. you wrote "clear-gpios" here but the code uses "clr-gpios," which looks
visually similar to "clk-gpios."


> +
> +Examples:
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +postcard {
> +       compatible = "postcard-display";
> +       clk-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
> +       data-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +       clear-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
>

This uses the same gpio designator (1) as the second -gpios property. I
know it's example code but...


> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 4c4754b..d555ff1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>
>  #include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>
>  / {
>         model = "Zaius BMC";
> @@ -58,6 +59,13 @@
>                         };
>                 };
>         };
> +
> +       postcard {
> +               compatible = "postcard-display";
> +               clk-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +               clr-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
>

This property should match up to the documentation.


> +       };
>  };
>
>  &uart5 {
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

cheers
xo

--001a1144cdf6316935053ec281b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jagha,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder=
 Natarajan <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=
=3D"_blank">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Add clock, data and clear signal lines to cont=
rol POST card display on zaius<br>
<br>
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0.../devicetree/bindings/misc/<wbr>postcard-disp.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/misc/postca=
rd-disp.<wbr>txt<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/misc/postcard-disp.<wbr=
>txt b/Documentation/devicetree/<wbr>bindings/misc/postcard-disp.<wbr>txt<b=
r>
new file mode 100644<br>
index 0000000..164449e<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/misc/postcard-disp.<wbr>txt<br=
></blockquote><div><br></div><div>This doc file belongs in the same commit =
as the driver that it describes. The Zaius dts change should stand alone.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
@@ -0,0 +1,18 @@<br>
+POST card display (two seven segment LEDs) connected to GPIO lines<br>
+<br>
+Required properties:<br>
+- compatible : should be &quot;postcard-display&quot;.<br>
+- clk-gpios :=C2=A0 Should specify the GPIO pin connected to the Clock lin=
e on the POST card.<br></blockquote><div><br></div><div>For consistency and=
 readability, please don&#39;t abbreviate these names. We should use &quot;=
clock-gpios&quot; instead of &quot;clk-gpios.&quot;<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+- data-gpios : Should specify the GPIO pin connected to Data line on the P=
OST card.<br>
+- clear-gpios : Should specify the GPIO pin connected to Clear line on the=
 POST card.<br></blockquote><div><br></div><div>Ex. you wrote &quot;clear-g=
pios&quot; here but the code uses &quot;clr-gpios,&quot; which looks visual=
ly similar to &quot;clk-gpios.&quot;<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+<br>
+Examples:<br>
+<br>
+#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
+<br>
+postcard {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;postcard-display&quot;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk-gpios =3D &lt;&amp;gpio 0 GPIO_ACTIVE_LOW&g=
t;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-gpios =3D &lt;&amp;gpio 1 GPIO_ACTIVE_HIGH=
&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clear-gpios =3D &lt;&amp;gpio 1 GPIO_ACTIVE_HIG=
H&gt;;<br></blockquote><div><br></div><div>This uses the same gpio designat=
or (1) as the second -gpios property. I know it&#39;s example code but...</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+};<br>
diff --git a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts b/arch/arm/boo=
t/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
index 4c4754b..d555ff1 100644<br>
--- a/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
+++ b/arch/arm/boot/dts/aspeed-<wbr>bmc-opp-zaius.dts<br>
@@ -1,6 +1,7 @@<br>
=C2=A0/dts-v1/;<br>
<br>
=C2=A0#include &quot;aspeed-g5.dtsi&quot;<br>
+#include &lt;dt-bindings/gpio/aspeed-gpio.<wbr>h&gt;<br>
<br>
=C2=A0/ {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Zaius BMC&quot;;<br>
@@ -58,6 +59,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0postcard {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;postcard-display&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk-gpios =3D &lt;&=
amp;gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-gpios =3D &lt;=
&amp;gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clr-gpios =3D &lt;&=
amp;gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH&gt;;<br></blockquote><div><br><=
/div><div>This property should match up to the documentation.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0};<br>
<br>
=C2=A0&amp;uart5 {<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div><div class=3D"gmail_extra">cheers</div><div cl=
ass=3D"gmail_extra">xo</div><div class=3D"gmail_extra"><br></div></div>

--001a1144cdf6316935053ec281b1--
