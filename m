Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XLKMk7QQ"; 
 dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wTz36jLVzF2FT
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:13:03 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id q127-v6so1538678ljq.11
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qLHTVwrh+7WZZevqveP05hvxo0tfq3JD3aLV0TD6FQw=;
 b=XLKMk7QQwywPp0NK/XDwFJDX/wJ7um6Vfnt3paK8kqVeetqPDNWN4J9woRBb//fMqr
 QJYfCqKZxmGAEtZDbwYcGgq/mvSUvvwlOrHQxdj0f0v7hLVeWcKFKNJ2GK+zkYH+ag6M
 sIuBheQh11c/fTW63eQOgrgEUyVmC2ukkMB5YOfJTqNk/pqOo5JvTpnRmBZhDQGH1nPS
 vnt+zgMV8yNEk83A344hg8l79m4DHiWOqADWLRmHRs1ikhqf+QUU4fwuYYsur/EMcbpq
 mQCYl9cG74udUWOIMlLAFzx2OxByZcu8xXfNhhIQ/E4IlMcS9pp+BMlUcNG+JVIe4grn
 cZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qLHTVwrh+7WZZevqveP05hvxo0tfq3JD3aLV0TD6FQw=;
 b=HKjzXWOgcfT/jiyK4kxW/hCXN03XCodZuRLsAzQi9NwBq/RnSrTVwe16ELQ/fXklXP
 bokz1mkv62XL/zgjkVQgzrmDqlCpMI2jxwZm+lOjE3m5rE6EYf3No6ZX5lixRqQ1R834
 uKEAZi7t3jUE3ttof+ni0zZikPmPfCXWQN9sXW7Dqmja7HkJjONS+G5+6bJrW/a9AVwP
 i8S1D2wmUeKrQcGkLD7qBGzKDbnFK6fh8GnykOaCVampTnrU5fpdxYOLpxO4kkrvGis4
 NLelKj22seAyb6m8CRDSJhoDY820NoQaf/7B//vq+gLOiuru15CxmFdfsUlSb7NpsuCX
 I2lA==
X-Gm-Message-State: AOUpUlEAyoWquF1dZA7R3oh1vZayWbxKnjZpdkpFigBColgGqqX7VpM2
 hRR4PpmC6d0pnqdufgInPBszq2G5lMDX5oOqguT2Xw==
X-Google-Smtp-Source: AA+uWPzFnCLsJgQKosGwLADNmKafvceK64GbloYOsxkIdlzuwORM34u/qkmF5NQuc7OEatXHrgP7/enn5HV6jxDkNwU=
X-Received: by 2002:a2e:2114:: with SMTP id
 h20-v6mr40191061ljh.135.1534947179836; 
 Wed, 22 Aug 2018 07:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
 <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
 <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
In-Reply-To: <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Wed, 22 Aug 2018 07:12:52 -0700
Message-ID: <CAPnigKnV=GmBHtt0nVOPEOcxS=WZGg0NkuZfSqG7QrV-Yb6BfA@mail.gmail.com>
Subject: Re: Tagging master
To: Patrick Venture <venture@google.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000067a9a3057406bdec"
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
X-List-Received-Date: Wed, 22 Aug 2018 14:13:05 -0000

--00000000000067a9a3057406bdec
Content-Type: text/plain; charset="UTF-8"

We could do point releases on the major topic like 2.4.x for all tags
before 2.5 but after 2.4. It wouldn't really follow semantic versioning
since it doesnt only contain bugfixes. But if we cared about that we could
just do 2.4.0.y for bugfixes on a 2.4.0 branch.

On Wed, Aug 22, 2018, 07:08 Patrick Venture <venture@google.com> wrote:

> On Wed, Aug 22, 2018 at 7:04 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 22 Aug 2018 at 23:30, Patrick Venture <venture@google.com>
> wrote:
> > >
> > > On Tue, Aug 21, 2018 at 6:09 PM Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > Hello,
> > > >
> > > > I would like to propose we create a tag of master.
> > > >
> > > > The tags are useful for those who are working on openbmc, but also
> > > > supporting fellow developers and testers who may be working on the
> > > > host firmware, operating system or other tools like openstack. When
> > > > they have issues, a glance at the tag give us a rough idea of how old
> > > > their firmware is. As a developer, this gives me a rough idea of what
> > > > kind of issues to expect, but also how far I should dig before
> > > > suggesting "you need an update".
> > > >
> > > > I suggest we use tags as a lightweight epoch in our commit history.
> > > > They don't need to carry any additional meaning beyond being easier
> to
> > > > pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. This means
> > > > there's no garuntee that a tag contains new features, or has had any
> > > > more testing than any other commit.
> > >
> > > So this would be a non-versioned tag?  I believe we already have
> > > versions that are meant to track behind or with yocto (once the
> > > release schedule hits).  Since these aren't tested, I'd suggest they
> > > do have a naming scheme based on version, with may date in the tag and
> > > some indication that it's not stable.
> >
> > I don't follow. I was proposing we continue with the existing scheme,
> > so the tag for today would be v2.4.
> >
> > All of our builds are tested to some extent, what I meant by "not
> > tested" was we would not have a freeze, release candidate, branching
> > or similar. It would be a commit that passed CI.
>
> And now I'm confused. :D  I thought the release schedule from the
> release working group was pushing to drive versioning from yocto
> versioning, versus our own separate versioning.
>

--00000000000067a9a3057406bdec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We could do point releases on the major topic like 2.4.x =
for all tags before 2.5 but after 2.4. It wouldn&#39;t really follow semant=
ic versioning since it doesnt only contain bugfixes. But if we cared about =
that we could just do 2.4.0.y for bugfixes on a 2.4.0 branch.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018, 07:08 Patrick=
 Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Aug 22, 2018 at 7=
:04 AM Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank"=
 rel=3D"noreferrer">joel@jms.id.au</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 22 Aug 2018 at 23:30, Patrick Venture &lt;<a href=3D"mailto:ve=
nture@google.com" target=3D"_blank" rel=3D"noreferrer">venture@google.com</=
a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Aug 21, 2018 at 6:09 PM Joel Stanley &lt;<a href=3D"mailt=
o:joel@jms.id.au" target=3D"_blank" rel=3D"noreferrer">joel@jms.id.au</a>&g=
t; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would like to propose we create a tag of master.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The tags are useful for those who are working on openbmc, bu=
t also<br>
&gt; &gt; &gt; supporting fellow developers and testers who may be working =
on the<br>
&gt; &gt; &gt; host firmware, operating system or other tools like openstac=
k. When<br>
&gt; &gt; &gt; they have issues, a glance at the tag give us a rough idea o=
f how old<br>
&gt; &gt; &gt; their firmware is. As a developer, this gives me a rough ide=
a of what<br>
&gt; &gt; &gt; kind of issues to expect, but also how far I should dig befo=
re<br>
&gt; &gt; &gt; suggesting &quot;you need an update&quot;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I suggest we use tags as a lightweight epoch in our commit h=
istory.<br>
&gt; &gt; &gt; They don&#39;t need to carry any additional meaning beyond b=
eing easier to<br>
&gt; &gt; &gt; pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. Thi=
s means<br>
&gt; &gt; &gt; there&#39;s no garuntee that a tag contains new features, or=
 has had any<br>
&gt; &gt; &gt; more testing than any other commit.<br>
&gt; &gt;<br>
&gt; &gt; So this would be a non-versioned tag?=C2=A0 I believe we already =
have<br>
&gt; &gt; versions that are meant to track behind or with yocto (once the<b=
r>
&gt; &gt; release schedule hits).=C2=A0 Since these aren&#39;t tested, I&#3=
9;d suggest they<br>
&gt; &gt; do have a naming scheme based on version, with may date in the ta=
g and<br>
&gt; &gt; some indication that it&#39;s not stable.<br>
&gt;<br>
&gt; I don&#39;t follow. I was proposing we continue with the existing sche=
me,<br>
&gt; so the tag for today would be v2.4.<br>
&gt;<br>
&gt; All of our builds are tested to some extent, what I meant by &quot;not=
<br>
&gt; tested&quot; was we would not have a freeze, release candidate, branch=
ing<br>
&gt; or similar. It would be a commit that passed CI.<br>
<br>
And now I&#39;m confused. :D=C2=A0 I thought the release schedule from the<=
br>
release working group was pushing to drive versioning from yocto<br>
versioning, versus our own separate versioning.<br>
</blockquote></div>

--00000000000067a9a3057406bdec--
