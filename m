Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="KPwf5XgM"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bhzj74wtzDr1b
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 23:30:57 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id f23so12971822edb.3
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 04:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/m2d1WVymuKY9+RFKTDjgkoPqWUoQ9y+eX+dPEZldb8=;
 b=KPwf5XgMRYnd7U9fq3mNqmKVShngRJam+T8astam2I62pKIO8j1nRUzNfHWhFIzdEb
 3Ck6W1TPCFUK3rHTTDqnvw0KQdxuU1Teue1XXX8eSa1JVJRRwR+1Z/Cn2z4gftaJEBuJ
 e0Sw7ktrhbtOw+10OpXcKt5rthduJGgl/BD34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/m2d1WVymuKY9+RFKTDjgkoPqWUoQ9y+eX+dPEZldb8=;
 b=iZU+ovTCOluEMENmhO4NJvSdllsixKuShGaokbzCXDCj62xIiJHQaTg+pE6SHL7aQY
 WLHbM0VdYsUl4Lla/YwTHqRB/33PjPhmInfXTFxOxiAL4GqicTZEmDIqkJEV14O0V8B3
 auX+sY+68pDuL9rFgvjdxAM4u7CWz9HphgjpB8cMG2Rmm9DbwxsTqCJkbGJq/TAY9ASE
 gketL+otc+4o8ccP/NZPgjSSU8xyKr055O6JOxR9mfgKDQ2OBo7Kp55b3pPSs+xtk50o
 lXO7+NaNGMfsKcZoODX5h56PMxLYaMSAIiDJCgrjr0wTl2slsnElJ8wUrozt75BYOMzC
 uhIg==
X-Gm-Message-State: AJcUukceDkcqdAd4DUL34LjNnTQNffxwMai9DhCI9fH7Yx0iobbbPs9w
 75MTiiZum2iZwTghNeMRjVhoy9gIsveU6zuN8sMoidovazA=
X-Google-Smtp-Source: ALg8bN7ygGItJEB0+qf9d33fPhqFrT1bAh3u77mDUTAacqlzYHl7XgoP3d+uL/M1Lna/uFOrBNDAyFI2xQu8ZhxVJrc=
X-Received: by 2002:a17:906:ca03:: with SMTP id
 jt3-v6mr11196435ejb.165.1547209855048; 
 Fri, 11 Jan 2019 04:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20181112142231.162425-1-bluecmd@google.com>
 <7b253e90-db3b-1863-613c-8a35edf32944@kaod.org>
 <CADiuDAQAuidj9xb_BSAtiujtcGUNPWYkH6=QnAHRxHJ3gnJXyg@mail.gmail.com>
In-Reply-To: <CADiuDAQAuidj9xb_BSAtiujtcGUNPWYkH6=QnAHRxHJ3gnJXyg@mail.gmail.com>
From: Christian Svensson <blue@cmd.nu>
Date: Fri, 11 Jan 2019 13:30:44 +0100
Message-ID: <CADiuDAQ-cUMyHWbkrSVucmb2BRusaCP-OkQs0JG78DOjruKM4Q@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_smc: Calculate checksum on normal DMA
To: clg@kaod.org
Cc: Christian Svensson <bluecmd@google.com>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000cdbc0f057f2dddf8"
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
X-List-Received-Date: Fri, 11 Jan 2019 12:30:58 -0000

--000000000000cdbc0f057f2dddf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping. What's left to be done here?


On Mon, Nov 12, 2018 at 3:52 PM Christian Svensson <blue@cmd.nu> wrote:

> Hi,
>
> Thanks for the review.
>
> On Mon, Nov 12, 2018 at 3:39 PM C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> > The datasheet is not very clear on the topic.
>
> I won't argue there.
>
> > and one could understand that under Normal DMA operation, there is
> > no Checksum accumulation.
>
> Indeed, that's what I thought as well. Then my question to myself was tha=
t
> since that means that you can either 1) transfer data or 2) calculate the
> checksum it seems like a pretty useless feature.
>
> If you look at 8.6.2 DMA CheckSum Calculation Mode (for ast2400 at least)
> you
> see the sentence:
> > 5. FMC80[2] is set when only checksum calculation is necessary, no data
> movement
>
> Which I take to read that you can execute the whole section and you will
> get a checksum + data transfer, but if you set FMC80[2] then you get the
> checksum, but no data movement.
>
> > do you have a firmware doing so you could share ? I would like to check
> > for the ast2500.
>
> I have my own firmware here:
>
> https://github.com/u-root/u-bmc/blob/07979a696df4351ec6dbb424ca80a5ebcc2e=
da1d/platform/ast2400/boot/main.S
>
> Cheers,
>

--000000000000cdbc0f057f2dddf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping. What&#39;s left to be done here?<div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 12, 2018 at 3:=
52 PM Christian Svensson &lt;<a href=3D"mailto:blue@cmd.nu" target=3D"_blan=
k">blue@cmd.nu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><=
div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks for the review.</div><div=
 dir=3D"ltr"><br>On Mon, Nov 12, 2018 at 3:39 PM C=C3=A9dric Le Goater &lt;=
<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt; wrot=
e:<br>&gt; The datasheet is not very clear on the topic.<br><br>I won&#39;t=
 argue there.<br><br>&gt; and one could understand that under Normal DMA op=
eration, there is<br>&gt; no Checksum accumulation.<div><br></div><div>Inde=
ed, that&#39;s what I thought as well. Then my question to myself was that<=
/div><div>since that means that you can either 1) transfer data or 2) calcu=
late the</div><div>checksum it seems like a pretty useless feature.</div><d=
iv><br></div><div>If you look at=C2=A08.6.2 DMA CheckSum Calculation Mode (=
for ast2400 at least) you</div><div>see the sentence:</div><div>&gt;=C2=A05=
. FMC80[2] is set when only checksum calculation is necessary, no data move=
ment</div><div><br></div><div>Which I take to read that you can execute the=
 whole section and you will</div><div>get a checksum + data transfer, but i=
f you set FMC80[2] then you get the</div><div>checksum, but no data movemen=
t.</div><div><br>&gt; do you have a firmware doing so you could share ? I w=
ould like to check<br>&gt; for the ast2500.</div><div><br></div><div>I have=
 my own firmware here:</div><div><a href=3D"https://github.com/u-root/u-bmc=
/blob/07979a696df4351ec6dbb424ca80a5ebcc2eda1d/platform/ast2400/boot/main.S=
" target=3D"_blank">https://github.com/u-root/u-bmc/blob/07979a696df4351ec6=
dbb424ca80a5ebcc2eda1d/platform/ast2400/boot/main.S</a><br></div><div><br><=
/div><div>Cheers,</div></div></div></div>
</blockquote></div>

--000000000000cdbc0f057f2dddf8--
