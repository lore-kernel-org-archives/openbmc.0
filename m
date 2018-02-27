Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::236; helo=mail-ua0-x236.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SQgbeWAh"; 
 dkim-atps=neutral
Received: from mail-ua0-x236.google.com (mail-ua0-x236.google.com
 [IPv6:2607:f8b0:400c:c08::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrGVZ077RzF1XR
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 22:21:38 +1100 (AEDT)
Received: by mail-ua0-x236.google.com with SMTP id n48so12730049uae.13
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 03:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6Iowjvd89q2RZXkP8rPs46pPb7YGC4XfPtfEFm+EKnY=;
 b=SQgbeWAh7YNZJKq9SDsYzSusFfsIMKraCYTxLpp5GEW/9lpRxiWCdCQWu2oHmIc8PI
 qd6o2cMpBND3N1hL9SKqFC9DzMoc7ZKjCMxCn/Z9BgdWlzihDD1eKG7SnRLfKFU4dHOy
 rRV816RX9ZnJ5zdCmPotRSxmCnjc+7M8xp2wN76zhkLq5rhGzAZ2GSR0wK20YA1e6jRk
 ZhL/NLhV2SDYgKrdbGK//2w2ztp7Li90sMfKUd9CdUX9Hw8RRmZzBL6Z0/KDXYnBnT9n
 La641BNmGdzVZ5eVEJZVZIQDmCZjLi7rIe3Fa/9fraVhj2PKQs5Bcx0O8eNAOwMZdXho
 9C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6Iowjvd89q2RZXkP8rPs46pPb7YGC4XfPtfEFm+EKnY=;
 b=kjfhMaxdru4+nVOwAIstGADGii8HwOywzQXN0+4nkPKOoBkPoZSvwON+XCNJu97E7u
 iqsFjyhc3qnoBx2xggaQvEHI/CSqRltGxg5lE1RA9WvDwIoIkxnsIsAVRs3Y/h3mUoRT
 phiKYMLmnfxhqAUF7PwKsXZR//8mMBK43VRLvlCjHf5netswRbRxDY5m5kfnFKsEE6YU
 UOr1svB/WS70Vf4BxtIcCwjAABNvtDUKEgaiXkeA7B6dZBYI6bEIFQp9660SLtXt/xi2
 of/aho9+dk3Np0SPOl90Ilml6z++5XRQMoC/VoWmcRpNzBfzQfFDlydVB277w1HfhJhs
 Phlw==
X-Gm-Message-State: APf1xPCGvlfUctCzvlwEySJns9OxbynGgtJ9H633VXRCvwiViMfjM/fO
 YNnYKJYFVuLoU4ijobN0m8am0RLxSyBzkXLu5lc=
X-Google-Smtp-Source: AG47ELvwu5/jM2Fx1eXiu1tuZ3mWRwNdEc53KlTYLANDPpGAXCVh7HmJMdzvI5si2uahduJHuAIlah1v3x51iu80Lrs=
X-Received: by 10.159.61.88 with SMTP id m24mr10570333uai.139.1519730496001;
 Tue, 27 Feb 2018 03:21:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.48.16 with HTTP; Tue, 27 Feb 2018 03:21:35 -0800 (PST)
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Tue, 27 Feb 2018 16:51:35 +0530
Message-ID: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
Subject: IPMI Sensor Read-only role updates.
To: emilyshaffer@google.com, tomjose@linux.vnet.ibm.com, 
 vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="f403043664f85e5d7205662fd4ba"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Feb 2018 11:21:42 -0000

--f403043664f85e5d7205662fd4ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am working on an issue openbmc/openbmc#2500 (Add support for Turbo
allowed sensor). As part of this issue implementation , there is a
requirement  to change this IPMI sensor to read only for host. Currently
all sensors are read/write by design and doesn=E2=80=99t have way to change=
 this
behavior. Planing to change this behavior by adding =E2=80=9CMutability=E2=
=80=9D field in
the config.yaml.

As part of this issue am planing to  Initialize  mutability with
Mutability::Write|Mutability::Read for all sensors and set the required
sensor mutability Mutability::Read.
      - Minimal impact on testing and not breaking the existing
functionality.

Follow-on story is needed to fix this in generic way like
  -Add =E2=80=9Cmutable=E2=80=9D field in the config.yaml and initialize th=
e the field
based on System types also update  sensorhandler.cpp->ipmi_sen_set_sensor()
to do set only for write enabled sensor.
    - This required system specific IPMI sensor behavior review and updates
in corresponding config.yaml.

Please add your view on this.

--f403043664f85e5d7205662fd4ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am working on an issue openbmc/openbmc#2500 (Add support=
 for Turbo allowed sensor). As part of this issue implementation , there is=
 a requirement=C2=A0 to change this IPMI sensor to read only for host. Curr=
ently all sensors are read/write by design and doesn=E2=80=99t have way to =
change this behavior. Planing to change this behavior by adding =E2=80=9CMu=
tability=E2=80=9D field in the config.yaml. <br><br>As part of this issue a=
m planing to=C2=A0 Initialize=C2=A0 mutability with Mutability::Write|Mutab=
ility::Read for all sensors and set the required sensor mutability Mutabili=
ty::Read. <br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Minimal impact on testing an=
d not breaking the existing functionality.<br><br>Follow-on story is needed=
 to fix this in generic way like<br>=C2=A0 -Add =E2=80=9Cmutable=E2=80=9D f=
ield in the config.yaml and initialize the the field based on System types =
also update=C2=A0 sensorhandler.cpp-&gt;ipmi_sen_set_sensor() to do set onl=
y for write enabled sensor.<br>=C2=A0=C2=A0=C2=A0 - This required system sp=
ecific IPMI sensor behavior review and updates in corresponding config.yaml=
.<br><br>Please add your view on this.<br></div>

--f403043664f85e5d7205662fd4ba--
