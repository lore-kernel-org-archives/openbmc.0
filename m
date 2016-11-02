Return-Path: <raltherr@google.com>
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7sms44W2zDvN8
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 13:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=P9VRDw8X; 
 dkim-atps=neutral
Received: by mail-yw0-x235.google.com with SMTP id t125so1492151ywc.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zuRQYaykRZCpW47Lpq3OCuYFJT0fdXAk+tkxHvd1Ww8=;
 b=P9VRDw8X9aBU31cRCxksbUBKDNn0Nd0gWdSBOvPOFAC0LgskF7inh2MWQqXM3E9+Ec
 FQdV4xw/HA6IBUlvOeH5pEOSM1JZYz83z6ZqG7mBuf19u+VHyYIWH1cmjgpFeLYyFCRe
 7MncakIn2V5Kq/tR5LApL1hKEvaq+haGBOy+f6rA8kGt8+yHMIyE7825SJS14wYPgypE
 xdNoCq58o2mA1NOXzfby40NWHK+k7vGDRGIhjfUDWPOzSXf6OjfH/SJkEyAvA/qwonIP
 gekH+2BQqHKKRw/EFff/plM+wAfsyvScPnut7xU310BXROM2zYN41yk/Wl4IaZeVKfoC
 pYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zuRQYaykRZCpW47Lpq3OCuYFJT0fdXAk+tkxHvd1Ww8=;
 b=V7sYIXGYpsYi5yLrDyWhqCM2LH1LCl/FvOfYrS/Dv+gfDjIPg6ORPkWWYNkgDvPZka
 z1eXKH1lb91S5/NS78DlCC1+HU/Uelga8D3K4txx34qGMFqqaGhzpai5LZs7bdOzDcY6
 dujYoTGqOF49BoO4nmVyKDXY7IUjzQPyKjm4Pgyn8XPhGdtvDDmqbHBF+GAsZYC8JmkZ
 pgH94kkvzQeSi87ndvoggMvlnu23U1UA8kCBvQIUb4QtW14HV0SkQMHCsn3IFkdF8Ok+
 Z51z3TQRqwxwX7YkijmNHEaZa7fmHc/y/L8vVeDl4PJBfaL8dXc2hnF3l2A6w77CJoeD
 wtuA==
X-Gm-Message-State: ABUngvek3eLqHqsS8MieYwh+L1uuFa80Enly/4JmBZnnh9PeJ4IMUYb463/3QUPKbmOvuZ1Yec/2C5BAuYDfdJBl
X-Received: by 10.13.244.65 with SMTP id d62mr876462ywf.117.1478054490849;
 Tue, 01 Nov 2016 19:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Tue, 1 Nov 2016 19:41:30 -0700 (PDT)
In-Reply-To: <CACPK8Xft1E3F+QStUcFn2zu2xQOR=PaTxTo-n1noUbLSh61huQ@mail.gmail.com>
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
 <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
 <20161101190930.gkr6bctv6iejbfj4@asimov>
 <CAFd5g45iH7=9EAmnN886DCCToxw-nJ5F_J4VuTxhj0030hHquQ@mail.gmail.com>
 <CACPK8Xft1E3F+QStUcFn2zu2xQOR=PaTxTo-n1noUbLSh61huQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 1 Nov 2016 19:41:30 -0700
Message-ID: <CAPLgG=kTHbCD_Gi-_h0KbHKUuV22NV6UrYN1tTtyTW5sFmYHBA@mail.gmail.com>
Subject: Re: Adding a MAINTAINERS file
To: Joel Stanley <joel@jms.id.au>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Patrick Williams <patrick@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c030b6ce34b1205404860ee
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
X-List-Received-Date: Wed, 02 Nov 2016 02:41:34 -0000

--94eb2c030b6ce34b1205404860ee
Content-Type: text/plain; charset=UTF-8

If you use a recent version of 'git review,' it accepts a list of reviewers
to add via --reviewers.

On Tue, Nov 1, 2016 at 4:33 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Nov 2, 2016 at 6:04 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >> I'm not sure how you can enforce specific reviewers in Gerrit without
> >> yet another config file per repo that we need to maintain.
> >
> >
> > Again, the goal of listing reviewers is not to enforce a particular set
> of
> > reviewers, but to offer a quick and easy reference as to who you should
> be
> > talking to; where to direct your questions; and consequently good people
> to
> > put on your code reviews; I see no reason to make that a requirement
> since a
> > maintainer has to sign-off anyway.
>
> Can we add tooling so pushing a review will cc the relevant
> maintainers automatically?
>
> In a past life I used repo to interact with gerrit, and we would add
> the reviewers to the command line. This would be similar to the kernel
> workflow of using get_maintainers.pl and git send-email. Perhaps this
> is already available for non-repo Gerrit users, and we just need to
> add it to our documentation.
>
> On the proposal in general; I think it's a good move. Did we consider
> using something like the OWNERS file that is used by Chromium? In that
> project, developers are added to an OWNERS file anywhere in the source
> tree to indicate they should be consulted over changes to that part of
> the tree.
>
>  http://dev.chromium.org/developers/owners-files
>
> As an example, this allows me indicate that I should be consulted when
> you are submitting a change to the u-boot or kernel parts of the tree,
> such as meta-phosphor/common/recipes-kernel.
>
> Cheers,
>
> Joel
>

--94eb2c030b6ce34b1205404860ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you use a recent version of &#39;git review,&#39; it ac=
cepts a list of reviewers to add via --reviewers.</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Tue, Nov 1, 2016 at 4:33 PM, Joel =
Stanley <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_=
blank">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div class=3D"HOEnZb"><div class=3D"h5">On Wed, Nov 2, 2016 at 6:04 AM, =
Brendan Higgins<br>
&lt;<a href=3D"mailto:brendanhiggins@google.com">brendanhiggins@google.com<=
/a>&gt; wrote:<br>
&gt;&gt; I&#39;m not sure how you can enforce specific reviewers in Gerrit =
without<br>
&gt;&gt; yet another config file per repo that we need to maintain.<br>
&gt;<br>
&gt;<br>
&gt; Again, the goal of listing reviewers is not to enforce a particular se=
t of<br>
&gt; reviewers, but to offer a quick and easy reference as to who you shoul=
d be<br>
&gt; talking to; where to direct your questions; and consequently good peop=
le to<br>
&gt; put on your code reviews; I see no reason to make that a requirement s=
ince a<br>
&gt; maintainer has to sign-off anyway.<br>
<br>
</div></div>Can we add tooling so pushing a review will cc the relevant<br>
maintainers automatically?<br>
<br>
In a past life I used repo to interact with gerrit, and we would add<br>
the reviewers to the command line. This would be similar to the kernel<br>
workflow of using <a href=3D"http://get_maintainers.pl" rel=3D"noreferrer" =
target=3D"_blank">get_maintainers.pl</a> and git send-email. Perhaps this<b=
r>
is already available for non-repo Gerrit users, and we just need to<br>
add it to our documentation.<br>
<br>
On the proposal in general; I think it&#39;s a good move. Did we consider<b=
r>
using something like the OWNERS file that is used by Chromium? In that<br>
project, developers are added to an OWNERS file anywhere in the source<br>
tree to indicate they should be consulted over changes to that part of<br>
the tree.<br>
<br>
=C2=A0<a href=3D"http://dev.chromium.org/developers/owners-files" rel=3D"no=
referrer" target=3D"_blank">http://dev.chromium.org/<wbr>developers/owners-=
files</a><br>
<br>
As an example, this allows me indicate that I should be consulted when<br>
you are submitting a change to the u-boot or kernel parts of the tree,<br>
such as meta-phosphor/common/recipes-<wbr>kernel.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--94eb2c030b6ce34b1205404860ee--
