Return-Path: <sacnaik@gmail.com>
Received: from mail-ua0-x22b.google.com (mail-ua0-x22b.google.com
 [IPv6:2607:f8b0:400c:c08::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x97qP64ppzDqm0
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jul 2017 11:18:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MIeO3lce"; 
 dkim-atps=neutral
Received: by mail-ua0-x22b.google.com with SMTP id 35so22128030uax.3
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2017 18:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W2bMuEiy67uAy/on7/bqrfQW8pVX0xvrarnDFbJLbmU=;
 b=MIeO3lcerVAWDcBCDCpHOwGdrpVEQJxs7jDbU6O7xqiMhuHsws6QdPcOUWWF78Ei1S
 vJ8bUSkuyXNHnPlKrYnpPMOMb/G5JilambsFchhLUFelqI01n7kEJOvoiprLrKrMerOt
 9mf80ANpMECqwzsnZYWDmGGENSSncuExbqbYRNWsR3uMOLOgo9iUnGHIoSc6uVI3PYV7
 88d1/5NOhT1V672VqKb5jhPSujFNxM/dPmKv1INeQTip8/LpoFQnXY1Lqpb2QlyCG/k0
 IXzW6cI2Jg3IJWq50xMe5R4mSegD0MwmBAQRCYsuWBKALvKQ3m1bEF4oUtCpOkigP2eN
 LFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W2bMuEiy67uAy/on7/bqrfQW8pVX0xvrarnDFbJLbmU=;
 b=FUj8K1hk6Xte+Hc4jO4xwRUTJ8s2GDaLGern/PHMRQb7Dt2wtHuo3in298SAqy3KJZ
 7QeaA/b3iXpUS6hAL4Jj0MJejK3LiUwLGeRyBz75CmxBLSXhHJIw7bY1HTGaUrw5A8SY
 vfTN5ywoF18DKDFEXhmLga2mJ6XWSIOM4ovGmlV0gOHBcbr7qhiInXmWof1aqGovUu0A
 w3xfsMpwErrXevq000YJmg8uNqRFETOr0DTE2htA6UxIYHFXW/lUjMpi4rBx/Mj7sXg/
 DBMUx+ajKl0S/w5iLvk2Me1RfrtaMti8ww3mGY4zzMjJ6WxfrVRNJKZprq+LMr5Hj4i9
 Qu3A==
X-Gm-Message-State: AIVw110Ku7HATxcbO5gq1AW0Vg9ixAuIpkFAfso0amx92Bj/p3fze5Q0
 Xcb8GvkO4efUWVZXV8uQbPXFtvX7iHkN
X-Received: by 10.176.91.19 with SMTP id u19mr7899209uae.152.1500167934477;
 Sat, 15 Jul 2017 18:18:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.101 with HTTP; Sat, 15 Jul 2017 18:18:54 -0700 (PDT)
From: sachin naik <sacnaik@gmail.com>
Date: Sat, 15 Jul 2017 18:18:54 -0700
Message-ID: <CALFfRJOOB=AJaEKzhW9yiCqbn1ymozyaTnyG9+bTn9YdPFsU_Q@mail.gmail.com>
Subject: Adding new platform
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="f403045f8b74d68da5055465100b"
X-Mailman-Approved-At: Sun, 16 Jul 2017 21:16:10 +1000
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
X-List-Received-Date: Sun, 16 Jul 2017 01:18:58 -0000

--f403045f8b74d68da5055465100b
Content-Type: text/plain; charset="UTF-8"

Hi All

I need to add new platform to openBMC. My platform is based on AST2500 SOC.
I have created BSP layers on BSP and added all required linux standard
drivers for my platform. I brought up the openBMC on my platform. Now I
need a help to add all environmental device info

For example I need to add all temperature sensors of my platform to BMC
application stack so that the IPMI host/net  and REST services will work
seamlessly.

How shall I integrate my platform temperature sensors(All are hwmon class
device) to openBMC application stack ?

Any help or pointer will help me a lot.

Thanks and regards
Sachin

--f403045f8b74d68da5055465100b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All<div><br></div><div>I need to add new platform to op=
enBMC. My platform is based on AST2500 SOC.</div><div>I have created BSP la=
yers on BSP and added all required linux standard drivers for my platform. =
I brought up the openBMC on my platform. Now I need a help to add all envir=
onmental device info</div><div><br></div><div>For example I need to add all=
 temperature sensors of my platform to BMC application stack so that the IP=
MI host/net =C2=A0and REST services will work seamlessly.=C2=A0</div><div><=
br></div><div>How shall I integrate my platform temperature sensors(All are=
 hwmon class device) to openBMC application stack ?</div><div><br></div><di=
v>Any help or pointer will help me a lot.</div><div><br></div><div>Thanks a=
nd regards</div><div>Sachin</div></div>

--f403045f8b74d68da5055465100b--
