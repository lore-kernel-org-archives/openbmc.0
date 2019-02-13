Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tv6w8wlu"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ztdd1YWFzDqSs
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 19:55:16 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id m1so2681580otf.5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 00:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4GXWBPrKRzPThp9oEYgI+4xbFU5E9Eu6O0dprbae73I=;
 b=Tv6w8wlu3lF9r+bPgFXoXfuMC+LvRYz8DpuFwQifmW9SlLBF1F/RCJKdRgHItHXbkx
 g32THYsgyYUlJOXiuBnvwXe4EbRS4b+e72ofzch6jLkB9ZfgIJJ/7pyjss8+dXCE+xdz
 R60/PmVMi41lWCGA9EcDPoWDASFP1RRjPid7XXPgFqf+cVdPXNA60W+rLGWil2Ujtj+u
 Tr/+XhzECTUAqKL19CjTafN1pRz4AkoVAzaU5WQu+A83WfU5LX5clnUb64/fJLMKnm4b
 08DT1Z0kL7m337DDMyW+W7S1KfgYKfzJ+Wr/OnbsKvEq8plkpajA7QOtTxAONOuznL++
 Oslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4GXWBPrKRzPThp9oEYgI+4xbFU5E9Eu6O0dprbae73I=;
 b=K9QlzDDmR1HaoXobJABqL3ec4Iu2pzF/zfkAc4ERMHqZHH3ejquy2PxpMVB5kjA/jz
 gYV/eZ7QLrnAXysPzsolhAUt/eq1hOhXaNLaMr9u1unCU4P68WheQXyJd3ra+m92t7SW
 yX1Lzkdto7xeXLkUU/KajBnh9ArsCAdRkfmkqq1pacaDIv0WfCEhtV6sHgvbU34sghPv
 QozOHvdt/yvM83JEVtiEzGfRWHy3wN0D7G8hZL4UOOMAnNlolOO1jv/IQ7cv39P4atdU
 bYSGrsIZAxtyFSwoSQpjfEtuIAWI46zN5KBldENd4H2fdOXF53Jtl2lU2h9c9tjTk3QF
 +0rg==
X-Gm-Message-State: AHQUAub7KqchSVCAJxm6n6iQ2z5nkJYMKvkG0xB6XlUr+5eMJTX5MSD/
 AkaJSYedc6YA/wEHoXSy2bVkM8Mz2r8DdeCYbfcBuU1Shvw=
X-Google-Smtp-Source: AHgI3IbliZmv7QlvQyuqcZ3FUzlrQtSl0KLY5rfjX0bSPwY/jpmpm5GNxjWHI1YmzWA45EnhymBEo97PR7OvPXc2Pxc=
X-Received: by 2002:a9d:4598:: with SMTP id x24mr7908907ote.57.1550048114552; 
 Wed, 13 Feb 2019 00:55:14 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 13 Feb 2019 14:24:29 +0530
Message-ID: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
Subject: Unable to read or write from system SPI flash memory.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000040b4680581c2b370"
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
X-List-Received-Date: Wed, 13 Feb 2019 08:55:18 -0000

--00000000000040b4680581c2b370
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have a test board containing BMC Aspeed AST-2500. It contains BMC flash
memory, SPI1 flash memory and SPI2 flash memory. we are using zaius machine
configuration for building Linux. When I am trying to write to SPI1 flash
at address 30000000 using pflash tool, the modified data is not reflected
after reboot. Same with SPI2 flash. With pflash tool I am able to write
data permanently to BMC flash memory. The device tree for SPI devices is
following.

&fmc {
    status = "okay";

    flash@0 {
        status = "okay";
        label = "bmc";
        m25p,fast-read;
        spi-max-frequency = <50000000>;
#include "openbmc-flash-layout.dtsi"
    };
};

&spi1 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_spi1_default>;

    flash@0 {
        status = "okay";
        label = "pnor";
        m25p,fast-read;
        spi-max-frequency = <100000000>;
    };
};

&spi2 {
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_spi2ck_default
             &pinctrl_spi2cs0_default
             &pinctrl_spi2cs1_default
             &pinctrl_spi2miso_default
             &pinctrl_spi2mosi_default>;

    flash@0 {
        status = "okay";
    };
};

Please someone help to resolve the problem.


Thanks in advance.

Akash

--00000000000040b4680581c2b370
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<br><br>We have a test board conta=
ining BMC Aspeed AST-2500. It contains BMC flash memory, SPI1 flash memory =
and SPI2 flash memory. we are using zaius machine configuration for buildin=
g Linux. When I am trying to write to SPI1 flash at address 30000000 using =
pflash tool, the modified data is not reflected after reboot. Same with SPI=
2 flash. With pflash tool I am able to write data permanently to BMC flash =
memory. The device tree for SPI devices is following.<br><br>&amp;fmc {<br>=
=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;<br><br>=C2=A0=C2=A0=C2=A0 f=
lash@0 {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quo=
t;;<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 label =3D &quot;bmc&quot;;<br>=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 m25p,fast-read;<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D &lt;50000000&gt;;<br>#include &qu=
ot;openbmc-flash-layout.dtsi&quot;<br>=C2=A0=C2=A0=C2=A0 };<br>};<br><br>&a=
mp;spi1 {<br>=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;<br>=C2=A0=C2=
=A0=C2=A0 pinctrl-names =3D &quot;default&quot;;<br>=C2=A0=C2=A0=C2=A0 pinc=
trl-0 =3D &lt;&amp;pinctrl_spi1_default&gt;;<br><br>=C2=A0=C2=A0=C2=A0 flas=
h@0 {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;=
<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 label =3D &quot;pnor&quot;;<br>=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 m25p,fast-read;<br>=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 spi-max-frequency =3D &lt;100000000&gt;;<br>=C2=A0=C2=
=A0=C2=A0 };<br>};<br><br>&amp;spi2 {<br>=C2=A0=C2=A0=C2=A0 status =3D &quo=
t;okay&quot;;<br>=C2=A0=C2=A0=C2=A0 pinctrl-names =3D &quot;default&quot;;<=
br>=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_spi2ck_default<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 &amp;pinctrl_sp=
i2cs0_default<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0 &amp;pinctrl_spi2cs1_default<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0=C2=A0 &amp;pinctrl_spi2miso_default<br>=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 &amp;pinctrl_spi2mosi_de=
fault&gt;;<br><br>=C2=A0=C2=A0=C2=A0 flash@0 {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 status =3D &quot;okay&quot;;<br>=C2=A0=C2=A0=C2=A0 };<br>};<br=
><br>Please someone help to resolve the problem.<br><br><br>Thanks in advan=
ce.<br><br>Akash<br></div></div>

--00000000000040b4680581c2b370--
