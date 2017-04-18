Return-Path: <rburanyi@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6RXX550GzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 10:56:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xy9uHtli"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id z127so15672199pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 17:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=roD1WX7WcEH9GpVFoTBC7pCaTAEDivwJ/hFjrKDYFlw=;
 b=Xy9uHtlig0wtDU9f68/MKdiP27VS0lnCyB3WQ/lIKIGBwR+S2eyfp/nRscT5nBz6yX
 m7FKoBkcjnICkx4Ox2EY0aF98QoDA+N/XQYgg4pRylFBAWPr81cVgeHzoZPX6D7rlx0O
 Qy5CtJ3chv5EZyvfma0BGah+tZDsiN8A/rhu4QblHe44wCO+tRUwwsm+nokhmUTLUu+Y
 xW/ZZSFfpnX0lR6gTIChiekVMY2P0QEX01zgOIhMEZUQSy+qdeJSs9+T7MhHcYBxbN/v
 jhKt6/oPMfmcs9z2c+FsYZ8l6KMaVmRm3BUX0WjZ+fw5FVqZlT0CB/yvT5FTr06BfzCw
 ok2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=roD1WX7WcEH9GpVFoTBC7pCaTAEDivwJ/hFjrKDYFlw=;
 b=XZPIrYxKfqrdVe/UgP8FDsDv0PTsbkVeJjG+W7oLMGbagkq2Jg/37U5pXcHXjP/kWW
 gSqhROKqEbQPcog6WJJaiU6zy4PkvZnV4OxfDJWik+yR7sG7hSKPCuQ+ZT2EYmxFs7wl
 282lMn5LUkE13idWl8tMw0FN3bXvR2Tz98sEp5YnPVWU0QG52i8BzGmF51C6GAToEB8z
 ZZ3aZc8elCuKrx3fi0mF8qSuCCkSbmvll80p7Oxd2PcEyDHqvH5KHmsEfoQdD16m6UzK
 0+CpZKKQd4Vs10SjME+5bVrFnZhhpGwEvzdkNMhfigeihoF9RhF0dX8Ve6R0+j4e8jn3
 FEtA==
X-Gm-Message-State: AN3rC/5tjSXTY702mijgKlmTKl9PBN5JOgYtU049dooVW6x/wcj6rM3V
 xa1bIYTc6M2Ko1E0C5wG3/+0X1Xey79t
X-Received: by 10.98.211.142 with SMTP id z14mr15042926pfk.46.1492476985238;
 Mon, 17 Apr 2017 17:56:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.161.16 with HTTP; Mon, 17 Apr 2017 17:56:24 -0700 (PDT)
In-Reply-To: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
References: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
From: Robi Buranyi <rburanyi@google.com>
Date: Mon, 17 Apr 2017 17:56:24 -0700
Message-ID: <CANF=oU6TBUTjq6gyDUZ=TWWQ-h-M3Hzdii4iBbUPVvMx5qRpAA@mail.gmail.com>
Subject: Re: Running OpenBMC in qemu
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c14f9a28ac712054d666032
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
X-List-Received-Date: Tue, 18 Apr 2017 00:56:29 -0000

--94eb2c14f9a28ac712054d666032
Content-Type: text/plain; charset=UTF-8

why does it have to be qemuarm exactly? You can equally run qemux86(-64),
and shall see no difference in test results.

so what has been working for me all the time [and still works with a
relatively recent gbmc checkout]
- build for machine qeumux86-64
- and run a console-only mode: runqemu qemux86-64 ext4
qemuparams="-nographic"



On Mon, Apr 17, 2017 at 5:25 PM, Maxim Sloyko <maxims@google.com> wrote:

> Hi all!
>
> I've ran into troubles when I was trying to run OpenBMC image in qemu.
> It has been a while since I've done this, so I'm wondering if I'm
> missing something.
>
> I build it with:
>
> export TEMPLATECONF=meta-phosphor/conf
> source openbmc-env
> MACHINE=qemuarm bitbase obmc-phosphor-image
>
> With v1.0-stable openbmc/openbmc branch I get this output:
> http://pastebin.ca/3798183
>
> With the most recent version (master), I get very similar output,
> except that the error is now:
>
> VNC server running on ::1:5900
> vpb_sic_write: Bad register offset 0x2c
>
>
> In both cases the terminal I run this from basically just hangs.
>
> Am I missing something here?
>
> Thanks!
>
> --
> Maxim Sloyko
>

--94eb2c14f9a28ac712054d666032
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>why does it have to be qemuarm exactly? You can equal=
ly run qemux86(-64), and shall see no difference in test results.</div><div=
><br></div>so what has been working for me all the time [and still works wi=
th a relatively recent gbmc checkout]<div>- build for machine qeumux86-64<b=
r>- and run a console-only mode: runqemu qemux86-64 ext4 qemuparams=3D&quot=
;-nographic&quot;<div><p class=3D"m_-1722889749714429025gmail-p1"><span cla=
ss=3D"m_-1722889749714429025gmail-s2"><br></span></p></div></div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 17, 2017 =
at 5:25 PM, Maxim Sloyko <span dir=3D"ltr">&lt;<a href=3D"mailto:maxims@goo=
gle.com" target=3D"_blank">maxims@google.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi all!<br>
<br>
I&#39;ve ran into troubles when I was trying to run OpenBMC image in qemu.<=
br>
It has been a while since I&#39;ve done this, so I&#39;m wondering if I&#39=
;m<br>
missing something.<br>
<br>
I build it with:<br>
<br>
export TEMPLATECONF=3Dmeta-phosphor/<wbr>conf<br>
source openbmc-env<br>
MACHINE=3Dqemuarm bitbase obmc-phosphor-image<br>
<br>
With v1.0-stable openbmc/openbmc branch I get this output:<br>
<a href=3D"http://pastebin.ca/3798183" rel=3D"noreferrer" target=3D"_blank"=
>http://pastebin.ca/3798183</a><br>
<br>
With the most recent version (master), I get very similar output,<br>
except that the error is now:<br>
<br>
VNC server running on ::1:5900<br>
vpb_sic_write: Bad register offset 0x2c<br>
<br>
<br>
In both cases the terminal I run this from basically just hangs.<br>
<br>
Am I missing something here?<br>
<br>
Thanks!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Maxim Sloyko<br>
</font></span></blockquote></div><br></div>

--94eb2c14f9a28ac712054d666032--
