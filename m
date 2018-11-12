Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="QFHm/IMO"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ttyf35fkzF3TS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 01:52:22 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id r27so4641446eda.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OALES+F2Dm81L8ow2FBZxpezr7jpwPEl1r4bqmA01io=;
 b=QFHm/IMOrgRSJ5wQf0Sa1E9ItqSJP0vM9ZwgqFwr5Qh18yYD9smIxBOTu2N8PeVrRz
 qV3+ZTb9oT8I3n2ZcI2erK/kDqOgwxmNb0l3OzXq5It0g0BGYZNzn434lpOiStNw588o
 llfGWp2bErm2B7+hrPGwVGwdibWeuGVY9gaSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OALES+F2Dm81L8ow2FBZxpezr7jpwPEl1r4bqmA01io=;
 b=ujUndqESONeMCBXGfS19TUu1BKZA2eUFzJQel32C59kpEA78MBbvF6dp0rxyd0GHF3
 88VX7iWLqwxxX1xP96JX4UbzukP77/qHB0Fq4wFngiti9cGXd73WcIq0tIKFyxfrkPJ2
 7nmMHrR5GWPC3UhEs6MeFNi+Li5dwvcE8kbo1y0k/Bcbw0p5U1nFilvvBWdqexnTc8WR
 rEQI4fZk9PhLZ8zVQvXqOzw5J5SiRivxSU6WckTbmNzUEC4wwbmjS4xa1MT9R40V73HZ
 h6w5aiUhYHfE+Q8G6WRpYv/r0rRYf6sAPDGsNarqFmcQFllW5udy6Y2W6AO6OnJAV0Fi
 QAbQ==
X-Gm-Message-State: AGRZ1gKtjdW2s6uZ9TgINQXDful1u7tt1ud0tpsjkQFQKUNUXSQgdXiJ
 W62+4tlfLJ1mjp/D2sO7pgX80BzleDLQin/gDHt8Yg==
X-Google-Smtp-Source: AJdET5dFsXENDxoZuzAO07VR1mrVTyScsRKOXLc+QT2qhfQojpTBZmD4vgUk4D46FOPs0l9dHOMYm8hc4nkF+oO29aI=
X-Received: by 2002:a17:906:b2c5:: with SMTP id
 cf5-v6mr9629261ejb.147.1542034338707; 
 Mon, 12 Nov 2018 06:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20181112142231.162425-1-bluecmd@google.com>
 <7b253e90-db3b-1863-613c-8a35edf32944@kaod.org>
In-Reply-To: <7b253e90-db3b-1863-613c-8a35edf32944@kaod.org>
From: Christian Svensson <blue@cmd.nu>
Date: Mon, 12 Nov 2018 15:52:07 +0100
Message-ID: <CADiuDAQAuidj9xb_BSAtiujtcGUNPWYkH6=QnAHRxHJ3gnJXyg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_smc: Calculate checksum on normal DMA
To: clg@kaod.org
Cc: Christian Svensson <bluecmd@google.com>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, andrew@aj.id.au
Content-Type: multipart/alternative; boundary="000000000000fd9e6f057a78d8f5"
X-Mailman-Approved-At: Tue, 13 Nov 2018 15:39:12 +1100
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
X-List-Received-Date: Mon, 12 Nov 2018 14:52:28 -0000

--000000000000fd9e6f057a78d8f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

On Mon, Nov 12, 2018 at 3:39 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The datasheet is not very clear on the topic.

I won't argue there.

> and one could understand that under Normal DMA operation, there is
> no Checksum accumulation.

Indeed, that's what I thought as well. Then my question to myself was that
since that means that you can either 1) transfer data or 2) calculate the
checksum it seems like a pretty useless feature.

If you look at 8.6.2 DMA CheckSum Calculation Mode (for ast2400 at least)
you
see the sentence:
> 5. FMC80[2] is set when only checksum calculation is necessary, no data
movement

Which I take to read that you can execute the whole section and you will
get a checksum + data transfer, but if you set FMC80[2] then you get the
checksum, but no data movement.

> do you have a firmware doing so you could share ? I would like to check
> for the ast2500.

I have my own firmware here:
https://github.com/u-root/u-bmc/blob/07979a696df4351ec6dbb424ca80a5ebcc2eda=
1d/platform/ast2400/boot/main.S

Cheers,

--000000000000fd9e6f057a78d8f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><div dir=3D"ltr=
"><br></div><div dir=3D"ltr">Thanks for the review.</div><div dir=3D"ltr"><=
br>On Mon, Nov 12, 2018 at 3:39 PM C=C3=A9dric Le Goater &lt;<a href=3D"mai=
lto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<br>&gt; The datasheet is not =
very clear on the topic.<br><br>I won&#39;t argue there.<br><br>&gt; and on=
e could understand that under Normal DMA operation, there is<br>&gt; no Che=
cksum accumulation.<div><br></div><div>Indeed, that&#39;s what I thought as=
 well. Then my question to myself was that</div><div>since that means that =
you can either 1) transfer data or 2) calculate the</div><div>checksum it s=
eems like a pretty useless feature.</div><div><br></div><div>If you look at=
=C2=A08.6.2 DMA CheckSum Calculation Mode (for ast2400 at least) you</div><=
div>see the sentence:</div><div>&gt;=C2=A05. FMC80[2] is set when only chec=
ksum calculation is necessary, no data movement</div><div><br></div><div>Wh=
ich I take to read that you can execute the whole section and you will</div=
><div>get a checksum + data transfer, but if you set FMC80[2] then you get =
the</div><div>checksum, but no data movement.</div><div><br>&gt; do you hav=
e a firmware doing so you could share ? I would like to check<br>&gt; for t=
he ast2500.</div><div><br></div><div>I have my own firmware here:</div><div=
><a href=3D"https://github.com/u-root/u-bmc/blob/07979a696df4351ec6dbb424ca=
80a5ebcc2eda1d/platform/ast2400/boot/main.S">https://github.com/u-root/u-bm=
c/blob/07979a696df4351ec6dbb424ca80a5ebcc2eda1d/platform/ast2400/boot/main.=
S</a><br></div><div><br></div><div>Cheers,</div></div></div></div>

--000000000000fd9e6f057a78d8f5--
