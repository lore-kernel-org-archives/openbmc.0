Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uta80Rbr"; 
 dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42lGhB5GFzzF2Dy
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 16:13:30 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id y20-v6so12502197eds.10
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 22:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=d65rmH2IaFct2Aj9Ui4GvZpFXtnyiIcFAG02uQHwaAE=;
 b=Uta80RbrQnkLM4su3+9v0TJVJOaQergBU11/aCWji73BS4irySYW6oSHI+N3UpZAtV
 H331VnS+ZLM2qDOcDCLws/txgfl/7ZW6FUO3hjx8PAJ1HYhoWxLEYgqwwvGJ1nSsp2/W
 rZCGmk/e/Q7xtBeyWhpt0CSjf3Z1Cta9WI8OLD6aNAGB1BJ18nOwE77hTywua9YRWHOH
 DL9j1Z8KF6YVAaqpgfWiJYB9TpWaYTrMeqt+/ScIkg5+4QIZjx2hTjgkO4aJzfziGZim
 DZniRcfgujVoTZXH7Wcdsf2OaAbrmj3UW2xmTkr0qsLR4kmJhMpX2xMXGEJBX5gHQ0sr
 mhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=d65rmH2IaFct2Aj9Ui4GvZpFXtnyiIcFAG02uQHwaAE=;
 b=JTvRRDN77736BUzgXr181W+TBfu5ZhfRZlvwvWKQrE+5ld6X1fYoshTUMzP81liABm
 exePHgFgQkNlsXtE6IUsEQRPgeqRDKkTHIZmPtkzO2yAVYRe8lce5nVkPW0LO6y3VD+R
 p2EpgAT162QOkwpa08vQPFoQKUhPTMEXfC+82sMqsEdzuTRQT29qCtL1boFlAYlQsSbP
 yVJcqHz5x+pKUWyn8C5tpjRmsHuvynSNa02kQ6cOV9PjnaIPS3wIh0SS/AI9+UOjaGrW
 ltpAUSaWn5c7IgndiriKYjoybBEuE3i2W8WcxbmULJbgMmWNo4MYwtQ5qv7MVU2sYgt/
 tENA==
X-Gm-Message-State: AGRZ1gKAbW49Q6cOiHQiMXf/gPEwq+LlgYEsO0VmK3nuoqp2/TSZXPMt
 uvYNekW0ZpKwbEGf7uT/Qt5e5kWROL+m1A2wYKqQbvc/
X-Google-Smtp-Source: AJdET5dmAM5DvtEVIN9Zr/NetudL1NV2iDSBytdAtwvvBNGSwW8BeisUM3rwC39725pPBoE4qBEGpEXZc2TC/gi8+H0=
X-Received: by 2002:a50:ad4a:: with SMTP id
 z10-v6mr853391edc.252.1540962806649; 
 Tue, 30 Oct 2018 22:13:26 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 31 Oct 2018 10:43:09 +0530
Message-ID: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
Subject: Temperature Sensor Reading not showing up.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b3d66005797f5cd6"
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
X-List-Received-Date: Wed, 31 Oct 2018 05:13:31 -0000

--000000000000b3d66005797f5cd6
Content-Type: text/plain; charset="UTF-8"

Hi All,

I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed
AST-2500. The board we are using have one temperature sensor (Texas
Instruments TMP75) on I2C-12 interface.

I added the file
*meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf*
in machine configuration directory with the following contents.



*LABEL_temp1 = ambientWARNLO_temp1=-40WARNHI_temp1=125*

I added the following patch to the kernel file
linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.










* &i2c12 {-    status = "disabled";+    status = "okay";++    tmp75@48
{+        compatible = "ti,tmp75";+        reg = <0x48>;+    };+ };*

After booting Linux, the changes are reflected in
*/sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48*.
Also,
*tmp78.conf* is showing in
*/etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90*.

when I am running the ipmitool command: *ipmitool -I dbus sdr elist* full
it is not showing the temperature sensor and its reading.

Please someone help to resolve the problem.


Thanks and Regards,

Akash

--000000000000b3d66005797f5cd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div dir=3D"ltr">I built =
OpenBMC Linux using Zaius configuration and booted on BMC Aspeed AST-2500. =
The board we are using have one temperature sensor (Texas Instruments TMP75=
) on I2C-12 interface.<br><br>I added the file <i>meta-zaius/recipes-phosph=
or/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75=
@48.conf</i> in machine configuration directory with the following contents=
.<br><i><br>LABEL_temp1 =3D ambient<br>WARNLO_temp1=3D-40<br>WARNHI_temp1=
=3D125</i><br><br>I added the following patch to the kernel file linux/arch=
/arm/boot/dts/aspeed-bmc-opp-zaius.dts.<br><br><i>=C2=A0&amp;i2c12 {<br>-=
=C2=A0=C2=A0=C2=A0 status =3D &quot;disabled&quot;;<br>+=C2=A0=C2=A0=C2=A0 =
status =3D &quot;okay&quot;;<br>+<br>+=C2=A0=C2=A0=C2=A0 tmp75@48 {<br>+=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 compatible =3D &quot;ti,tmp75&quot;;<br>=
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 reg =3D &lt;0x48&gt;;<br>+=C2=A0=C2=
=A0=C2=A0 };<br>+<br>=C2=A0};</i><br><br>After booting Linux, the changes a=
re reflected in <i>/sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-b=
us@440/tmp75@48</i>. Also,<br><i>tmp78.conf</i> is showing in <i>/etc/defau=
lt/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90</i>.<br><br>when I am running=
 the ipmitool command: <i>ipmitool -I dbus sdr elist</i> full it is not sho=
wing the temperature sensor and its reading.<br><br>Please someone help to =
resolve the problem.<br><br><br>Thanks and Regards,<br><br>Akash<br><br></d=
iv></div>

--000000000000b3d66005797f5cd6--
