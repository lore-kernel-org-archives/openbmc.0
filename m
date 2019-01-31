Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2a; helo=mail-yw1-xc2a.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ucfjXrtt"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2a.google.com (mail-yw1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ql374XBnzDqT6
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 13:45:36 +1100 (AEDT)
Received: by mail-yw1-xc2a.google.com with SMTP id h193so716252ywc.4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 18:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=heyBuXEfc87aWK4/QVH96A9FC8fgPOBHYI8tfyFkxX0=;
 b=ucfjXrttPAchBiYjf4o6KiGyKScHAflmcM54hjN6xv4v5jJjaUc3oBhvhZpIJCUnE7
 9RGIugQ49cCiIdNBTYwk3v5wYjwYMPYK/r8ZzsK+pRZJJQm2/ApXQlaSX6Q7FTX1QiBO
 D2I2EjmKSb/e0HWZEYUun6C/8dAoTVp3/kCZB3xpi8gozbWBqrysAIozIFbm0QXhWPGd
 dWOI3bXSQN87hQJ+BIhIrTiLWyUnIcH4sou8H44XTzP5N73YoAjUdD4a8Q2yobg3dgZk
 H6O0osP5tNUWXPqU0QBJAclMKgzAbjN8uBVDXIAVu1cNplfncJ15ILQZAQ69RoJlJay2
 cGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=heyBuXEfc87aWK4/QVH96A9FC8fgPOBHYI8tfyFkxX0=;
 b=DxUEaPj4OgPfADAH9wrRDlYlv1G3PLyt/nJKNm/qe3tV+nG0/7udmsEE4kZVyt/A59
 FJtv+1ST10iXkzljf33fN9qZVa850pAoMdFpo9mBp9jCQCIxYSkby9AOt6Wt4bAsrQJ7
 Zu7bI3wfYoUZfCdJCmEd35K30YzQzqTwFUI+nGkKgdVYYWAYNbCip7o0muexV1bsPd62
 z9ILbIw9qVEOn/BN6zA7o8N9Ycx16OQSCVH+9JfXmZeeVkKEt/JBu3RWhWJ+vGD/RgLG
 USy28Ud8KichfnlM+uSk4Va39ba6A58lYFsPJ1XOlqZ15Bd5Sot/qoUd5tUzqHDM60r+
 Cm1A==
X-Gm-Message-State: AJcUukeix80MoLwCLWof7sGNANXUM37P6pDzg2pxqbnwgUA6nxRxxY0g
 KuzcWwfRhks+gq9rEcwn3T1ZCGSwuUO6SL6ZqdI=
X-Google-Smtp-Source: ALg8bN65Gw3INyBMeacv75mXlbyO2yxzBJ3mV2di5SvVtCIYOoCFGzbGQxDb46cfBGBTytNX51eNx+Hvj3cOSLknHec=
X-Received: by 2002:a81:441f:: with SMTP id r31mr31777747ywa.48.1548902734231; 
 Wed, 30 Jan 2019 18:45:34 -0800 (PST)
MIME-Version: 1.0
References: <9F16AAB7177A1645BBAFF66396C46B0E7A2DD226@CNMAILEX03.lenovo.com>
In-Reply-To: <9F16AAB7177A1645BBAFF66396C46B0E7A2DD226@CNMAILEX03.lenovo.com>
From: James Mihm <james.mihm@gmail.com>
Date: Wed, 30 Jan 2019 18:44:57 -0800
Message-ID: <CADy_Pt0JkAXm+9xGQ+pyKLs-DqsUnGgtDyWy3aQn+2a0PFzLfA@mail.gmail.com>
Subject: Re: BSD-3 license is allowed in metadata
To: Duke KH Du <dukh@lenovo.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000043febb0580b805a7"
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
X-List-Received-Date: Thu, 31 Jan 2019 02:45:40 -0000

--00000000000043febb0580b805a7
Content-Type: text/plain; charset="UTF-8"

I'll take a stab at answering your question.

Yes, you can use a BSD-3 license for your own metadata.

James.




On Wed, Jan 30, 2019, 7:58 AM Duke KH Du <dukh@lenovo.com wrote:

> Hi All,
>
>
>
> We observed in each metadata, there will be two kinds of license, MIT and
> Apache 2.0.
>
> If MIT and Apache2.0 is replaced by BSD-3 license in our own metadata, it
> that allowed by OpenBMC?
>
>
>
> Could you kindly provide the answer for this license question?
>
>
>
> Thanks.
>

--00000000000043febb0580b805a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ll take a stab at answering your=C2=A0question.=
=C2=A0</div><div><br></div><div>Yes, you can use a BSD-3 license for your o=
wn metadata.</div><div><br></div><div>James.<br></div><div><br><div><div><b=
r></div><div><br></div></div></div></div><div dir=3D"auto"></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jan 30, 2019, 7:58 AM Duke KH=
 Du &lt;<a href=3D"mailto:dukh@lenovo.com" target=3D"_blank">dukh@lenovo.co=
m</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_7324564975412010052gmail-m_-2445045065818191674m_-817=
0336599987891207WordSection1">
<p class=3D"MsoNormal">Hi All,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We observed in each metadata, there will be two kind=
s of license, MIT and Apache 2.0.<u></u><u></u></p>
<p class=3D"MsoNormal">If MIT and Apache2.0 is replaced by BSD-3 license in=
 our own metadata, it that allowed by OpenBMC?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Could you kindly provide the answer for this license=
 question?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--00000000000043febb0580b805a7--
