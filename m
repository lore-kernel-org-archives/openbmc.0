Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::232; helo=mail-wm0-x232.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lkgpoOUc"; 
 dkim-atps=neutral
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gdjj4l4GzF10S
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 02:16:50 +1000 (AEST)
Received: by mail-wm0-x232.google.com with SMTP id q8-v6so2638047wmq.4
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 09:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMe9UkEPKeJWMR6QJQQEoRKjOd6hk9hnf5Nrb8a9QKw=;
 b=lkgpoOUcND9uGg79Fqsi+xFpnOJ07CA2ZFzj55txXc0UV24PCSHVI4MlW8ru49Ielw
 YqyHD2sRaFanJMUXr7zBlzwNo/PTYBp5Ut6r8tYN7l4NSK0yplqAxvuX29pCmrPaxq/o
 mhc6p2WJJ3RWmPH0yWc9ndpjxXCZkVVNjgTUKwxre/JsDDhGMeB0SwCdOs4URH26zr19
 9+wAf3B/kB6+YpSChPiPNwJGvjVG1Uv+FxdVLtCcDeS3EXo/VRdOaVllZFXpa/yrejdd
 Pho2HeUMggAxJOBgRMg0BOUKLwALo7Yf6FO0tEmRg6Gv5L2AAvGgyOBzIBsyp3BGzcAo
 DTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMe9UkEPKeJWMR6QJQQEoRKjOd6hk9hnf5Nrb8a9QKw=;
 b=jdd30SZHFPWwtTDAV3HHyKc6u57QZ/PgUwFFeaVnxXAUS22hd31lIG3Qq1VzXeYELw
 xeUPhORqccb3uF6xulkgnMtyYrSxy/1SE54mjQonTLNjuwBhXOsLzOb/Z13S+g69Ru5M
 1Bzk5ilX7fpQ7SwA/DUyfU+SkbsCGw9MrV0sHGBIgonp0aS1Of+9mfEeSu+JSC8JSnxK
 0+qdHwK0YJQskiqpLFHzfJhHPCQrzSOmt2cShUg8zcnPW9RadDct38cy3sqSWlmW+IX/
 lwUR6bX0yvOdRUn/oNKA2v940MtwAUHt0U4MjZ21zoF1xG7lNuhc/dzgSsvmqPEc4OBi
 0+sA==
X-Gm-Message-State: AOUpUlGW6ZTI6sVh4i8oY1xY+RDB/aVFDmUyrBnv8NHYLTLCyceuozhD
 vnF3nlZe+eC6ChzO3lAsyY8ZpNWZ0w/N1nSihDJ5yoM4oGQ/Gg==
X-Google-Smtp-Source: AAOMgpfOlFf2WYDpg5buN9PCnzFufIx0WzxqAUSPapOK8WBEg1fMhRqUHWlL4yCpaKNHK7NYBIpkEB4CSsN9hz/cJMc=
X-Received: by 2002:a1c:3743:: with SMTP id
 e64-v6mr3152935wma.63.1533140206294; 
 Wed, 01 Aug 2018 09:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
In-Reply-To: <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 1 Aug 2018 12:16:35 -0400
Message-ID: <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
Subject: Re: UART Route setting
To: openbmc@lists.ozlabs.org
Cc: henbinchang@gmail.com
Content-Type: multipart/alternative; boundary="00000000000063d9f80572620512"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 16:16:59 -0000

--00000000000063d9f80572620512
Content-Type: text/plain; charset="UTF-8"

Hi Henbin

It's funny that you ask, since I had just started to look into the same
problem.

I'd like to change the UART routing on an AST2500 when a client connects to
the obmc-console-server. The use case is to dynamically connect the host's
UART to a UART owned by the BMC.

I was thinking of writing a kernel driver that would expose the config
options from the HICRA register on AST2500 as /sys files. Each file
represents the target UART1..5 and IO1..5. The file value represents the
source UART1..5 and IO1..5. Not all combinations are supported by the
Aspeed, so I'd add the necessary checks and error reporting into the code.

An alternative would be to just use /dev/mem to do that, but my
understanding is that default support for that is going away or has gone
away.

Oskar.


---------- Forwarded message ----------
> From: Henbin Chang <henbinchang@gmail.com>
> Date: Wed, Aug 1, 2018 at 12:11 AM
> Subject: UART Route setting
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>
>
> Hi,
>
> Could anyone know how to modify UART Route setting through dts, driver
> or other mechanism?
>
> Or I have to find a point to modify it e.g. board_init() in the u-boot.
>
> Thanks.
>

--00000000000063d9f80572620512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Henbin<div><br></div><div>It&#39;s funny that you ask, =
since I had just started to look into the same problem.</div><div><br></div=
><div>I&#39;d like to change the UART routing on an AST2500 when a client c=
onnects to the obmc-console-server. The use case is to dynamically connect =
the host&#39;s UART to a UART owned by the BMC.</div><div><br></div><div><s=
pan style=3D"font-size:small;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
I was thinking of writing a kernel driver that would expose the config opti=
ons from the HICRA register on AST2500 as /sys files. Each file represents =
the target UART1..5 and IO1..5. The file value represents the source UART1.=
.5 and IO1..5. Not all combinations are supported by the Aspeed, so I&#39;d=
 add the necessary checks and error reporting into the code.</span></div><d=
iv><br></div><div>An alternative would be to just use /dev/mem to do that, =
but my understanding is that default support for that is going away or has =
gone away.</div><div><br></div><div>Oskar.</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">---------- Forwarded message ----------<br>
From: Henbin Chang &lt;<a href=3D"mailto:henbinchang@gmail.com" target=3D"_=
blank">henbinchang@gmail.com</a>&gt;<br>
Date: Wed, Aug 1, 2018 at 12:11 AM<br>
Subject: UART Route setting<br>
To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<br>
<br>
Hi,<br>
<br>
Could anyone know how to modify UART Route setting through dts, driver<br>
or other mechanism?<br>
<br>
Or I have to find a point to modify it e.g. board_init() in the u-boot.<br>
<br>
Thanks.<br>
</blockquote></div></div></div>

--00000000000063d9f80572620512--
