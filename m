Return-Path: <danielhilst@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::944; helo=mail-ua1-x944.google.com;
 envelope-from=danielhilst@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n40y4VTE"; 
 dkim-atps=neutral
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 436kzg2b2dzDqrZ
 for <openbmc@lists.ozlabs.org>; Sun,  2 Dec 2018 08:34:20 +1100 (AEDT)
Received: by mail-ua1-x944.google.com with SMTP id t8so3154046uap.0
 for <openbmc@lists.ozlabs.org>; Sat, 01 Dec 2018 13:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=80aqiKN4snj/e2Bm6e7Vb3ysoek/G6+dHxrDW0KJo7I=;
 b=n40y4VTExmS4vrL9tm3oSbKE+6uSYw4WBuGlY0tlWS9kd2xXdEjoWvSvVi+enzEQEX
 hcwRO+SnYsR2c9XQ2zUl/5ZtrTQL6BJeci7MtyaLvXysxAhS8QxJJa/oO7iP+CISzyOD
 aS2PR0HEBSZcGf3SmlWNFle3/wGvcmwkAnq5EjbeQ7bhGj8tiRETBl54oPpN3Tn09WBS
 xPEQNV/Lvwt7wFk5kZtwIXtGaRQvdb18qJ+1QH3qjS283ob4MmdHUsfy944MTE+f+a+U
 s7pigS66Nya8qMv5faKlRS8B5YnHl83IRPaI4CUR5gqqQwgbQR3tiad9/wKalYOsiZFU
 UikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=80aqiKN4snj/e2Bm6e7Vb3ysoek/G6+dHxrDW0KJo7I=;
 b=G9MuKgPozil/PELZiFjDBI5kXZwkIfzBjTIjVN54se8cvh7m0YL8uXK+QC/rUEGrh+
 Dir+Y2U7QpAaVsBsc6iJktLqXmMt4czBLQqUzUzdhcZ7XMqfvbzs0EMm+a7EfLkMsm+m
 xpKlfwzYRJxn0rNaZvmEd3bYy1Xm8GgzD2e5zW7sQ816Ioo+ALApiIMN4mfNLZG9mgt2
 kxLFgxY1jZ+RhwMB71jCUgUbdznUFXrDPqslgMzLqYgbp4LwAi4UV/b/Abe/p5+UtAPf
 NgxIGUcg4fVMsTSmmBbc0Dg0mU+LJjwE7uSicqzY3rNhFp1Eqt6QHGYVubqQ163EUAso
 lXCw==
X-Gm-Message-State: AA+aEWba7XbShKqnib32ngUgk164nMUu6an7WEB5C+MQiNk82uIlXh/K
 NQsPoF7diOA+DHX17k5uI8hGVsp4dux9TbdeGypIBw==
X-Google-Smtp-Source: AFSGD/UWXFGYGlVEnyYb1bLGSRcZE8Lp4Py3jp9paWK3XAsYV1Rd0UkCHO+EZghfnkqpBs0SPItNSCzM/RMIY0ofPC4=
X-Received: by 2002:a9f:2c87:: with SMTP id w7mr4140400uaj.116.1543700055589; 
 Sat, 01 Dec 2018 13:34:15 -0800 (PST)
MIME-Version: 1.0
From: "Daniel." <danielhilst@gmail.com>
Date: Sat, 1 Dec 2018 19:34:04 -0200
Message-ID: <CAF3SDA6bBeBVm9Yu1JZ7z5A5mFMy1=2T-ZS1cX_yEdqLyvY=Cw@mail.gmail.com>
Subject: Emulating HPC environments with OpenBMC and qemu
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000740701057bfcad78"
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
X-List-Received-Date: Sat, 01 Dec 2018 21:34:24 -0000

--000000000000740701057bfcad78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everybody. I'm trying to create a HPC environment fully virtualized for
PoC and testing purposes. The need for a BMC has being a blocking
impediment for me for a long time, I'm very exited to know about OpenBMC.

Is anybody trying to do something like this or have experience with it? I'm
willing to combine effort. My main goal is to emulate a cluster with about
2 nodes managed by xCAT, fully virtualised, and supporting sequential and
switch based discovery.

Best regards and thanks for such good news!

--=20
=E2=80=9CIf you're going to try, go all the way. Otherwise, don't even star=
t. ..."
  Charles Bukowski

--000000000000740701057bfcad78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everybody. I&#39;m trying to create a HPC environm=
ent fully virtualized for PoC and testing purposes. The need for a BMC has =
being a blocking impediment for me for a long time, I&#39;m very exited to =
know about OpenBMC.<br><br></div><div>Is anybody trying to do something lik=
e this or have experience with it? I&#39;m willing to combine effort. My ma=
in goal is to emulate a cluster with about 2 nodes managed by xCAT, fully v=
irtualised, and supporting sequential and switch based discovery.<br><br></=
div><div>Best regards and thanks for such good news!<br></div><div><div><br=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature">=E2=80=9CIf you&#39;re going to try, go all the way. Otherwise, =
don&#39;t even start. ...&quot; <br>=C2=A0 Charles Bukowski</div></div></di=
v></div>

--000000000000740701057bfcad78--
