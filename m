Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aw4Z5DUx"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rJmh3yQKzF3N5
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 21:04:52 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 192-v6so15673350oii.6
 for <openbmc@lists.ozlabs.org>; Thu, 08 Nov 2018 02:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5VS+O8W4oV5c5l3LgjPxSzu7eiQiaye7B1rXqtSJ7pA=;
 b=Aw4Z5DUxNvH+OCQ+QM52NHoLIn6bqK3zUyIEr/u4BHjXuf+lTjCGEyeJ8s0q1QpzGJ
 MJipnFq+mnxGeeaPLROzvrN5WKGxGdDEoQGpK+L71qSauqAUCO5pOJ+ShyO4CDO19inE
 NbDxHvEb2CQ/dnOnzAFnwKeuf8yk1Oz5IqKu1BO4ExZEK7xQf46qWE5JlfjSQ2xLa2xr
 oU+dtDDdMfwyrEen939KyZ0yvN/BLdrMak6WJ05c1k6uYZt50x8RKmkNG2v8PUip6Ojt
 sfXWkti27w6YJ7DWQznySWx/nNOtHbo+gsRG1W//Qw8yI0aXCK5bBisYz5XIJO7zCRZq
 pTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5VS+O8W4oV5c5l3LgjPxSzu7eiQiaye7B1rXqtSJ7pA=;
 b=JsGxo4zBsKA33oFXdYn92EqVFX9nFfw8AKhLPJloxTXXORvqtX9BPx92WtKIdIIIUV
 qm8JhSIBhC3l0OyuJDMda4y3+Yz17BOtfby27Dymbe8vj9GO2ZEFbzqoIYV8d4ueP/WC
 XstTXE0Y2GhZFl3g9fnG36LTIKEid3BwPq3uJYOkjwalU+2Z16wxW//wr6efrY4iAP1s
 4O6ItMBjffdnZ5+JJLdNf8O6cngBt09pabD1rS4sh0Zos4p0pL8rUem/fMx2+iualL8n
 GpcEKgTZVAfLBSkFpQi2weZvR4YnsHbZ66UUJr6hl3m53DloQKyQ+zxzhN4Sn9U99fSQ
 4fjw==
X-Gm-Message-State: AGRZ1gK/iNyAPFL0bLk55MWQIBz1FVrtHtTAtpu07YccN2WOjgls851P
 1UnP8PqlBipY/t2zs+lMDuvAnig8NbLSkxYUXXE0a68u
X-Google-Smtp-Source: AJdET5f4kOzLlLHoeaY9JQbYL+wIHDljiROkl4OQ+faklwkZQH4BA646mCXIAJ61ThE3Z8EB89tfqeVbbW2EW30hWhc=
X-Received: by 2002:aca:abc6:: with SMTP id
 u189-v6mr2085217oie.316.1541671489594; 
 Thu, 08 Nov 2018 02:04:49 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 8 Nov 2018 15:34:30 +0530
Message-ID: <CAE33tLEFXcushQzAthRY6LNMLfFh9YSVySPFudn+KmSHTqXUYw@mail.gmail.com>
Subject: Flashing Image using 'pflash' Tool
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007f6ab4057a245da7"
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
X-List-Received-Date: Thu, 08 Nov 2018 10:04:53 -0000

--0000000000007f6ab4057a245da7
Content-Type: text/plain; charset="UTF-8"

I tried to flash kernel image *fitImage.bin* to the flash memory address
*0x20100000* using the following command.

root@zaius:/var# *pflash -a 0x20100000 -f -p fitImage.bin *

It exited with following error.



*About to program "fitImage.bin" at 0x20100000..0x20371e20 !Programming &
Verifying...[                                                  ] 0%Flash
write error 3 for chunk at 0x20100000*

Please someone help to resolve the problem.

Thanks and Regards ,

Akash G J

--0000000000007f6ab4057a245da7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I tried to flash ke=
rnel image <i>fitImage.bin</i> to the flash memory address <i>0x20100000</i=
> using the following command.</div><div><br></div>root@zaius:/var# <i>pfla=
sh -a 0x20100000 -f -p fitImage.bin </i><br></div><div dir=3D"ltr"><br></di=
v><div>It exited with following error.</div><div><br></div><div dir=3D"ltr"=
><i>About to program &quot;fitImage.bin&quot; at 0x20100000..0x20371e20 !<b=
r>Programming &amp; Verifying...<br>[=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] 0%Flash write error 3 for chunk at 0x20=
100000</i></div><div dir=3D"ltr"><i><br></i></div><div>Please someone help =
to resolve the problem.<br></div><div dir=3D"ltr"><i></i></div><div dir=3D"=
ltr"><br></div><div>Thanks and Regards ,</div><div><br></div><div>Akash G J=
<br></div></div></div>

--0000000000007f6ab4057a245da7--
