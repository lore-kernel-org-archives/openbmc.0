Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7FCyxDs"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Pr3j1fRszDqNt
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 13:15:28 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id s7so3968038iom.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 19:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dBTU+r+0NwwzfyBZDgQ9FJ/hAbDbVnHkPHjWl69gu2Y=;
 b=h7FCyxDslrMxRvtY/PPHZOl9PWFvOS9A3pjMIyuFf3lK7AeUIXkxQi+LYQ/V/pV/8W
 kT9gf5ipq1OWJDDiEOaRI2rhMo1hIsm79bVnbqRB/A4ZwQOZFGyHXPcIFmC7uPkc3Zrx
 cCkEMWxslkeWOBBdMfy98WaiZ+UIP85ZX+cvgngjasbF1yemoVhvyGGYNTF9cvYa7pxQ
 /au5VMnv+PN5OuVyuGhnhcWe8hQpSgWN22P9i/gP1peIT+SN5nFDcUw9w2IRWeKUVVEC
 dij3VLV9rzUbSiB+vajGP2BehSLR2Ovz4Z7cI0FMU7VFf5LiASo5/GKdg4Ovk1aESgZp
 62fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dBTU+r+0NwwzfyBZDgQ9FJ/hAbDbVnHkPHjWl69gu2Y=;
 b=oneAxmjHc0jiSZjmLM3f/VStsUQDPam2z3OW644NJj0MRikDrBFnUtSpcDMuFiFCfn
 E9MZo90SUunGyLRjCAPBG3kDDnAnAQE0c4r0WlC5rx14qN77puy1emWxrVeP9RpMGLby
 CYyiK8Dm84mQC3Mlz0JfOPxKCCzySh886FSBa+Y6fWIRW08JYQvQXxO8c90rKdQ3dnmW
 A6av6BTpB8Mkg7uEelfDCsWmYQ31Bjm0zZVyN50/NI4hSmohVl3VMyf/1qv4paUh9YnV
 ypHXEhsT7YdhkRHsBRr3zopAg+OatwX9h8sgbrPI6LbR6NiguXsBckG168B1Og+MgLh/
 Ff5w==
X-Gm-Message-State: APjAAAXTBpg5Iup+W7U3B1i0KL1eMNvYUAPEzcEf6umVJ07VOcyKmjrr
 E3r37FiCth1KQ2q1JG57Hfogh8SgdZ9Ogf++KHmQ4N9W6f4=
X-Google-Smtp-Source: APXvYqz4cTX/RrqjnmPRHVZYAGYUkcdN5j6yuSMTXsowK9x7r+mCACQaMfVEwynD0Bs1DrrQHCqYClf8g2eDENOdUFM=
X-Received: by 2002:a5e:9e0d:: with SMTP id i13mr997417ioq.156.1553134525344; 
 Wed, 20 Mar 2019 19:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR04MB5218E40914AEB17922205F60C9410@AM0PR04MB5218.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB5218E40914AEB17922205F60C9410@AM0PR04MB5218.eurprd04.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 21 Mar 2019 10:15:08 +0800
Message-ID: <CAARXrtmbcihFe2WgudbQOdcz4okBBy0-oBLiOLBNKehmFoig9Q@mail.gmail.com>
Subject: Re: A few questions regarding porting to a new board
To: Stephen Boylan <sboylan@ircona.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 21 Mar 2019 02:15:30 -0000

> Here are some issues I=E2=80=99ve run into and I=E2=80=99m wondering if a=
nyone has any answers or tips they could help out with.

> I=E2=80=99ve been trying to set up some GPIOs and I was able to add LED a=
nd GPIO Keys, but I=E2=80=99m having trouble with power related pins. I add=
ed a gpio_defs.json file and tried a rebuild but noticed that it wasn=E2=80=
=99t ending up in the target rootfs. I noticed then that by including conf/=
machine/include/openpower.inc in my machine.conf file that it would.
>
> Is the workbook still a requirement? Do I need to make a .py file as my w=
orkbook? Is there one location where all GPIOs should be defined or are the=
y separated out into different services now?
> Should conf/machine/include/openpower.inc be the first thing to add to a =
machine.conf file or is it better to select the features manually?
>
> Are there any default configurations that are needed in new machines? Fro=
m looking at a few different ones (ast2500/Romulus/etc) there doesn=E2=80=
=99t seem to me to be a standard structure.

The doc [add-new-system.md][1] is updated to include these topics.
You could refer to the LED, GPIO sections.

>
> From what I can tell I have phosphor-state-manager included in my build, =
but obmcutil is not present. Is there a way to verify that I=E2=80=99m usin=
g the correct phosphor-state-manager and to include obmcutil?

obmcutil is a standalone utility, not part of phosphor-state-manager.
It is defined in meta-phosphor/recipes-phosphor/devtools/obmc-pydevtools_gi=
t.bb,
and installed by
meta-openpower/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappe=
nd

[1]: https://github.com/openbmc/docs/blob/master/development/add-new-system=
.md
