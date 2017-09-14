Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hkUhex7a"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtXbC1BGmzDrWR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 08:03:02 +1000 (AEST)
Received: by mail-ua0-x22d.google.com with SMTP id 97so370502uai.6
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 15:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=foWtRrzAMsHaPvnxbcHBCeaVOfi3HsNTTpr1oLy9/s0=;
 b=hkUhex7axmQ50NlSbncZnQrohAU9RM87FoPDZbSOXxg09tEpBbwTYM69wqg7Ja1Kdi
 tr7dqZFvqVG83JXtYqcrKCdDYP5fmnGZRVZSJzliJacBlzJqLk7F/4/QooogtTIoqxTU
 xHGQnlI34K4GcaJvYgus5aVDnyzbPAxWDKKMv+eAcp2QPhQ5kVH/VErIqWbuNZcemyNA
 69ZnTr7yQMc2BwbtubISDsxdgOYos/1g45uNSh1/mfbaN8IgNpcAvTpzTTT+y0M3cbbC
 avyHbXTwhrfnG1DhIu4vXyTBIlv9KDVou0lxgLmLDNwtimDdCIFr7kgecSqkX+YroxtI
 Mb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=foWtRrzAMsHaPvnxbcHBCeaVOfi3HsNTTpr1oLy9/s0=;
 b=f18sRkCjOo2q/oUkoXhQ8DXwgdCfiwVwHKkjfn6mbReR61oHQoTNqp54xfsNbNVF+S
 w2rZtfLnFO5NoJCwFdYo37HV6sU8UsEGGmptiYPDnnx8E4LKzFO+8Wfv2zln6IIEibc9
 4u4ogEhk75qjRXtNRaK/1huCu76VkcdXZL6Ffr/wgQ4hM2zBA3fgYUQQdCK7F6VH9tzc
 7fjOHUQjE2UVuTIBoS17kcSB4NEE6p4yV9SEpATJZS5tVpL51/Vzf91I5hCTQSBi8ml1
 v9wFotdtKoAepPrH+5HT96qTDggXd2xU3JggEyhZI4Q7Gs3qnxstkB/1z+/NOTagGQR3
 3MVQ==
X-Gm-Message-State: AHPjjUhG58kgXdEHwL5C4ORONVajTh/sAaydKVpGkvB/VpCNvy0TDa2n
 4+AJMpuuyOOTdXVKJgHHES+PjGjo2gg011zskDWZaZp5
X-Google-Smtp-Source: ADKCNb5h4KRjnynzboZe9a9l28LNyFBtyD7Ao0Od+cTi1Fa0or24NkXAItO7ouC+PXUBeUerJOZJx/S+dN7eym4kvkg=
X-Received: by 10.176.82.103 with SMTP id j36mr20236514uaa.156.1505426579562; 
 Thu, 14 Sep 2017 15:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.178.18 with HTTP; Thu, 14 Sep 2017 15:02:38 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Sep 2017 15:02:38 -0700
Message-ID: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
Subject: GPIO Centralized Control Daemon
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c18fc5e82f52b05592d70d5"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 22:03:03 -0000

--94eb2c18fc5e82f52b05592d70d5
Content-Type: text/plain; charset="UTF-8"

I apologize if this already exists or is in the works.

I propose we create a daemon that centralizes userspace GPIO access.

From a high level, the daemon will implement interfaces to export or
unexport GPIOs.  Each GPIO exported will exist on the dbus:

/xyz/openbmc_project/gpio/53 and implement an interface with the following
properties:
value, direction, active_low, etc.

Some doubts, should the gpio name on the dbus be the relative name (53),
should it be the system specific name (G5) or the absolute name?  I'm
thinking the relative name and let the daemon handle internalizing the
adjustment from relative to absolute.

I'm working on adding GPIO support within phosphor-hwmon so that I can
access a voltage sensor that's gated by a GPIO, and I know there have been
conversations and implementations of this for IPMI OEM -- and I think it
could easily be centralized.

Thoughts?

Patrick

--94eb2c18fc5e82f52b05592d70d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I apologize if this already exists or is in the works.<div=
><br></div><div>I propose we create a daemon that centralizes userspace GPI=
O access.</div><div><br></div><div>From a high level, the daemon will imple=
ment interfaces to export or unexport GPIOs.=C2=A0 Each GPIO exported will =
exist on the dbus:</div><div><br></div><div>/xyz/openbmc_project/gpio/53 an=
d implement an interface with the following properties:</div><div>value, di=
rection, active_low, etc.</div><div><br></div><div>Some doubts, should the =
gpio name on the dbus be the relative name (53), should it be the system sp=
ecific name (G5) or the absolute name?=C2=A0 I&#39;m thinking the relative =
name and let the daemon handle internalizing the adjustment from relative t=
o absolute.</div><div><br></div><div>I&#39;m working on adding GPIO support=
 within phosphor-hwmon so that I can access a voltage sensor that&#39;s gat=
ed by a GPIO, and I know there have been conversations and implementations =
of this for IPMI OEM -- and I think it could easily be centralized.</div><d=
iv><br></div><div>Thoughts?</div><div><br></div><div>Patrick</div></div>

--94eb2c18fc5e82f52b05592d70d5--
