Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com
 [IPv6:2a00:1450:400c:c0c::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xStRM38sPzDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 02:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r1kkuO5X"; 
 dkim-atps=neutral
Received: by mail-wr0-x22b.google.com with SMTP id c24so4851790wra.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HHQGddMxqy+P3A1lZV2FRO3siqKPBTlunsn90gWZh0g=;
 b=r1kkuO5Xioot6Jmf9ZfcnGKWGtmE5+j3rzKbEXMp0kw1fahEUUhV88wxVKdibXt5yl
 xfHp+u0NPTygjoyohHQPBNyTNkaRLWI2gnHbgsgy2htF57oPPiHmqAd1x1Ugqx9KWRom
 lt2jufN4GGthyERY1rH/LkSzjNFHG5rtp2Qq59LO5Z2kL8SU0vrTzChlww+OEl878iqA
 dkYmY/xHd7KPJa3qcAyYhgslu5/+isvJewTfidSSnEBiVUWPvM2K7myQPvFa3qBuaMu5
 1eAX67Xq1TcqtC8jtwAzgBQ2oCLVpZ/rD0ksVX6Yrwo7FdGl3rYz+s7Pt9VDW+LrXdKA
 YnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HHQGddMxqy+P3A1lZV2FRO3siqKPBTlunsn90gWZh0g=;
 b=OkRD7seA6+IaQ5FmO5uFanspIG7UK1d+SxBCpMddKhfq+49IpEn0y8WIzIkWtMFVJK
 jJxZn4nl05jOSr0RE5gIxOoC6CqBHkpaTiurha/Vfho6kRuOkYfzgrLL9qlqKMeCg5vI
 rIzIuAUbWis/tFsaUsUhAW0SjXCxE6zRiukXHCOEiJL/e6SWO5G8QfHHRsUkdASxdUBa
 8OgJZwxcEizU3bnMLua5kt9m35luXZT9/kwYtBkWZZxpfrPt8YclilIYz9/UtchIK07W
 rYpON77elLv3rAfzC/MSS82s/c8ZLV6/mlKmi7zqJBI1h8nRTi/XM+cckyXuhxO4kLG9
 5E9Q==
X-Gm-Message-State: AHYfb5iMLzbI4FCn4cdSO7F7z9EdbC6QdP9zoyVB3Ck1Z3ezgEHzC4Mv
 coD4zlbbUpu5ZuWaQ+uxK6KZGGa8HbWi
X-Received: by 10.223.133.201 with SMTP id 9mr10324950wru.177.1502381468300;
 Thu, 10 Aug 2017 09:11:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.153.69 with HTTP; Thu, 10 Aug 2017 09:11:05 -0700 (PDT)
Received: by 10.28.153.69 with HTTP; Thu, 10 Aug 2017 09:11:05 -0700 (PDT)
In-Reply-To: <1502359910.7946.17.camel@aj.id.au>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
 <1502359910.7946.17.camel@aj.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 10 Aug 2017 09:11:05 -0700
Message-ID: <CAPLgG==GHvy__Lq7su=J6i=Uqi6VmuL5_2oL8iwVCepEk6_M0Q@mail.gmail.com>
Subject: Re: AST SOC gpio pass-through support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Yong Li <sdliyong@gmail.com>
Content-Type: multipart/alternative; boundary="001a1149221ebc9ed6055668716e"
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
X-List-Received-Date: Thu, 10 Aug 2017 16:11:12 -0000

--001a1149221ebc9ed6055668716e
Content-Type: text/plain; charset="UTF-8"

On Aug 10, 2017 3:12 AM, "Andrew Jeffery" <andrew@aj.id.au> wrote:

On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
> thanks for your quick response Andrew!

No worries!

> i will read these info deeply. just a quick question, is it possible
> to enable/disable the pass through dynamically after kernel boots?  how?

So there is the concept of runtime pinmuxing[1]: It's possible for a
device to have several pinmux states that can be configured/selected
from process context.



On Quanta Q71L, the hardware strap is used to enable pass through so the
power button works even if the BMC fails to boot. The BMC firmware is
expected to disable the pass through once it is ready to take over. I
believe I sent the patch upstream to allow pinmux to modify the strap
register for this case. That is, pass through is disabled when the user
exports a GPIO to userspace.

--001a1149221ebc9ed6055668716e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Aug 10, 2017 3:12 AM, &quot;Andrew Jeffery&quot; &lt;<a href=
=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br type=3D"attri=
bution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">On Thu, 2017-08=
-10 at 17:01 +0800, Yong Li wrote:<br>
&gt; thanks for your quick response Andrew!<br>
<br>
</div>No worries!<br>
<div class=3D"quoted-text"><br>
&gt; i will read these info deeply. just a quick question, is it possible<b=
r>
&gt; to enable/disable the pass through dynamically after kernel boots?=C2=
=A0=C2=A0how?<br>
<br>
</div>So there is the concept of runtime pinmuxing[1]: It&#39;s possible fo=
r a<br>
device to have several pinmux states that can be configured/selected<br>
from process context. </blockquote></div></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">On Quanta Q71L, the har=
dware strap is used to enable pass through so the power button works even i=
f the BMC fails to boot. The BMC firmware is expected to disable the pass t=
hrough once it is ready to take over. I believe I sent the patch upstream t=
o allow pinmux to modify the strap register for this case. That is, pass th=
rough is disabled when the user exports a GPIO to userspace.</div></div>

--001a1149221ebc9ed6055668716e--
