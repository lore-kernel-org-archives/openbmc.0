Return-Path: <raltherr@google.com>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vD86P6zH0zDq96
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 03:41:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ieFGVqCG"; 
 dkim-atps=neutral
Received: by mail-wm0-x22e.google.com with SMTP id 196so27405080wmm.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8R/9XursZrIJvGCpzQxjbMk8ynWbgNJ775tXKj33niM=;
 b=ieFGVqCGSHwCPMpCGFtB7Q75ahw4eB6CELqRr07HV96FN4tbWlrm/yIeWW3gLOKct+
 YzRlOtyqx2zMktGM5OnatGTz+p2PTWtywAOyBhEZ63XXvuG5PelRP11RVqdjhL4mkOdB
 CCOGeG9Nb31ee91/rh3l9nOv4cS5N5m1D71yH9fx4OC4kaUMQiIqHZqGp5zAmG6L/ILN
 zhukj5SQHnSbz6ypDd65kZH2DAOguAn1X+x2pNOptlN5i8oe2aJc1lmi0W4D9S/dE56z
 o4QJxMvvoUS7Vb738BQIVudepJn+yIFnqyfswd64bqJoNSrIgzf9sn2ZSiKfd9lt/tex
 +OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8R/9XursZrIJvGCpzQxjbMk8ynWbgNJ775tXKj33niM=;
 b=W9oDplopLCc1RARjcAF/AkB0nodCUtkim05RQ7nsmH/kxmfWAM+hKpBbWAN5tf6XJc
 dZTLXF/bd1oFSFOfiOLLqxL3HSgVObW0rhBrv5eR42zNfjCAAh0UMH9ww+gtnx0QIVtr
 hLjkkJJGd7nPEepMmTcqW3qKbP6eKUUoPpnrXe0FwkvYBk3U2oBtVFQNH7yBOAXsHgF4
 K+z1J5XroqiG/SezupNH0pCyxBlEkMorJzBiaUN8fgoyI1konh7ntLwVtfJAQQiFlKMm
 T2dqsSmmbzfWrL/4hTgxF25RtqvUlcwvQVKcAFEVbzejexzdUokZ0psUs4kJbuNdB2eq
 JDhQ==
X-Gm-Message-State: AIkVDXLY6On61/djIK09W3wUEMTTU8ZHNcHn5DLdjKZuDo/EcEiXO6HzfBLJf0O+qbMMMB5UpHeKSaRFmBBOe7Wi
X-Received: by 10.28.214.137 with SMTP id n131mr3508548wmg.120.1485967304563; 
 Wed, 01 Feb 2017 08:41:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.158.15 with HTTP; Wed, 1 Feb 2017 08:41:43 -0800 (PST)
In-Reply-To: <4621485941510@webcorp02f.yandex-team.ru>
References: <20170201014414.31868-1-raltherr@google.com>
 <4621485941510@webcorp02f.yandex-team.ru>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Feb 2017 08:41:43 -0800
Message-ID: <CAPLgG=m=K3CWvViASn26iCiHMsr0WRfakuCgum8dXOCPJE43MQ@mail.gmail.com>
Subject: Re: [PATCH linux v4] dts: Minimal device tree for Quanta Q71L BMC
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1146724856f10105477ab982
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
X-List-Received-Date: Wed, 01 Feb 2017 16:41:51 -0000

--001a1146724856f10105477ab982
Content-Type: text/plain; charset=UTF-8

I won't be using those in our deployment scenario so adding support for
them is low on my list.  If you or anyone else is interested in writing
drivers for the VGA and USB device peripherals, I'll gladly provide
direction and review patches.

On Wed, Feb 1, 2017 at 1:31 AM, Anton D. Kachalov <mouse@yandex-team.ru>
wrote:

> Hello, Rick.
>
> 01.02.2017, 04:44, "Rick Altherr via openbmc" <openbmc@lists.ozlabs.org>:
> > Supports:
> >   - BMC console UART
> >   - BMC boot flash
> >   - host boot flash
> >   - host virtual UART (host console)
> >
>
> Have you plans to add support for KVM and Virtual Media through the Aspeed?
>

--001a1146724856f10105477ab982
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I won&#39;t be using those in our deployment scenario so a=
dding support for them is low on my list.=C2=A0 If you or anyone else is in=
terested in writing drivers for the VGA and USB device peripherals, I&#39;l=
l gladly provide direction and review patches.</div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Wed, Feb 1, 2017 at 1:31 AM, Anton D.=
 Kachalov <span dir=3D"ltr">&lt;<a href=3D"mailto:mouse@yandex-team.ru" tar=
get=3D"_blank">mouse@yandex-team.ru</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hello, Rick.<br>
<br>
01.02.2017, 04:44, &quot;Rick Altherr via openbmc&quot; &lt;<a href=3D"mail=
to:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;:<br>
<span class=3D"">&gt; Supports:<br>
&gt; =C2=A0=C2=A0- BMC console UART<br>
&gt; =C2=A0=C2=A0- BMC boot flash<br>
&gt; =C2=A0=C2=A0- host boot flash<br>
&gt; =C2=A0=C2=A0- host virtual UART (host console)<br>
&gt;<br>
<br>
</span>Have you plans to add support for KVM and Virtual Media through the =
Aspeed?<br>
</blockquote></div><br></div>

--001a1146724856f10105477ab982--
