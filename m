Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="J29rPCi1"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v07V2v1dzF3B8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 05:45:26 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id j6so3246807edp.9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 10:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gp65qIXdqOEFAwwENzADE3zFDucqqDB1LmT2aZ0T86E=;
 b=J29rPCi1uxNC3uZ/MmJM2ec44vuo46+6kQyBSgB2rpkpG/qE9leTRVXxg+ihEbSldU
 3UxCFqSUWk98RNZZqaB/2dLQXJGTmWe9DoSzKalVgsxck27scyOLtq3X6Fr9MyK7J1sE
 5c7QYdEptp8cBygLvygImlBKRRz3Bn9Tx9BsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gp65qIXdqOEFAwwENzADE3zFDucqqDB1LmT2aZ0T86E=;
 b=MpnJqxwpRIMZECwtYX+0Lan30yV43tyWlLEKTcB6DdeBHOrbDsMGrqSKKdSvGRRqa4
 z+62DET9HTldIBqnHT386hDNgV44PbxwLud7bVB+0WPOjk1lTXd61yoPc+rZracjzm2z
 mzhSxg8f1037jFD4DNQwRlb1mdZtrkVG3WnvN84kRLtb3au/FvM/lUP+YS9byjNRGzJi
 lbjEdaL3lsmy+mOYAwAKRVjPgn+CAsRQ1LxXPYv+qS1bqMLDYWB32vGCdHMAlw8RtEkM
 27rJGXdE5yGhSvXS9lMjW/CJF9H5Yo3cX1i2TVjFKhiPNGvpDN2E/HL6sIUsEFTw9F4Q
 H4TQ==
X-Gm-Message-State: AGRZ1gJUpX+qjiktI/Sie8jOIWR1zXUXuVCjVbDbNcghPxdgE2JinzRd
 bJLsGHfWJYogFmx64vuPf2HtbPtuL+WyZP6z2HU+5A==
X-Google-Smtp-Source: AJdET5ekNajY+vZvIUNm7vGrKssuq3XHJLFDm6kuv2Lw2/d3IJBKq4dXJw8atbUGYIfk9owBJNvBqUyi5qdIb/IFtKU=
X-Received: by 2002:a17:906:c44a:: with SMTP id
 ck10-v6mr10463274ejb.25.1542048321549; 
 Mon, 12 Nov 2018 10:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
In-Reply-To: <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
From: Christian Svensson <blue@cmd.nu>
Date: Mon, 12 Nov 2018 19:45:10 +0100
Message-ID: <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
To: clg@kaod.org
Cc: Christian Svensson <bluecmd@google.com>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, andrew@aj.id.au
Content-Type: multipart/alternative; boundary="0000000000006ed2e1057a7c1abe"
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
X-List-Received-Date: Mon, 12 Nov 2018 18:45:26 -0000

--0000000000006ed2e1057a7c1abe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
On Mon, Nov 12, 2018 at 7:37 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> isn't QEMU using the helpers from :
>
>         include/qemu/host-utils.h
>
> which do about the same ?

Multdiv64 only takes unsigned ints, and while I'm not familiar with the
details of how that propagates to the division, it seems to result in
nonsensical values for negative inputs.
Before copying this logic here I looked for an equivalent for signed ints
but did not find any suitable one, and the expansion seemed simple enough.

You can see more details in
https://github.com/openbmc/qemu/issues/14#issuecomment-437692215.

--0000000000006ed2e1057a7c1abe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br>On Mon, Nov 12, 2018 at 7:37 PM C=
=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&g=
t; wrote:<br>&gt; isn&#39;t QEMU using the helpers from :<br>&gt;<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/qemu/host-utils.h<br>&gt;<br>&gt; which=
 do about the same ?<br><div><br></div><div>Multdiv64 only takes unsigned i=
nts, and while I&#39;m not familiar with the details of how that propagates=
 to the division, it seems to result in nonsensical values for negative inp=
uts.</div><div>Before copying this logic here I looked for an equivalent fo=
r signed ints but did not find any suitable one, and the expansion seemed s=
imple enough.</div><div><br></div><div>You can see more details in=C2=A0<a =
href=3D"https://github.com/openbmc/qemu/issues/14#issuecomment-437692215">h=
ttps://github.com/openbmc/qemu/issues/14#issuecomment-437692215</a>.</div><=
div><br></div></div></div>

--0000000000006ed2e1057a7c1abe--
