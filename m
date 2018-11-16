Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n/8u2x6N"; 
 dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xW5Q1YjQzF3mm
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 08:07:22 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id 96so9320952wrb.2
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 13:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUGkrHjUHtLmv9jDAJVUTnjTOx8xtwrUm2t+48zMLMk=;
 b=n/8u2x6NniwpN1jUH9lTZMSEDmazH7LX6aqSUGExSXriVLxJkpz/IEvvezBISd3ebn
 r/GgBJvQbZWQRCa8Piw1vCwqQZ0Pe9zw+/5iF3/AIG3aVIBR5aNMtzbZjogYQDgrNNqg
 T27TEaxJ9meop7mdb632SyEfZNGIyF8qa8z0qhEVtYDiI4awqftj6vRAFEHbfvjYsJ6y
 6XJq4VejQZXM3DgOp7T+8/iVTzfUEvbalE6h0GbIk+Ed+CL+SS1+YYDjqDIo78ksbcmB
 Jc3NEpD7DDwkyItL8am4pbShFySwHKb3pU5wKGMrCKb6gX6IyCqj2lSBRKZ5qlNNL4rn
 2ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUGkrHjUHtLmv9jDAJVUTnjTOx8xtwrUm2t+48zMLMk=;
 b=pEZR2KzOMcoQ2w3cFZG1AkucKLsxzlOM8B8yZlTw1Y7l4+HRezQFeQFlgbo6p3W280
 2+DqgojO7bB15agDiqgHhVjcdIk5jHBGack9PQgOdkE460w+vAcZpMmfmo1LVsTfM3z2
 gb/9kDOWyvVLZg7tW0eTwr5zyUVFNRYFYDi/vy1XKpYPlVJt+26G0ZJ4uRgP+80+qP38
 l+GxikfnBj2ZgDbdDtrLCS5mSJCKtqkgU0hHrnmktF7AvY2RxgXnajiyse4EYJXwZKut
 NMFbPmByC3Xqx/gRQO7hF+MOcVk7JHZuMI48ZqsTgTRndoVbB7aC2AOQfX0XLrQ6Rd1H
 DSlw==
X-Gm-Message-State: AGRZ1gItztQvOnVhI3/XffW4YqVVaOEASzFT3Hlf5CB7HlAVY+kLbeX2
 RLcWW1T/pRUHUS4iYwJja87FHffYZ4XbD9o/d18XsA==
X-Google-Smtp-Source: AJdET5c/EGZHvFjFMf9OAf/FnXqGygWcJ+FmfKmSU/LNN+y0rAlIXlcHuAqFvd14+lGq5CZgfc/dEJEDelHkxNk0P5Y=
X-Received: by 2002:adf:c647:: with SMTP id
 u7-v6mr10504957wrg.174.1542402438460; 
 Fri, 16 Nov 2018 13:07:18 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
In-Reply-To: <BA3510D9-333A-40DB-9D03-43A5A2B2D963@fb.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 16 Nov 2018 16:07:06 -0500
Message-ID: <CABoTLcTpMY4StimKijR4LmuSuc0dnnfxeTN=hv13WYghsOFcSw@mail.gmail.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
To: sdasari@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com, 
 gmills@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="000000000000725856057ace8dea"
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
X-List-Received-Date: Fri, 16 Nov 2018 21:07:22 -0000

--000000000000725856057ace8dea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sai

I guess this is a question of # of small repos vs a single large repo with
a lot of "stuff" in it. I generally prefer fewer (yet larger) repos vs. the
overhead of managing multiple small repos.

Oskar.

On Fri, Nov 16, 2018 at 3:58 PM Sai Dasari <sdasari@fb.com> wrote:

>  Is there a good place in OpenBMC to post that? Maybe the docs repo? It's
> 4 PDF files with < 10 MiB in total. Having this information publicly post=
ed
> by them would make development much easier.
>
> Great to have schematics along with the source code for better
> understanding. Quick thought to scale this for various machiens. Since
> these schematics are specific to a machine, how about sharing it in a
> machine specific repo instead of common =E2=80=98docs=E2=80=99 repo? Migh=
t help to provide
> more context for the machine hardware.
>
>
>

--000000000000725856057ace8dea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sai<div><br></div><div>I guess this is a question of # =
of small repos vs a single large repo with a lot of &quot;stuff&quot; in it=
. I generally prefer fewer (yet larger) repos vs. the overhead of managing =
multiple small repos.</div><div><br></div><div>Oskar.</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 16, 2018 at 3:58 PM Sai D=
asari &lt;<a href=3D"mailto:sdasari@fb.com">sdasari@fb.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-3789556516558748915WordSection1">
<p class=3D"MsoNormal">=C2=A0Is there a good place in OpenBMC to post that?=
 Maybe the docs repo? It&#39;s 4 PDF files with &lt; 10 MiB in total. Havin=
g this information publicly posted by them would make development much easi=
er.<u></u><u></u></p>
<p class=3D"MsoNormal">Great to have schematics along with the source code =
for better understanding. Quick thought to scale this for various machiens.=
 Since these schematics are specific to a machine, how about sharing it in =
a machine specific repo instead of
 common =E2=80=98docs=E2=80=99 repo? Might help to provide more context for=
 the machine hardware.<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>

</blockquote></div>

--000000000000725856057ace8dea--
