Return-Path: <emilyshaffer@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ1fD4wYyzDqGv
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 05:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L25y5zJF"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id f84so58659914ioj.0
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CP2iBk5M+c8uACmtY75Ax4/Tk/UsPLzjhOGz3Ddq/ps=;
 b=L25y5zJFSWMxW3+CgoIKHJDZms8Ml6MYzFPGULzmVG70hvYSP6vw4S9Wbey3PAB1uS
 SyUVXNklELHY5UJX3S5fRjs20ZmF5iye6drI+FV4hVG5Tx5JdVqiK9ZmhaERSV3bPuYC
 cA13IxRge4AAOaQ5xSzDZBr54e1a2qO/eU40Xkkp3zbRpa3EoE4skclVHiZbWot1Z0TQ
 XXuzNHQzVnFuhzt/PwzYITzfWe5uZgOAV7hw7jvAgPhck7jJkNmpn7e14LyW5nuXQj1j
 AakCEXpurOZ+7sgnrNTW1kdntLkiaQuzvzxykGZMbDPZs5fjYrpHaYsXYo4qe3cKN3Wq
 e/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CP2iBk5M+c8uACmtY75Ax4/Tk/UsPLzjhOGz3Ddq/ps=;
 b=gAhIb2LdBXLcV+f2D1U3BOkx1nW5RQBHtQAFWV0vg/dL8v4aVbgsJWC1Ly69AQsD2h
 kOZ4ZvuYdNb7XljOJV95pFumDnf0rZKdTT/qnY0AXA5gloub4PSBRJ2qwwt7KbAzMJwy
 ME+7PB8Dk8vTulA+Or8QDhd4wdkX4YAYitxJJuDfiuCmyk7N0WluYbZIAqpZopdB4AjH
 lT54oaE71xJsc1iwACWDFai7ew0zPyQ9ZT9XDk96riyKAwBhXA3Hc2SCV/a0HnrNqGKJ
 BlV5r/Bq+siQT7vegoim/Dv6ncLeY7WwubL3M64yRtmjJ9S9LIdXAaBYYOveB/Hhgk6m
 YwSg==
X-Gm-Message-State: AMke39knQZsok8aH11G2vegxbrdj7OMvUKvvnszIot7wJTMbeI5nuBb6/zi4wti7Yj5HQUw4P7UiLUuF9Ov0NXPF
X-Received: by 10.107.134.36 with SMTP id i36mr17529795iod.192.1488480769334; 
 Thu, 02 Mar 2017 10:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
 <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
 <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
 <CAPH-5w7qxK6J6KsQQk6CVQt0eg6X2zfWDTPsTD09vFrpdh6UxQ@mail.gmail.com>
In-Reply-To: <CAPH-5w7qxK6J6KsQQk6CVQt0eg6X2zfWDTPsTD09vFrpdh6UxQ@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 02 Mar 2017 18:52:38 +0000
Message-ID: <CAJoAoZmWVWiAVxH4tHObCTtwxo_6JnjvmN-4zwM+GtxKhmOTew@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Xo Wang <xow@google.com>, Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113ece488359210549c3ef6a
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
X-List-Received-Date: Thu, 02 Mar 2017 18:52:53 -0000

--001a113ece488359210549c3ef6a
Content-Type: text/plain; charset=UTF-8

I'm going to give a try with those patches backported, no luck getting rid
of the warning.

Incidentally, is there a way to turn on warnings as errors with bitbake? I
was unaware of those warnings until Joel pointed them out.

On Thu, Mar 2, 2017 at 9:58 AM Xo Wang <xow@google.com> wrote:

> It looks like this issue is fixed in v4.9:
> https://lkml.org/lkml/2016/8/15/569
>
> The cover letter to that patchset also mentions adding an unused "reg"
> property as a workaround. I had probably copied and pasted the pca9541
> bindings without "reg" to the Zaius dts without reading the rest of
> the notes. Oops.
>
> Should we backport that patchset and/or wait for the next OpenBMC kernel
> rebase?
>
> Emily: can you test whether the "reg" property is still necessary if
> you backport those patches?
>
> cheers
> xo
>

--001a113ece488359210549c3ef6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m going to give a try with those patches backported,=
 no luck getting rid of the warning.<div><br></div><div>Incidentally, is th=
ere a way to turn on warnings as errors with bitbake? I was unaware of thos=
e warnings until Joel pointed them out.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Thu, Mar 2, 2017 at 9:58 AM Xo Wang &lt;<a href=
=3D"mailto:xow@google.com">xow@google.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">It looks like this issue is fixed in v4.9: <a href=3D=
"https://lkml.org/lkml/2016/8/15/569" rel=3D"noreferrer" class=3D"gmail_msg=
" target=3D"_blank">https://lkml.org/lkml/2016/8/15/569</a><br class=3D"gma=
il_msg">
<br class=3D"gmail_msg">
The cover letter to that patchset also mentions adding an unused &quot;reg&=
quot;<br class=3D"gmail_msg">
property as a workaround. I had probably copied and pasted the pca9541<br c=
lass=3D"gmail_msg">
bindings without &quot;reg&quot; to the Zaius dts without reading the rest =
of<br class=3D"gmail_msg">
the notes. Oops.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Should we backport that patchset and/or wait for the next OpenBMC kernel re=
base?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Emily: can you test whether the &quot;reg&quot; property is still necessary=
 if<br class=3D"gmail_msg">
you backport those patches?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
cheers<br class=3D"gmail_msg">
xo<br class=3D"gmail_msg">
</blockquote></div>

--001a113ece488359210549c3ef6a--
