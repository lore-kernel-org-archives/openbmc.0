Return-Path: <beccabroek@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.53; helo=mail-yw1-f53.google.com;
 envelope-from=beccabroek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l3GWfmYb"; 
 dkim-atps=neutral
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425Bsj3gmQzF3Ch
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 04:23:37 +1000 (AEST)
Received: by mail-yw1-f53.google.com with SMTP id j131-v6so3011334ywc.13
 for <openbmc@lists.ozlabs.org>; Wed, 05 Sep 2018 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O70QtSoQkJ1IvCvO/mQt9UptGk+ZWMvyTMdD2xLBmgg=;
 b=l3GWfmYbeQxacS1/aCmSY4O0DmYcbX/nJD8uS0mlxpju5/t8qsh9RGnH5VJZwJOQoB
 ooOT00yhrlATZBzueqW1K3wbTLlz5TahfFqBB32YpWmcoXU6QACTkwpL78q8pFK+QzMk
 V+EWRi0h3hJ2Pdhdfx5QxmuImJ787iSPLrCV/MFygExs/Axa9yUi7bh3xAvpaGI2stTC
 H5B3NmzNniEfy5q01qbitIJIToFLoexxKxFVIsR+EiqajZZL+LRVo5A4Hn/hEr3aC10i
 506ew447zPl8FKVIQMVNqasi7LKGv4wZjUghVVUw6thaymG4N62Tb7Xyxy9rM9Toosbd
 vG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O70QtSoQkJ1IvCvO/mQt9UptGk+ZWMvyTMdD2xLBmgg=;
 b=OaDuiABSgWzLKLzQcdMEuoCWJ/OIsYPHzg2N+SQkGLUMAoCp4NbDfcu0GbYNcesHQl
 HZ82H3tr1+oViIuwKI1KXOVv8ZcX8dDzT21VOOOROH5LoSfcWgbeAtOq6tCZwPv/urGH
 M4T7kVM7m6s+dwFXwOIUm6jCKeDYKwt9j/Mr1RjLlgDpw53JgpCQ8cQTC33qNGbSBv3x
 Bp5bX4hYLYDHBxbskq0/3KbenuRdrz/Yv0a6vT+s3MXpWntMSjO8swE+2sEBNg7c37ML
 c84ljde9pKqb3JcB2VgNZZlApYF4xSHUdH5Visomx13GKQamLSUhN6MY1KEsdM1A5K09
 R6PQ==
X-Gm-Message-State: APzg51BnmNdEIcGV/MEoJrp4Mka+ORFqej3iuyQyIaeXdR5I4eprtd/e
 2SbKRLP50yWb/wWK/uYhr6zf891p/L3fGD7D4mQ=
X-Google-Smtp-Source: ANB0VdZafSqI2SXlL+dyft4GDIwwdSzsz3ZWuuSdUaq9Pw88LFkNlRVdkyRo2EtmdWqvXOWGnSXIL1mSTLuvTVfNjQU=
X-Received: by 2002:a0d:d142:: with SMTP id
 t63-v6mr21452458ywd.449.1536171814824; 
 Wed, 05 Sep 2018 11:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
 <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
 <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
 <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
In-Reply-To: <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
From: Rebecca Broekhuis <beccabroek@gmail.com>
Date: Wed, 5 Sep 2018 13:23:23 -0500
Message-ID: <CABzWfrmOaiZN8gWkaxPDeHPZCvX3SfPOUNF2gDDPLfcb7s4Gpw@mail.gmail.com>
Subject: Re: SOL Logging
To: ed.tanous@intel.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000563182057523dfff"
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
X-List-Received-Date: Wed, 05 Sep 2018 18:23:39 -0000

--000000000000563182057523dfff
Content-Type: text/plain; charset="UTF-8"

>At some point there was talk of moving the html5 stuff over to xterm, to
>support more encoding styles, but I don't think anyone has started that
>work.

I've started and am currently working on switching from hterm to xterm at
the moment, as an update.

https://github.com/xtermjs/xterm.js/


On Tue, Sep 4, 2018 at 7:29 PM Ed Tanous <ed.tanous@intel.com> wrote:

> On 09/04/2018 05:07 PM, Emily Shaffer wrote:
> > I wonder if there's a different and more useful way we can provide the
> > console scrollback. Thinking about this, it's not just a GUI issue,
> > right - we deliver our console over TCP to a client elsewhere and would
> > have the same dedupe issues if we needed to start providing backlog.
>
> Correct, this isn't _just_ a webui issue.  It happens on all the
> available interfaces (SSH, HTML5, and obmc-console-client)
>
> > Speaking with almost no experience implementing server-side sockets, is
> > it possible for us to keep that ring buffer in the console socket as
> well?
>
> obmc-console already keeps a ring-buffer style log of all the previous
> characters.  The easiest to implement answer, which is probably good
> enough for most cases, would be to simply make obmc-console barf up the
> saved console log ring buffer when any new client connects.  This will
> have problems if your control characters have run off the end of the
> buffer, and the console would appear to quickly replay your last X
> characters worth of interactions, which isn't desired.
>
> I could also imagine a case where this isn't the desired behavior if
> you're using automation to interact with SSH/SOL, so it might need to be
> selectable by the client or have some kind of reasonable workaround.
>
> I'm fairly certain there's some buffering routines we can steal from
> screen and/or tmux that would just track the screen state, and blast the
> minimum character sets to each client on reconnect, but I haven't looked
> into it too deeply.
>
> >
> > I'm also interested in how you all are getting the console over to
> > webui.  Is it delivered via Redfish? (This is totally different from
> > what we are doing, so apologies if that's a fundamental question, but
> > I'm certainly keen to know now :) )
> >
>
> Today the console is being dumped to a dumb websocket that just mirrors,
> encodes, and encrypts the traffic to the browser using websocket frames.
>   On the browser side, we pipe that console into hterm, which turns the
> raw characters into a reasonably correct console.
>
> https://chromium.googlesource.com/apps/libapps/+/master/hterm
>
> At some point there was talk of moving the html5 stuff over to xterm, to
> support more encoding styles, but I don't think anyone has started that
> work.
>

--000000000000563182057523dfff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt;At some point there was talk of movin=
g the html5 stuff over to xterm, to=C2=A0<br>&gt;support more encoding styl=
es, but I don&#39;t think anyone has started that=C2=A0<br>&gt;work.<br><di=
v><br></div><div>I&#39;ve started and am currently working on switching fro=
m hterm to xterm at=C2=A0</div><div>the moment, as an update.=C2=A0</div><d=
iv><br><a href=3D"https://github.com/xtermjs/xterm.js/">https://github.com/=
xtermjs/xterm.js/</a><br></div></div></div><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Sep 4, 2018 at 7:29 PM E=
d Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.ta=
nous@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 09=
/04/2018 05:07 PM, Emily Shaffer wrote:<br>
&gt; I wonder if there&#39;s a different and more useful way we can provide=
 the <br>
&gt; console scrollback. Thinking about this, it&#39;s not just a GUI issue=
, <br>
&gt; right - we deliver our console over TCP to a client elsewhere and woul=
d <br>
&gt; have the same dedupe issues if we needed to start providing backlog.=
=C2=A0 <br>
<br>
Correct, this isn&#39;t _just_ a webui issue.=C2=A0 It happens on all the <=
br>
available interfaces (SSH, HTML5, and obmc-console-client)<br>
<br>
&gt; Speaking with almost no experience implementing server-side sockets, i=
s <br>
&gt; it possible for us to keep that ring buffer in the console socket as w=
ell?<br>
<br>
obmc-console already keeps a ring-buffer style log of all the previous <br>
characters.=C2=A0 The easiest to implement answer, which is probably good <=
br>
enough for most cases, would be to simply make obmc-console barf up the <br=
>
saved console log ring buffer when any new client connects.=C2=A0 This will=
 <br>
have problems if your control characters have run off the end of the <br>
buffer, and the console would appear to quickly replay your last X <br>
characters worth of interactions, which isn&#39;t desired.<br>
<br>
I could also imagine a case where this isn&#39;t the desired behavior if <b=
r>
you&#39;re using automation to interact with SSH/SOL, so it might need to b=
e <br>
selectable by the client or have some kind of reasonable workaround.<br>
<br>
I&#39;m fairly certain there&#39;s some buffering routines we can steal fro=
m <br>
screen and/or tmux that would just track the screen state, and blast the <b=
r>
minimum character sets to each client on reconnect, but I haven&#39;t looke=
d <br>
into it too deeply.<br>
<br>
&gt; <br>
&gt; I&#39;m also interested in how you all are getting the console over to=
 <br>
&gt; webui.=C2=A0 Is it delivered via Redfish? (This is totally different f=
rom <br>
&gt; what we are doing, so apologies if that&#39;s a fundamental question, =
but <br>
&gt; I&#39;m certainly keen to know now :) )<br>
&gt; <br>
<br>
Today the console is being dumped to a dumb websocket that just mirrors, <b=
r>
encodes, and encrypts the traffic to the browser using websocket frames. <b=
r>
=C2=A0 On the browser side, we pipe that console into hterm, which turns th=
e <br>
raw characters into a reasonably correct console.<br>
<br>
<a href=3D"https://chromium.googlesource.com/apps/libapps/+/master/hterm" r=
el=3D"noreferrer" target=3D"_blank">https://chromium.googlesource.com/apps/=
libapps/+/master/hterm</a><br>
<br>
At some point there was talk of moving the html5 stuff over to xterm, to <b=
r>
support more encoding styles, but I don&#39;t think anyone has started that=
 <br>
work.<br>
</blockquote></div>

--000000000000563182057523dfff--
