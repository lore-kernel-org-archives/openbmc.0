Return-Path: <chyishian.jiang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I6842B64"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42w44L21f6zF3bZ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 23:46:22 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id x21-v6so5028470pln.9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 04:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:subject:mime-version;
 bh=tvs5pnV0OoyW2tubjaqqe0Helt7JLn915u0ymRX6RFc=;
 b=I6842B64gnkHb6AOJg35+Z48BeMJZl62fTjMVyLciy9HWgSwBraHTKJnq1X7/VngJv
 YW4O48Km3HAmxiQENiyMynstAuJyNSauuL56VwJ2fqZbLzAKOjeXwlU5Y12zdPuOKbj2
 Al3DVQKtyMfR9RM/M/3JR89v5P+E4+UrKfApflo9qY7EjFv8EeLuDwjow+mTjxWdlTcI
 lr7HH0n4Kd4/biu2USPiyjMfcrHUZbEPlziaZU+6dgHPIJavui/CnhPdFW8er2DGhFZh
 2jVkpCrE3kvLN2cnZ2dUmPwlnfTCib48ya6vBoEURkR5EQ1SyN1+x2W5ZgkfC+w4vW5U
 OfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
 bh=tvs5pnV0OoyW2tubjaqqe0Helt7JLn915u0ymRX6RFc=;
 b=UuDszlljiw3wXYz+9P9NUffoWkCReyAPci37nLbMn62L3o4ZCdfbt9Bek67WXRKPGR
 /U8ru7aTXFDrRc294ksBoVjeuHZNZEvaH43DPpSeMQlufaRGda8Kri2Q4brK4M6F2h3o
 18CRCCmZduBsvb0HgUu9GxSw0nYmZVPyBDobpjYgzb+C0M6UQSJagIxW2OZqUv7Qg2eo
 bfgQQ3Aa7LAmBl/+JwHnvm5be2LyCXzuILV9i/7yZT0BJByLLWnayo+0nYOVbUF5umT5
 1EHxks/xf6CSm5LVs+MWkXEfuqsViYvKfJBE6QQc5br+DjLIYwpMi+7MmPxVZGX3pH1g
 t6Sg==
X-Gm-Message-State: AGRZ1gJDsxGd+5n13Mj/0O357v8FbAe2ZG4GgyI3hkxTVZZRkSw//jGB
 4G3JkGaw8df+YlHT7EC8uRc=
X-Google-Smtp-Source: AJdET5eSQT90IBWX5E0FHQRRfBOcM4LGaDvQOJx616juWW69EYlw4kWUCuxfv1fw4noKL2eja9f91A==
X-Received: by 2002:a17:902:622:: with SMTP id
 31-v6mr1793541plg.310.1542199580435; 
 Wed, 14 Nov 2018 04:46:20 -0800 (PST)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id b75-v6sm30410848pfb.96.2018.11.14.04.46.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Nov 2018 04:46:19 -0800 (PST)
Date: Wed, 14 Nov 2018 20:46:11 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: ed.tanous@intel.com
Cc: openbmc@lists.ozlabs.org
Message-ID: <15873193-516b-4cf5-a6ee-2cb7dd1c0309@Spark>
Subject: IPMB recipe with questions
X-Readdle-Message-ID: 15873193-516b-4cf5-a6ee-2cb7dd1c0309@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5bec1918_2c6e4afd_d966"
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
X-List-Received-Date: Wed, 14 Nov 2018 12:46:27 -0000

--5bec1918_2c6e4afd_d966
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Ed,

I am attempting to build phorphor-ipmi-ipmb recipe and encounter some que=
stions.

1. When I build this recipe by devtool, =C2=A0it complied return below er=
ror message
=C2=A0 =C2=A0 =5B fatal error: linux/i2c-dev-user.h: No such file or dire=
ctory =5D
=C2=A0 =C2=A0I track it copy from =C2=A0include/uapi/linux/i2c-dev.h =C2=A0=
in dev-4.13 branch.
=C2=A0 =C2=A0I wonder why don=E2=80=99t directly use linux/i2c-dev, It in=
cluded above file.

2. I need use this patch on Linux source, follow document add a new devic=
e by manual and restart service then it could be executed.
=C2=A0 =C2=A0 =C2=A0I want to add this device auto-execute but not sure a=
dding on the recipe or Linux source are fit.

3. Now my ipmb.service is runtime and sees Channel.Ipmb BUS.
=C2=A0 =C2=A0 Could I use phosphor-host-ipmi (ipmitool on bmc) tool test =
this service work=3F If could, how to set command for the test. If couldn=
't, have another method test the services=3F

Thank you for your kind attention in advance.

=C2=A0Thanks,
Samuel Jiang

--5bec1918_2c6e4afd_d966
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>Hi Ed,
<div><br /></div>
<div>I am attempting to build phorphor-ipmi-ipmb recipe and encounter som=
e questions.<br /></div>
<div><br /></div>
<div>1. When I build this recipe by devtool, &=23160;it complied return b=
elow error message</div>
<div>&=23160; &=23160; =5B fatal error: linux/i2c-dev-user.h: No such fil=
e or directory =5D</div>
<div>&=23160; &=23160;I track it copy from &=23160;include/uapi/linux/i2c=
-dev.h &=23160;in dev-4.13 branch.&=23160;</div>
&=23160; &=23160;I wonder why don=E2=80=99t directly use linux/i2c-dev, I=
t included above file.<br />
<div>&=23160; &=23160;<br /></div>
<div>2. I need use <a href=3D=22https://patchwork.ozlabs.org/patch/903063=
/=22>this patch</a> on Linux source, follow document add a new device by =
manual and restart service then it could be executed.</div>
<div>&=23160; &=23160; &=23160;I want to add this device auto-execute but=
 not sure adding on the recipe or Linux source are fit. &=23160;</div>
<div><br /></div>
<div>3. Now my ipmb.service is runtime and sees Channel.Ipmb BUS.&=23160;=
</div>
<div>&=23160; &=23160; Could I use phosphor-host-ipmi (ipmitool on bmc) t=
ool test this service work=3F If could, how to set command for the test. =
If couldn't, have another method test the services=3F</div>
<div><br /></div>
<div><span itemprop=3D=22text=22 class=3D=22ya-q-full-text=22 id=3D=22yui=
=5F3=5F17=5F2=5F3=5F1542199041405=5F1430=22>Thank you for your kind atten=
tion in advance.&=23160;</span><br /></div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>&=23160;Thanks,
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22>Samuel Jiang<br style=3D=22font-size: 14px; font=
-family: -apple-system, BlinkMacSystem=46ont, sans-serif;=22 /></div>
</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>
<div></div>
</div>
</body>
</html>

--5bec1918_2c6e4afd_d966--
