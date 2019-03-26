Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZNdmyCaG"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44T9343VY1zDqHg
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:11:27 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id f6so10540995iop.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tq+iFEj70yf/Zij+14A0S7bVMe4ODnBFcePKRW8W82U=;
 b=ZNdmyCaGWY4z4BnHwCBLX8lbhgXO0cZu6PIQPYAoc3W9K+8olAdAFO1tZMuDSqdrRF
 43nxlMessLKa1xyjsUj+x+0Q3BlEVkHT65Uf2NRtlcc5cayIzAB2m5hLGDqwcHXUJtzu
 0CtNJ4k5TorNMpW49Bqw8coWgbsSZ8XtaIBWmSr9AknZcS1PL5msHO33gKsA8LOd7Uvo
 RwCPXwvMpxka9AbF28ZzHHqMmQisB6Vw4c+/MB0Vf93751DmVNCH5RQhbEPSYQGvd8Wo
 Xjnxd+TVPfqoPnR0lsVysMxK0XytyWhUkmnAc3TK2M/ot9hkIBdeoWONqFp4yxdVOBAV
 4FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tq+iFEj70yf/Zij+14A0S7bVMe4ODnBFcePKRW8W82U=;
 b=fHNHGheXdpYSgqKaMjmmsDTaoGoVPzL1TmSpo2g2m8sW+3NQA+nf24SSctNr1zifH3
 weEaGFXjl95uDzGpEpVWa2TLMSKNv95HX4x4/eIZ/rxk1Z8i5UQMaGFoe49MfIm4h/RI
 waNMtaAz6/V11MJG6EMMf+5U+NlBgB5RMdFG7jMqX4WMg+DwXClaIDCl484pyoVwLxbX
 QFxoRqxB91t61wPVu9nC19uKk6QeaIcNHIT8j8GNzt6GpQyGOl3HmVR500JFLddGy2MN
 1uks3kLuz3HBxTOwh8o7/nBqT3hngLgshHx9HfX2dv1vyj8dHS2xypGGu0jLVyDYLZ5C
 pRLA==
X-Gm-Message-State: APjAAAVz20p8pwtQ3hwsBP5tIlpWJ9bQiI77YSYEerRY9rSD6Qetz7jW
 a0XeMWYOzvKb0UYts+72ItcDqizP1s5f/hP3+3c=
X-Google-Smtp-Source: APXvYqwapJe37jE/4lhBc6kH1tXAFjrIeaB0k/BUQ460dna8oMa+kbNG6v5UGJn3iIaj3pBlWrAErH47zmpIn3B1zDI=
X-Received: by 2002:a5e:981a:: with SMTP id s26mr1897434ioj.90.1553602282436; 
 Tue, 26 Mar 2019 05:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190325212446.25795-1-joe@perches.com>
In-Reply-To: <20190325212446.25795-1-joe@perches.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 26 Mar 2019 14:18:33 +0200
Message-ID: <CAP6Zq1g62wiDTd9zn5dhwsfK6Rr52+ishU_=cO+G0Rm3Cs7kbQ@mail.gmail.com>
Subject: Re: Bad file pattern in MAINTAINERS section 'ARM/NUVOTON NPCM
 ARCHITECTURE'
To: Joe Perches <joe@perches.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: multipart/alternative; boundary="0000000000002ac0b30584fe381f"
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
X-List-Received-Date: Tue, 26 Mar 2019 12:11:29 -0000

--0000000000002ac0b30584fe381f
Content-Type: text/plain; charset="UTF-8"

Hi Joe,

Thanks for sending the notice.

We will send a fix this week.

Tomer

On Mon, 25 Mar 2019 at 23:24, Joe Perches <joe@perches.com> wrote:

> A file pattern line in this section of the MAINTAINERS file in linux-next
> does not have a match in the linux source files.
>
> This could occur because a matching filename was never added, was deleted
> or renamed in some other commit.
>
> The commits that added and if found renamed or removed the file pattern
> are shown below.
>
> Please fix this defect appropriately.
>
> 1:
> ---------------------------------------------------------------------------
>
> linux-next MAINTAINERS section:
>
>         1893    ARM/NUVOTON NPCM ARCHITECTURE
>         1894    M:      Avi Fishman <avifishman70@gmail.com>
>         1895    M:      Tomer Maimon <tmaimon77@gmail.com>
>         1896    R:      Patrick Venture <venture@google.com>
>         1897    R:      Nancy Yuen <yuenn@google.com>
>         1898    R:      Brendan Higgins <brendanhiggins@google.com>
>         1899    L:      openbmc@lists.ozlabs.org (moderated for
> non-subscribers)
>         1900    S:      Supported
>         1901    F:      arch/arm/mach-npcm/
>         1902    F:      arch/arm/boot/dts/nuvoton-npcm*
> -->     1903    F:      include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>         1904    F:      drivers/*/*npcm*
>         1905    F:      Documentation/devicetree/bindings/*/*npcm*
>         1906    F:      Documentation/devicetree/bindings/*/*/*npcm*
>
> 2:
> ---------------------------------------------------------------------------
>
> The most recent commit that added or modified file pattern
> 'include/dt-bindings/clock/nuvoton,npcm7xx-clks.h':
>
> commit 6a498e06ba22872d3a27cc0dae77b9314b1de48b
> Author: Brendan Higgins <brendanhiggins@google.com>
> Date:   Thu Aug 17 09:44:32 2017 -0700
>
>     MAINTAINERS: Add entry for the Nuvoton NPCM architecture
>
>     Add maintainers and reviewers for the Nuvoton NPCM architecture.
>
>     Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>     Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>     Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> 3:
> ---------------------------------------------------------------------------
>
> No commit with file pattern
> 'include/dt-bindings/clock/nuvoton,npcm7xx-clks.h' was found
>

--0000000000002ac0b30584fe381f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joe,<div><br></div><div>Thanks for sending the notice.<=
/div><div><br></div><div>We will send a fix this week.</div><div><br></div>=
<div>Tomer</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 25 Mar 2019 at 23:24, Joe Perches &lt;<a href=3D"ma=
ilto:joe@perches.com">joe@perches.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">A file pattern line in this section of=
 the MAINTAINERS file in linux-next<br>
does not have a match in the linux source files.<br>
<br>
This could occur because a matching filename was never added, was deleted<b=
r>
or renamed in some other commit.<br>
<br>
The commits that added and if found renamed or removed the file pattern<br>
are shown below.<br>
<br>
Please fix this defect appropriately.<br>
<br>
1: ------------------------------------------------------------------------=
---<br>
<br>
linux-next MAINTAINERS section:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1893=C2=A0 =C2=A0 ARM/NUVOTON NPCM ARCHITECTURE=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1894=C2=A0 =C2=A0 M:=C2=A0 =C2=A0 =C2=A0 Avi Fi=
shman &lt;<a href=3D"mailto:avifishman70@gmail.com" target=3D"_blank">avifi=
shman70@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1895=C2=A0 =C2=A0 M:=C2=A0 =C2=A0 =C2=A0 Tomer =
Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon=
77@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1896=C2=A0 =C2=A0 R:=C2=A0 =C2=A0 =C2=A0 Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">ventu=
re@google.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1897=C2=A0 =C2=A0 R:=C2=A0 =C2=A0 =C2=A0 Nancy =
Yuen &lt;<a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google=
.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1898=C2=A0 =C2=A0 R:=C2=A0 =C2=A0 =C2=A0 Brenda=
n Higgins &lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank=
">brendanhiggins@google.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1899=C2=A0 =C2=A0 L:=C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlab=
s.org</a> (moderated for non-subscribers)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1900=C2=A0 =C2=A0 S:=C2=A0 =C2=A0 =C2=A0 Suppor=
ted<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1901=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 arch/a=
rm/mach-npcm/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1902=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 arch/a=
rm/boot/dts/nuvoton-npcm*<br>
--&gt;=C2=A0 =C2=A0 =C2=A01903=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 include/=
dt-bindings/clock/nuvoton,npcm7xx-clks.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1904=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 driver=
s/*/*npcm*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1905=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 Docume=
ntation/devicetree/bindings/*/*npcm*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1906=C2=A0 =C2=A0 F:=C2=A0 =C2=A0 =C2=A0 Docume=
ntation/devicetree/bindings/*/*/*npcm*<br>
<br>
2: ------------------------------------------------------------------------=
---<br>
<br>
The most recent commit that added or modified file pattern &#39;include/dt-=
bindings/clock/nuvoton,npcm7xx-clks.h&#39;:<br>
<br>
commit 6a498e06ba22872d3a27cc0dae77b9314b1de48b<br>
Author: Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins@google.com" ta=
rget=3D"_blank">brendanhiggins@google.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Aug 17 09:44:32 2017 -0700<br>
<br>
=C2=A0 =C2=A0 MAINTAINERS: Add entry for the Nuvoton NPCM architecture<br>
<br>
=C2=A0 =C2=A0 Add maintainers and reviewers for the Nuvoton NPCM architectu=
re.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Brendan Higgins &lt;<a href=3D"mailto:brendanh=
iggins@google.com" target=3D"_blank">brendanhiggins@google.com</a>&gt;<br>
=C2=A0 =C2=A0 Reviewed-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gma=
il.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Reviewed-by: Avi Fishman &lt;<a href=3D"mailto:avifishman70@g=
mail.com" target=3D"_blank">avifishman70@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb=
.de" target=3D"_blank">arnd@arndb.de</a>&gt;<br>
<br>
=C2=A0MAINTAINERS | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
3: ------------------------------------------------------------------------=
---<br>
<br>
No commit with file pattern &#39;include/dt-bindings/clock/nuvoton,npcm7xx-=
clks.h&#39; was found<br>
</blockquote></div>

--0000000000002ac0b30584fe381f--
