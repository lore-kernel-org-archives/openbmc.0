Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x230.google.com (mail-ua0-x230.google.com
 [IPv6:2607:f8b0:400c:c08::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP33v2lzKzDrhs
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 08:24:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=A8gJih/m; 
 dkim-atps=neutral
Received: by mail-ua0-x230.google.com with SMTP id i32so58115995uai.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngt/dmLCbYYsME3DYqw9orY0y0MFM9+UUtyMqH9Ames=;
 b=A8gJih/mQ57e5aWHyHu3mRUlW5TbsMkq+iT/XKsKTrCplm6OaJzu1Bb0UACORIx4WP
 3BoXHBvusEy+sCp/nlB5BGtXoN67XnhzJEDN/b/eeVl7xypAQSb1Bnem8QXK5KBjyvd4
 Z3/3BiKSchnajtaDqyTXUn1z7OcCQhSUF382Immxu169A5yCaMwtRggaDfCZkQrCrRGZ
 uTj4OmTGk0mkL4WVh3PwcUcj39uGD8XiCy0mfVq1czcjBDFyYpTcpsEoxOEJpQnGCdf9
 HV6Agkq0F8PlfPi7vrSNRz2agqQJCgTzRrh66c3uU+rUtsaQPOTel7py2s+BDNe0qmdV
 cdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngt/dmLCbYYsME3DYqw9orY0y0MFM9+UUtyMqH9Ames=;
 b=LGSDp8+GKo4NMqnMxPi8Ctsan04Lh3Zm0T3XT+COKfgCSilbXAFkuLuCrP0CbOeD4l
 Y5x/oDx8yXPzzzHSP5vKdQprDM2x+QBzu0f3B3rLI07JWfK/BpGVlAInWuQ0oySmGfyU
 +nrbXpSIUCevJGQuTx/xoeqcC+XSa+y3SVxpNvlG41ZWYHXPBjzK0mh/WVEDX+Dfnv+/
 Xyg/RVsREHBfktNiSp676oUtrSvboMmePYgvN+dNNgWl6zIQwSk87fW7TTVqqgTkWay+
 zMt2RZoSPUeXWeR0WnWg7IXdz5TcPcACYEsQeEDHCiZebHt4ET+u/AxiP98Eb/u7vag0
 MJpQ==
X-Gm-Message-State: AE9vXwMKDKIqQRdMo9fL+/Pd2Jm7/xmElDzZDo6byYXXGajPklYHDF1JjnruAQU5twwDM4VQ+RRldTppLwJEZIQT
X-Received: by 10.176.2.70 with SMTP id 64mr3125737uas.79.1472595897302; Tue,
 30 Aug 2016 15:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
 <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
 <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
 <CAFd5g45-aOGnpAb4gWjz7Zz-_+3gLux61+kzZT4Wni9VZCmpLg@mail.gmail.com>
 <CACPK8XdJJE7chox01OevHObvU0ENuGhMJ_FzYzDJdQ3uD_sqBA@mail.gmail.com>
In-Reply-To: <CACPK8XdJJE7chox01OevHObvU0ENuGhMJ_FzYzDJdQ3uD_sqBA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 30 Aug 2016 22:24:47 +0000
Message-ID: <CAFd5g46=3VF+kyyRFttLi=Ru62eypsXeA2NGPAu8b0R3-xpFUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113e057c5b7530053b5173b8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 22:25:00 -0000

--001a113e057c5b7530053b5173b8
Content-Type: text/plain; charset=UTF-8

>> Did you send a new version?

Yeah, the subject is: [PATCH v2] i2c: aspeed: added driver for Aspeed I2C
I sent it --in-reply-to=<your previous message ID>, does it not show as a
child of the thread in your email client?

Sorry if changing the commit message title screwed things up for you, but I
felt that the clean up title was no longer fitting.

On Tue, Aug 30, 2016 at 3:15 PM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Aug 31, 2016 at 7:14 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
> > Oh, and one more note: I moved out the eeprom quirk patch from this patch
> > set because I think it makes sense as a different submission upstream.
>
> That makes sense to me.
>
> >
> > On Tue, Aug 30, 2016 at 11:59 AM Brendan Higgins <
> brendanhiggins@google.com>
> > wrote:
> >>
> >> checkpatch seems to be upset about my device tree identifiers being
> >> undocumented; do we have a coordinated effort for this? I did not even
> see a
> >> directory for aspeed under arm.
>
> As this is a driver, the binding should be added in
> Documentation/devicetree/bindings/i2c/. Use one of the recently added
> existing drivers as a template. Add the binding in a separate commit,
> coming before the addition of the driver. When you send it upstream
> you will cc the device tree maintainers, who will ack your bindings.
> The driver maintainer will then merge the two patches into their tree.
>
> >>
> >> checkpatch is also asked about updating MAINTAINERS, but looks like it
> >> should be covered under existing line:
> >> F: drivers/*/*aspeed*
> >> Does it just ask this every time you add a file?
>
> Yeah, I think it just complains for the sake of it.
>
> >>
> >> changelog:
> >>  - Squashed driver commits as suggested by Joel
> >>  - Renamed a couple functions for consistency
> >>  - Fixed a couple style errors
>
> Did you send a new version?
>
> Cheers,
>
> Joel
>

--001a113e057c5b7530053b5173b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;&gt;=C2=A0<span style=3D"color:rgb(33,33,33);font=
-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line-height:1=
.5">Did you send a new version?</span></div><div><br></div>Yeah, the subjec=
t is:=C2=A0[PATCH v2] i2c: aspeed: added driver for Aspeed I2C<div>I sent i=
t=C2=A0--in-reply-to=3D&lt;your previous message ID&gt;, does it not show a=
s a child of the thread in your email client?</div><div><br></div><div>Sorr=
y if changing the commit message title screwed things up for you, but I fel=
t that the clean up title was no longer fitting.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Aug 30, 2016 at 3:15 PM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Wed, Aug 31, 2016 at 7:14 AM, Brend=
an Higgins<br>
&lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanh=
iggins@google.com</a>&gt; wrote:<br>
&gt; Oh, and one more note: I moved out the eeprom quirk patch from this pa=
tch<br>
&gt; set because I think it makes sense as a different submission upstream.=
<br>
<br>
That makes sense to me.<br>
<br>
&gt;<br>
&gt; On Tue, Aug 30, 2016 at 11:59 AM Brendan Higgins &lt;<a href=3D"mailto=
:brendanhiggins@google.com" target=3D"_blank">brendanhiggins@google.com</a>=
&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; checkpatch seems to be upset about my device tree identifiers bein=
g<br>
&gt;&gt; undocumented; do we have a coordinated effort for this? I did not =
even see a<br>
&gt;&gt; directory for aspeed under arm.<br>
<br>
As this is a driver, the binding should be added in<br>
Documentation/devicetree/bindings/i2c/. Use one of the recently added<br>
existing drivers as a template. Add the binding in a separate commit,<br>
coming before the addition of the driver. When you send it upstream<br>
you will cc the device tree maintainers, who will ack your bindings.<br>
The driver maintainer will then merge the two patches into their tree.<br>
<br>
&gt;&gt;<br>
&gt;&gt; checkpatch is also asked about updating MAINTAINERS, but looks lik=
e it<br>
&gt;&gt; should be covered under existing line:<br>
&gt;&gt; F: drivers/*/*aspeed*<br>
&gt;&gt; Does it just ask this every time you add a file?<br>
<br>
Yeah, I think it just complains for the sake of it.<br>
<br>
&gt;&gt;<br>
&gt;&gt; changelog:<br>
&gt;&gt;=C2=A0 - Squashed driver commits as suggested by Joel<br>
&gt;&gt;=C2=A0 - Renamed a couple functions for consistency<br>
&gt;&gt;=C2=A0 - Fixed a couple style errors<br>
<br>
Did you send a new version?<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div>

--001a113e057c5b7530053b5173b8--
