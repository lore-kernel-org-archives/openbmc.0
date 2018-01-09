Return-Path: <yuenn@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22a; helo=mail-vk0-x22a.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HRpRBmNs"; 
 dkim-atps=neutral
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFt8d2pYkzF0R2
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 11:20:48 +1100 (AEDT)
Received: by mail-vk0-x22a.google.com with SMTP id o73so8420385vkd.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jan 2018 16:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dyOSMReWA5+4C5fzip/OoXZE/auZ333rEfuyLClq5Tg=;
 b=HRpRBmNs/Q9mLfH40EvrvEKVolgcfmwgnykYAz13+ZgIu4xjTSXKuYO29C664WpNrz
 fy7S8inWUkXrHGeL0tb2XoeuRqPJIRjBzqgRmgDci1MuMWlzfHAStnusIjOn6tW65Hbb
 KiSAb4N6oMdBl5z3Rs1xrtJbbd8bKY3GQtgw9tnA+RreP1jvnB/DtldmFyGMNLQvr9YU
 An10AFl0GULUoIWekZVhTkZKrzaKHfamQEXkGWf6ONuT1ZR3iQNIzNBpl/EU91AYUchl
 iZxuZ8EdIdVg+7DPPEZD3vmQgBFrOcaDQi+hh+dRe8XhiC9nO9mAMCwzQudeJ1S1CAin
 QTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dyOSMReWA5+4C5fzip/OoXZE/auZ333rEfuyLClq5Tg=;
 b=WUHWfZz0bdxtQJ2ziuH5UOeGp5JV82ZIfm9ANP3RTCgiF2CwKlo8AV7yBNtGaVcQTM
 2uGy3zoWhhdd4fx+7n+p6pW4iiOVkkhQ5NtC06Qbu4Z+49Pkb80h5FtWfop5p+Dfqoup
 lhVTSnDH/SKexF+NwkfjMVQPxxQ0fkfTGMQj2nV2TWTHfxEfmt/7UFq0jEQmCNOhD9X/
 h1Hnt60QCdda2+M+dSRLJOMCSPVrDbJ3XjZ3eSXWsRKbCRvvZLA7yytaHTgLWR/M5w7P
 qfUwDk9bQAx3kyyiYVNVdlHiijO16q7I+hRRXENpGeLRsdPguAAgaoENeZOJaKOJDcxg
 i9XQ==
X-Gm-Message-State: AKwxytd6x9I45bqkAL0scN+92Zod5PQF8Ru6XLhH1kUOoyjBhJPUledF
 BzGE16vXFBMt+4UChpfcO1BIqpmkWwLEF9gHsvrs/w==
X-Google-Smtp-Source: ACJfBosatRnll19OFm9DjLvh+lR8RLx9IkiJ4ZSr9MIz2+icGLcbT/K80D/QGOEG52V5xBjiqe6yrO57CZoUJGFpLNs=
X-Received: by 10.31.9.21 with SMTP id 21mr11951683vkj.88.1515457245651; Mon,
 08 Jan 2018 16:20:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.147.212 with HTTP; Mon, 8 Jan 2018 16:20:05 -0800 (PST)
In-Reply-To: <16379b3bfc8a4a1ca02a04aa49a60628@ausx13mpc109.AMER.DELL.COM>
References: <16379b3bfc8a4a1ca02a04aa49a60628@ausx13mpc109.AMER.DELL.COM>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 8 Jan 2018 16:20:05 -0800
Message-ID: <CADfYTpG-=xveo0Kuc+V0WfTD+aiEiy_iMTJCxxROy+yW01L3fw@mail.gmail.com>
Subject: Re: systemd update for openbmc
To: Balaji.B.Rao@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1144116ccd32ef05624ce232"
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
X-List-Received-Date: Tue, 09 Jan 2018 00:20:50 -0000

--001a1144116ccd32ef05624ce232
Content-Type: text/plain; charset="UTF-8"

I think systemd is a component that OpenBMC picks up when it updates
Yocto.  I think there was some rumblings about updating to Yocto 2.4.  I
don't know what version of systemd is in it though.

----------
Nancy

On Fri, Jan 5, 2018 at 9:53 AM, <Balaji.B.Rao@dell.com> wrote:

> systemd in openbmc repo seems a little outdated making it unable to build
> with GNU c++ compilers. Is there a plan to update it? Particularly
> interesting is the following fix,
>
>
>
> https://github.com/systemd/systemd/commit/aa3288505569433200bfa311ff12d2
> 9684a14374
>
>
>
> Will systemd be updated anytime soon?
>
>
>
> Thanks
>
> Balaji
>

--001a1144116ccd32ef05624ce232
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think systemd is a component that OpenBMC picks up when =
it updates Yocto.=C2=A0 I think there was some rumblings about updating to =
Yocto 2.4.=C2=A0 I don&#39;t know what version of systemd is in it though.<=
/div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></di=
v>
<br><div class=3D"gmail_quote">On Fri, Jan 5, 2018 at 9:53 AM,  <span dir=
=3D"ltr">&lt;<a href=3D"mailto:Balaji.B.Rao@dell.com" target=3D"_blank">Bal=
aji.B.Rao@dell.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-1858959768647120885WordSection1">
<p class=3D"MsoNormal">systemd in openbmc repo seems a little outdated maki=
ng it unable to build with GNU c++ compilers. Is there a plan to update it?=
 Particularly interesting is the following fix,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/systemd/systemd/commit=
/aa3288505569433200bfa311ff12d29684a14374" target=3D"_blank">https://github=
.com/systemd/<wbr>systemd/commit/<wbr>aa3288505569433200bfa311ff12d2<wbr>96=
84a14374</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Will systemd be updated anytime soon?<u></u><u></u><=
/p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
<p class=3D"MsoNormal">Balaji<u></u><u></u></p>
</div>
</div>

</blockquote></div><br></div>

--001a1144116ccd32ef05624ce232--
