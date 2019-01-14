Return-Path: <bluecmd@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=bluecmd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UKFdxw0b"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dPvn6ssMzDqPw
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 18:18:23 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id k98so18467421otk.3
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 23:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfrQfsFaqDQA4SCfhHJFACeuq7S1wHFl5rzpcaq4jX0=;
 b=UKFdxw0bLxLkNP8Q2RLnnDm2f9VVOi8QoQn2QbGTIZGP/UYh3YfpkX0v0MhvTLHG3a
 hzITo5v+DnZ04eM7Qgl7cgPMqLNtDMPtZbWn0ItkjWe04gJiuA4AIQhd5Otf5+38rtCP
 RxDaAEC/XzO2fDUiUgQ9cj7iV1LUhL1WhvwES0lN/TG2m9r/ZKG1ZI9NhbB2quxUnlES
 00bMWT1xrXPF4NPiszmiH5QBS0bHDyaCjsPsExVhIs5ARyfeyzc9pwq3ZgZtjc5VbPcA
 WJHazFPWGX6ScJGLtlSoR4aOTcY8EcU2pZorXxoFsxhIohICkH/0ZUEXnTK6d8g2af/b
 lDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfrQfsFaqDQA4SCfhHJFACeuq7S1wHFl5rzpcaq4jX0=;
 b=uM0TN80aYmAjnh0b1pLqcU2bzVOs4ssF6tei10hRuOYSYl7/2YsvqPrqezOumCH5cN
 4rsl8DVvhA6exexiFZ7NjBqESW2hWfuIzcQU2QUPs3x6xFBZMvqSfWaLPY/SXYeKC/3w
 BJ/XQ7KMa2aA8XhzxdEdNpmw48Lt4ZKhNTwYNk+ImEr9MO4j4dmzXKfty3xoF8XvP89B
 MoqsCPsyHCwxjvTOCdKCqihJEqbaPJ9qUCOwvDguYRyD1C33RE0VLeNdUBwpiNAjtNa4
 YFNuFs1Ir1h5avDwfq5/wPD1j5MvDe1BD/DmIqQpO/KIkU/FIfchYTYcVRIGf/HhvRRp
 k78Q==
X-Gm-Message-State: AJcUukcetwOPfsxFjDzEmOoXddlHyW0xZJmnQiHI0LaJHSoc0Qx7+c4Q
 URwyGMx67c5RyteIGJOz3Ixi+YbMl+2cGQTtZIDwXw==
X-Google-Smtp-Source: ALg8bN6IupXC+gDhfZlrb+7cXwltva9xkQrfpeZoYDf8M6ZYTy3QJS6eKFvtdtnri0zkDExtAvpxrPshwTbQUTHXPtA=
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr17123194otl.343.1547450300986; 
 Sun, 13 Jan 2019 23:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
 <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
 <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
 <CADiuDARu6fwudJjcfJ0=sDpjQvtsog+GT5gUWu1WPTzPejFaZg@mail.gmail.com>
 <1547432051.2375740.1633677528.34818C65@webmail.messagingengine.com>
In-Reply-To: <1547432051.2375740.1633677528.34818C65@webmail.messagingengine.com>
From: Christian Svensson <bluecmd@google.com>
Date: Mon, 14 Jan 2019 08:18:08 +0100
Message-ID: <CAEfeXvaYO4KRFYnsvfdEevzgNgCJTwY2EKsT6ow71hzK13HfMg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Christian Svensson <blue@cmd.nu>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000007fdd1f057f65d918"
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
X-List-Received-Date: Mon, 14 Jan 2019 07:18:31 -0000

--0000000000007fdd1f057f65d918
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 14, 2019, 03:14 Andrew Jeffery <andrew@aj.id.au wrote:

> On Fri, 11 Jan 2019, at 23:00, Christian Svensson wrote:
> > Ping. What's left to be done here?
>
> I've taken Cedric's tree and pushed it to openbmc/qemu master, so the patch
> is there. Did you send it upstream originally? That's where it should go,
> but that
> will probably require fixing the issue I pointed out last time.
>

Ah, wierd, I swore I checked the repository last week but I must have
checked my own fork or something. Thanks for pulling the patch.

As for fixing the issues, any specific concerns with the proposal I replied
with back in November?

Thanks,

--0000000000007fdd1f057f65d918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Jan 14, 2019, 03:14 Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.=
id.au">andrew@aj.id.au</a> wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Fri, 11 Jan 2019, at 23:00, Christian Svensson wrote:<br>
&gt; Ping. What&#39;s left to be done here?<br>
<br>
I&#39;ve taken Cedric&#39;s tree and pushed it to openbmc/qemu master, so t=
he patch<br>
is there. Did you send it upstream originally? That&#39;s where it should g=
o, but that<br>
will probably require fixing the issue I pointed out last time.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah, wierd, I=
 swore I checked the repository last week but I must have checked my own fo=
rk or something. Thanks for pulling the patch.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">As for fixing the issues, any specific concerns with=
 the proposal I replied with back in November?</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks,</div></div>

--0000000000007fdd1f057f65d918--
