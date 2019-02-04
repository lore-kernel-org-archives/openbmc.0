Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gQZsnldt"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tRbQ0VdXzDqFH
 for <openbmc@lists.ozlabs.org>; Mon,  4 Feb 2019 23:19:29 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id e12so12563703otl.5
 for <openbmc@lists.ozlabs.org>; Mon, 04 Feb 2019 04:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vOvhIWG6nBmYrCGIlO10LfjZUod2hsUN9x9xKkvRokE=;
 b=gQZsnldttApk9Cu/XO5AwBz4DkCVDN9+9SKmHVQL+muR8pxr5+07E00TVSdZRZ+2gy
 X0T5KAWvZyLoFrvVZ6d0/knvYMWfI1WyxGfhU7HEPAIkXQD9Ex8+dXnLPYQaBXiZcnvV
 eqZCnAyHY+JMgWXcBYeY3PdktklMlp4wncLP46tQr2RVjgtx95NOGn3WKQtKFv6emhuI
 9eNCp0vtbkmIygbQGPmMYRlKj5jIdNtG5UGAdRoDRoRkq+UNGtvtIPZss+qBYCQtTdLj
 i/HXHFmoAEgwILQmQRas7uzxCVCw2XupEkguIhb4zLugCC1CFPVocWqNK9OEiBT8kwhW
 kBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vOvhIWG6nBmYrCGIlO10LfjZUod2hsUN9x9xKkvRokE=;
 b=GzgF/pgPnyIvkfk+MJ9JKzGXSAviv8WVRfM+537iU5Ez0TyUc0XsTSkUvymt+3QOAG
 MmwOE34omhyF2bjvqx85WVdEIgzDPtQQQTseJ6VOUG+ymT1RMcgPz3GHYf6+b8mYEW8K
 BrmS9REyOnlfRVu/iCYd5udv5zY2NZicfarsfEaLUIcy5Uv2dFqAqaNiXZkXeE+95Q48
 Vlm/dUMEo9ZfbgAmUBRsyr6nRNvWQBFVK6Yq5zwoPHJNDtL2osdsv4q/lxfWORZ7yGya
 7qnP1kyMwShHfeXQUO5tj1qy8Tl8bWwfjG3Q0V0fkiDdYjh4jGBkOfWkWKe6RUEulmOv
 KmsQ==
X-Gm-Message-State: AHQUAuZ/rCGXFl7Z5rq8JAYT0MWhvkJw45eh7dRr9tWdRqkdwQRQkrN6
 qQOArM/ZJiJJzfMd72MvJFQ3T3gepukwtbk1J7WYbhrb2lw=
X-Google-Smtp-Source: AHgI3IZDU5CMbqrOYsu56nCNDwwqlqfsiaDOKZjH4irxksNcq5A+oivPArZqy49Nq+6WyhYONL87Py+nTnrq9DsiMys=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr14837081otl.12.1549282767295; 
 Mon, 04 Feb 2019 04:19:27 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 4 Feb 2019 17:48:45 +0530
Message-ID: <CAE33tLEsh+Oh8LYY0tkO98tVzVDjZwbxO9J49zp2fAWz_dysbQ@mail.gmail.com>
Subject: LED not Blinking
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000000597e058110818e"
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
X-List-Received-Date: Mon, 04 Feb 2019 12:19:30 -0000

--00000000000000597e058110818e
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have a board containing BMC Aspeed AST-2500. One LED is connected to
GPIO-E0. I am using zaius machine configuration for building the image. I
want that LED to blink after BMC is booted. So I changed the following
files.

Patched the device tree file aspeed-bmc-opp-zaius.dts

 leds {
            compatible = "gpio-leds";
+        power {
+            gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
+        };
  };


Added the following configuration to sensor inventory file
openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%/config.yaml

bmc_booted:
    power:
        Action: 'Blink'
        DutyOn: 50
        Period: 1000
        Priority: 'On'

The LED is glowing when the BMC boots up. But it is not blinking. Please
someone help to resolve the issue.

Thanks in advance.

--00000000000000597e058110818e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div dir=3D"ltr">We have =
a board containing BMC Aspeed AST-2500. One LED is connected to GPIO-E0. I =
am using zaius machine configuration for building the image. I want that LE=
D to blink after BMC is booted. So I changed the following files.<br><br>Pa=
tched the device tree file aspeed-bmc-opp-zaius.dts <br><br>=C2=A0leds {<br=
>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 compatible =3D &q=
uot;gpio-leds&quot;;<br>+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 power {<br>+=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 gpios =3D &lt;&amp=
;gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW&gt;;<br>+=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 };<br>=C2=A0 };<br><br><br>Added the following configuration t=
o sensor inventory file openbmc/meta-ingrasys/meta-zaius/recipes-phosphor/i=
pmi/phosphor-ipmi-sensor-inventory%/config.yaml<br><br>bmc_booted:<br>=C2=
=A0=C2=A0=C2=A0 power:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Action=
: &#39;Blink&#39;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DutyOn: 50<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Period: 1000<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Priority: &#39;On&#39;<br><br>The LED is glo=
wing when the BMC boots up. But it is not blinking. Please someone help to =
resolve the issue.<br><br>Thanks in advance.<br></div></div>

--00000000000000597e058110818e--
