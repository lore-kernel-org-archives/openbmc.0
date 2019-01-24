Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a90wkNwO"; 
 dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lgHD42NmzDqGN
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 22:41:56 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id e12so4949147otl.5
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ned2KqUsyGihYgVgA8D4E7kACCvWKlRgd2mgHy0tBag=;
 b=a90wkNwOn2qXa7tpWDvn9oqjdfVUqalJlK5r5vCApAIrZle0HGmJoLar1Es0OrSWc8
 40P6uVHdloAhveWz+AqOHMwkZttSl3zuiJHGxgRc38uCNSSNXy84ovM3yykgkSzqrDEb
 iRPJiYdnwBsXOkOy+Rjy6xFOxPiefH2huymwYYgiji7gj/1QitzUWCrKGCod4cgSMFp+
 0AVjwB8cRQ2lx43hMAmvItnuAxzZAvcxvOb8EzhbGsnABdBb8xgBMmvU1c2r7I6fcI+Y
 PIOKi6EiaPCwxbZJH03OGIWSGspyI6kkjCBtvqsUG7u7X2KfgsSCDcgCYhl4wlJTw7xu
 vtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ned2KqUsyGihYgVgA8D4E7kACCvWKlRgd2mgHy0tBag=;
 b=Ye/cyGQ0irwBi2Of/8auIgWFqiOjh0wwVSFnSeSjHwdRJcm35rQxMcWaN4rbCiN6wO
 BqBgdcwR/yGbs4G3CfuXzC2rcRHBZfxHk6/h0Ts+zzxlxORwxOri1pKSwviIqW5R+YUx
 dTc3RXyxtbR9qNAFShmVVJ8WrR2VvcPkKk+/eDN7z2U1bTNMRUGpbjA4/TFKwN+vD2He
 WedozfBYnh4nWLGcgKD7ZQARfNafzv4gsq4gq7dbvjqIxl8OsFBv961qyMm07/y6B2xj
 kPIxsr2e2nXc6KKNhZoqTk35wvyZua7jxjf+0nXwYUCJC1gIUULujQm/2T8HiEp0ZyJh
 op1Q==
X-Gm-Message-State: AJcUukfha5TuyIEC6VULpr2ogFE5FBRNE+piIgdcWtJJ2F+CxkncRdKv
 TpIHjGY3Ocr6PNVe9zbFth+BJFwfh5pikmuK84ypZnezLcI=
X-Google-Smtp-Source: ALg8bN6hvlPaThOVmmy3XW4CtwtTpWlx96O9c0CKAJtKgTqiGz35d1tKpHmR2CoHrtK/xEumJ7ogTLuE19zOP2ZN9Oc=
X-Received: by 2002:a05:6830:186:: with SMTP id
 q6mr4020162ota.76.1548330114388; 
 Thu, 24 Jan 2019 03:41:54 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 24 Jan 2019 17:11:36 +0530
Message-ID: <CAE33tLE51SjXkMhWEoLS6_eazrp5uTTKgQ860v-aShUVwOXzPQ@mail.gmail.com>
Subject: i2c-tools not working properly
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000769801058032b2d6"
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
X-List-Received-Date: Thu, 24 Jan 2019 11:42:01 -0000

--000000000000769801058032b2d6
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have one eeprom Atmel AT24C64 connected to i2c bus 12 at address 0x51.
It is detected by OpenBMC Linux and showing in sysfs. I tried to write
value 0x11 to location 0x00 using i2cset command.

# i2cset -y -f 12 0x51 0x00 0x11

i2cget command # i2cget -y -f 12 0x51 0x00  output is 0xff.

Please someone help to resolve the problem.

--000000000000769801058032b2d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>We =
have one eeprom Atmel AT24C64 connected to i2c bus 12 at address 0x51. It i=
s detected by OpenBMC Linux and showing in sysfs. I tried to write value 0x=
11 to location 0x00 using i2cset command.<br><br># i2cset -y -f 12 0x51 0x0=
0 0x11<br><br>i2cget command # i2cget -y -f 12 0x51 0x00=C2=A0 output is 0x=
ff.<br><br>Please someone help to resolve the problem.<br></div></div></div=
>

--000000000000769801058032b2d6--
