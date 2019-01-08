Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XE1yr7jO"; 
 dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Z6QB0fP0zDqNQ
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 09:29:47 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id q8so3349952qke.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 14:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrQmfc7QQrypUxlc/3X2adXZSduLMQPEjSUqMI6f+6w=;
 b=XE1yr7jOLrQpgSLeoyhLO8XWKHY0MGbz+rw70W2zyb+mnyfKnrA/B/KjHiCOfRSzTs
 CYyJiCkOBtc+itxTjBfUAaLtDqFwoJLsA7yPO9oJI1/Tv7FHwVeesMYXjQaJNYWGzyzN
 hT/0AVGSPNaL02W77cjKoPHgO9uczdYGydkfYzPzodZSqFcLPczsf/9BQ7QBeJLF7CR4
 Hw1vq7peJlNAV3KTqp35J8BbPtwdeJOfmHsV9rsRtG40Wv19+ltINJmJwue5/c+CWC40
 o6RpRc3vqbk/0FaCFyiNag2Usqj3zKXkqMjPyzzheyFX0S3nJFW8Xsvktf+wPtlDIlRv
 1kXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrQmfc7QQrypUxlc/3X2adXZSduLMQPEjSUqMI6f+6w=;
 b=Q1OPLgsG0zOSn3xP1x7SbFHa2M2m84tRpuV9hhqpkcwxPSYTUt2dLIShyMHle0Enh8
 svAdr6B2n82nY0SHHaPAiGzq1QTLgVvLPOeAR2yzevoIKrqDLd4qj5BRdYCP+u6JxVmc
 dJrQkE+1qitxZ+MTctIemYdmNSy8V5fOhFdB2cPNIFS/e58f2VlGmZaroTK5eW31nblU
 8kxBOq0QmRVAhCDhBlm/KQlfZlEpIf/cQfxlv33FeIvy9Yf0GnG7Vva8tE2vK7iVlhpA
 5SO/0Iwh27LO4oa6oEpX/I5SiWbrN4arzGSP9BvD2dRT7Oj3Qz7RECYI4SdeyG7zOL1D
 ukMg==
X-Gm-Message-State: AJcUukfWjDQs7GAjprYE1J0nFFBWGnDCtvDuVb7ymgTxnT5nXk8eV8OT
 SrN5dd0S5EP5dpGIxicsXPTWY+FyTCqi3jCFOXGgQQ==
X-Google-Smtp-Source: ALg8bN52nMuOkYPl65rLlFzFPDM+CbISCqLWX7wFLpkUs5DNprt5JGSndLadHd0nDxY7IYpEAQrEbH2BqXup0WdAPMc=
X-Received: by 2002:a37:c51b:: with SMTP id p27mr3106277qki.86.1546986584651; 
 Tue, 08 Jan 2019 14:29:44 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notxXfcvs0SfBLoR5MCqt+AHA-V+7j4TRWmaKgxm0pqUFHw@mail.gmail.com>
In-Reply-To: <CAO=notxXfcvs0SfBLoR5MCqt+AHA-V+7j4TRWmaKgxm0pqUFHw@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 8 Jan 2019 14:29:08 -0800
Message-ID: <CADKL2t6aW8CzLYX_DdN6-_ueSkeVSLsoA=ymwn0_Wr-U97cNDQ@mail.gmail.com>
Subject: Re: Unable to override file by machine for
 phosphor-ipmi-fru-properties
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary="000000000000da363c057ef9e11f"
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
X-List-Received-Date: Tue, 08 Jan 2019 22:29:55 -0000

--000000000000da363c057ef9e11f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 2:22 PM Patrick Venture <venture@google.com> wrote:

> With phosphor-ipmi-fru-properties, if we set the
> FILESEXTRAPATHS_prepend to be machine specific, it can't find the file
> and doesn't add the path, but if we leave off the machine override,
> it'll find the file and use it.
>
>
> https://github.com/openbmc/meta-ingrasys/blob/master/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%25.bbappend
>
> This specifies that for zaius, it should prepend with this path and
> use this override file.
>
> Deleted the extra-properties.yaml file from the original recipe and
> tried building zaius:
>
> WARNING: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Failed
> to fetch URL file://extra-properties.yaml, attempting MIRRORS if
> available
> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
> failure: Unable to find file file://extra-properties.yaml anywhere.
> The paths that were searched were:
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/df-openpower
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/df-openpower
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/df-openpower
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/gbmc
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/gbmc
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/gbmc
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/x86-64
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/x86-64
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/x86-64
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/
>
> /usr/local/google/git/workspaces/building_122514933/meta-phosphor/recipes-phosphor/ipmi/files/
>     /usr/local/google/git/workspaces/building_122514933/build/downloads
> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher
> failure for URL: 'file://extra-properties.yaml'. Unable to fetch URL
> from any source.
> ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Function
> failed: base_do_fetch
>
> Ok, it can't find it.  But when I delete the machine override on the
> line, basically delete "zaius" it then finds the file and uses the
> zaius file correctly.  This behavior is baffling me, does anybody have
> any ideas?  Has anyone seen this behavior?
>
> Patrick
>

That's because this is a native package. Native packages don't set the
MACHINE within the overrides variable so there's no way to tell what
machine they're being built for.

--000000000000da363c057ef9e11f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 8, 2019 at 2:22 PM Patrick Ve=
nture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@g=
oogle.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">With phosphor-ipmi-fru-properties, if w=
e set the<br>
FILESEXTRAPATHS_prepend to be machine specific, it can&#39;t find the file<=
br>
and doesn&#39;t add the path, but if we leave off the machine override,<br>
it&#39;ll find the file and use it.<br>
<br>
<a href=3D"https://github.com/openbmc/meta-ingrasys/blob/master/meta-zaius/=
recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%25.bbappend" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/meta-ingrasys/blob/mas=
ter/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties%25.bbappe=
nd</a><br>
<br>
This specifies that for zaius, it should prepend with this path and<br>
use this override file.<br>
<br>
Deleted the extra-properties.yaml file from the original recipe and<br>
tried building zaius:<br>
<br>
WARNING: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Failed<br>
to fetch URL file://extra-properties.yaml, attempting MIRRORS if<br>
available<br>
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher<br>
failure: Unable to find file file://extra-properties.yaml anywhere.<br>
The paths that were searched were:<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/df-openpower<br=
>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/df-openpower<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/files/df-openpower<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/gbmc<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/gbmc<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/files/gbmc<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/files/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/x86-64<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/x86-64<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/files/x86-64<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties-1.0/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/phosphor-ipmi-fru-properties/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/meta-phos=
phor/recipes-phosphor/ipmi/files/<br>
=C2=A0 =C2=A0 /usr/local/google/git/workspaces/building_122514933/build/dow=
nloads<br>
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Fetcher<br>
failure for URL: &#39;file://extra-properties.yaml&#39;. Unable to fetch UR=
L<br>
from any source.<br>
ERROR: phosphor-ipmi-fru-properties-native-1.0-r1 do_fetch: Function<br>
failed: base_do_fetch<br>
<br>
Ok, it can&#39;t find it.=C2=A0 But when I delete the machine override on t=
he<br>
line, basically delete &quot;zaius&quot; it then finds the file and uses th=
e<br>
zaius file correctly.=C2=A0 This behavior is baffling me, does anybody have=
<br>
any ideas?=C2=A0 Has anyone seen this behavior?<br>
<br>
Patrick<br></blockquote><div><br></div>That&#39;s because this is a native =
package. Native packages don&#39;t set the MACHINE within the overrides var=
iable so there&#39;s no way to tell what machine they&#39;re being built fo=
r.</div>
</div>

--000000000000da363c057ef9e11f--
