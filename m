Return-Path: <emilyshaffer@google.com>
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZlhn6mVYzDqBV
 for <openbmc@lists.ozlabs.org>; Sat,  4 Mar 2017 10:27:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KXyvlocO"; 
 dkim-atps=neutral
Received: by mail-io0-x230.google.com with SMTP id f84so83561991ioj.0
 for <openbmc@lists.ozlabs.org>; Fri, 03 Mar 2017 15:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r9D/1ceGaT58kFUdTQlZ5zpj494S6ashQ4zB7gIXKLA=;
 b=KXyvlocO0yNmf8Qq/3z9E5KyxYvBZ7oUKOsnWvZ4WTL7jU6JF7BwHLUF8jaE1sat8i
 tBrBmMMtcZinkSamP1lveyCz88LERn8xLb/YMgvpymqHL7MyWzWUvLpHsRaMHfl/LA1d
 rdPNKR1HaDF2YvXmXTlN+j19gkciKxJrfFrIgdSGnM3YP2rqLA1SA4nQH77t6PgG5LxK
 BRzRRC22PgxwTMDB5ia3vZ1N+indD1oOsQWsyvFWIShLiWA+YTTwiO9OunvFPbeoP7At
 X8R2ZUtfU7NYuwwmHjlMIbj3hjsmq8s9cfX7ldZNocxkxl94GJFVFEb8oPXXkOijkuQ0
 h4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r9D/1ceGaT58kFUdTQlZ5zpj494S6ashQ4zB7gIXKLA=;
 b=mHWY1PIAH3689DQJq+9Pk9jF3yWCP++sHg8KqsDVHHyGHMhYmUCeY2OHCtk7bff6WA
 tsa+Zxd6h2sc787IRISld0IkFmPy1UTGyMf96Vn6g7K90uPW75wD/+iUYz0YGIsicnv8
 5H3ZxKcy2oQf65BzdTTcwp0fYsoxrex552qa80/bBDdXUmIBSroAJ8kBkbH5ACTxR9p6
 /55q2sLHpzBadNYWoLAKgETTALclkYtfSqL3wo7YyCk5IGDaxhZof23ax8G05HZXg/UQ
 OgdzuDPSjy5LzjukFq5XPLgupDluA2hIHg5Jhlr12w3OPJb64Z11+9NAbB3LX5+o9d+i
 yA+Q==
X-Gm-Message-State: AMke39mWQ8uqcs4wXQVYChl6Tt522qYd+n9moKnobpig2RIIY/wf20fCY5R7d+UoGWDzPdQhGRvBX3FcVq0mt0pt
X-Received: by 10.107.10.21 with SMTP id u21mr5711485ioi.139.1488583654025;
 Fri, 03 Mar 2017 15:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
 <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
 <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
 <CAPH-5w7qxK6J6KsQQk6CVQt0eg6X2zfWDTPsTD09vFrpdh6UxQ@mail.gmail.com>
 <CAJoAoZmWVWiAVxH4tHObCTtwxo_6JnjvmN-4zwM+GtxKhmOTew@mail.gmail.com>
 <CAPLgG==uUMey8Ka3rF3ceGctjJLiKah8Jt8CfFdVMABu8s=hSg@mail.gmail.com>
In-Reply-To: <CAPLgG==uUMey8Ka3rF3ceGctjJLiKah8Jt8CfFdVMABu8s=hSg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 03 Mar 2017 23:27:23 +0000
Message-ID: <CAJoAoZmR-CURL97wsiYg+1LgQo_6ah0e0HrAHzi21b36t0bZ9Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Rick Altherr <raltherr@google.com>
Cc: Xo Wang <xow@google.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113ed766eb0c410549dbe3e6
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
X-List-Received-Date: Fri, 03 Mar 2017 23:27:38 -0000

--001a113ed766eb0c410549dbe3e6
Content-Type: text/plain; charset=UTF-8

Xo, with those backports the LM5066I works out of the box - no code change
needed from me.

Joel, can we pull in the patchset Xo linked (
https://lkml.org/lkml/2016/8/15/569)?  I didn't have any conflicts locally
with this, should be straightforward.

Thanks,
Emily

On Thu, Mar 2, 2017 at 10:57 AM Rick Altherr <raltherr@google.com> wrote:

> Not that I've found.  Best I've been able to work out is grepping the
> build log
> (tmp/work/zaius-openbmc-linux-gnueabi/linux-obmc/4.7+git999-r0/temp/log.do_compile)
> for "warning".
>
> On Thu, Mar 2, 2017 at 10:52 AM, Emily Shaffer <emilyshaffer@google.com>
> wrote:
> > I'm going to give a try with those patches backported, no luck getting
> rid
> > of the warning.
> >
> > Incidentally, is there a way to turn on warnings as errors with bitbake?
> I
> > was unaware of those warnings until Joel pointed them out.
> >
> > On Thu, Mar 2, 2017 at 9:58 AM Xo Wang <xow@google.com> wrote:
> >>
> >> It looks like this issue is fixed in v4.9:
> >> https://lkml.org/lkml/2016/8/15/569
> >>
> >> The cover letter to that patchset also mentions adding an unused "reg"
> >> property as a workaround. I had probably copied and pasted the pca9541
> >> bindings without "reg" to the Zaius dts without reading the rest of
> >> the notes. Oops.
> >>
> >> Should we backport that patchset and/or wait for the next OpenBMC kernel
> >> rebase?
> >>
> >> Emily: can you test whether the "reg" property is still necessary if
> >> you backport those patches?
> >>
> >> cheers
> >> xo
>

--001a113ed766eb0c410549dbe3e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Xo, with those backports the LM5066I works out of the box =
- no code change needed from me.<div><br></div><div>Joel, can we pull in th=
e patchset Xo linked (<a href=3D"https://lkml.org/lkml/2016/8/15/569" rel=
=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://lkml.org/lkml=
/2016/8/15/569</a>)?=C2=A0 I didn&#39;t have any conflicts locally with thi=
s, should be straightforward.</div><div><br></div><div>Thanks,</div><div>Em=
ily</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Mar =
2, 2017 at 10:57 AM Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Not that I&#39;ve found.=C2=A0 Best I&#39;ve been able to work out is grep=
ping the<br class=3D"gmail_msg">
build log (tmp/work/zaius-openbmc-linux-gnueabi/linux-obmc/4.7+git999-r0/te=
mp/log.do_compile)<br class=3D"gmail_msg">
for &quot;warning&quot;.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
On Thu, Mar 2, 2017 at 10:52 AM, Emily Shaffer &lt;<a href=3D"mailto:emilys=
haffer@google.com" class=3D"gmail_msg" target=3D"_blank">emilyshaffer@googl=
e.com</a>&gt; wrote:<br class=3D"gmail_msg">
&gt; I&#39;m going to give a try with those patches backported, no luck get=
ting rid<br class=3D"gmail_msg">
&gt; of the warning.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Incidentally, is there a way to turn on warnings as errors with bitbak=
e? I<br class=3D"gmail_msg">
&gt; was unaware of those warnings until Joel pointed them out.<br class=3D=
"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; On Thu, Mar 2, 2017 at 9:58 AM Xo Wang &lt;<a href=3D"mailto:xow@googl=
e.com" class=3D"gmail_msg" target=3D"_blank">xow@google.com</a>&gt; wrote:<=
br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; It looks like this issue is fixed in v4.9:<br class=3D"gmail_msg">
&gt;&gt; <a href=3D"https://lkml.org/lkml/2016/8/15/569" rel=3D"noreferrer"=
 class=3D"gmail_msg" target=3D"_blank">https://lkml.org/lkml/2016/8/15/569<=
/a><br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; The cover letter to that patchset also mentions adding an unused &=
quot;reg&quot;<br class=3D"gmail_msg">
&gt;&gt; property as a workaround. I had probably copied and pasted the pca=
9541<br class=3D"gmail_msg">
&gt;&gt; bindings without &quot;reg&quot; to the Zaius dts without reading =
the rest of<br class=3D"gmail_msg">
&gt;&gt; the notes. Oops.<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; Should we backport that patchset and/or wait for the next OpenBMC =
kernel<br class=3D"gmail_msg">
&gt;&gt; rebase?<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; Emily: can you test whether the &quot;reg&quot; property is still =
necessary if<br class=3D"gmail_msg">
&gt;&gt; you backport those patches?<br class=3D"gmail_msg">
&gt;&gt;<br class=3D"gmail_msg">
&gt;&gt; cheers<br class=3D"gmail_msg">
&gt;&gt; xo<br class=3D"gmail_msg">
</blockquote></div>

--001a113ed766eb0c410549dbe3e6--
