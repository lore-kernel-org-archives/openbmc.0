Return-Path: <raltherr@google.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfC3Y6YwhzDqrm
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 03:10:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=iW8HpTrG; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id g13so22583494ioj.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=y2o+/3dlLGzBTaaypUNOobfPqL/Gx3YoPUT9NMpWLME=;
 b=iW8HpTrGtuF6mBs2Mv27uLXWvjguSe1LoLAkWN8eZJCXENzIgSJalfYtX39NWF/538
 Lt9WMFCEbfYm8Jwj8hMRFC7Im9+1ZlKJXyOmENJwgV64qU4HBlKUn6VGsvw4PXE3G39l
 Puyw+DcmcEZIQiV7c8R8EK3Yfvqs3hNgD8muI4RdzPc00cpJAkMoIlNYD7BUUE0+FwIL
 Mn9didz6tTu9A39po9bTzfL1G7uDP3j/+Ax8Ytl+KIMZmoyAA1VndoZCBOtsq5DL+MAo
 AzwTTBNYsOJbQllCRJoYGOXI0JGC+PhKyoQ1cZgiMF8+hWKTp7we1JHa/J8Hce/PREmQ
 NITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=y2o+/3dlLGzBTaaypUNOobfPqL/Gx3YoPUT9NMpWLME=;
 b=bC1vWT2M2x/9zEoxEZbGaLRQr2bPpc0YHl8UHQHpNEqh4WijKb7PxRsjm3QjFgcuuM
 H73CxBm6ld6dV8dakz5Z4Nwa1erVE1aY9EtEnK68o0w/m+PwoxNfa+GHoQGanpPwP8VG
 ACXnD7hPYFyvcBVbispe1bL6Fb7W26JPr/EuVyX50Fvr0CdxzSZiDLpWjNCOxRUYdXg9
 hrvKRzh+KLHKcLdbKeK/+bC/R4T6uuqTf/2Is3IFVaq/iYgeHa2bw4mvr0Ngo8YgCQp7
 eEcW4ZJ1b6dZxbAwRzzB7hqAM6xhhhrWZObq6b44VgqGhptrTP11YLd2zT4DJPEaZcOc
 ioyA==
X-Gm-Message-State: ALyK8tIQtgeu0f9vSIBgc8rklsUV2PQd4vwA1D3e1rh/O7DEsGuZpgcEr5IDHDb/kHN1kXiIdHDRsqlGMzW+nYmB
X-Received: by 10.107.58.65 with SMTP id h62mr606970ioa.172.1467133798780;
 Tue, 28 Jun 2016 10:09:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.101.202 with HTTP; Tue, 28 Jun 2016 10:09:58 -0700 (PDT)
In-Reply-To: <20160628163954.GO20922@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
 <20160628163954.GO20922@asimov.austin.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 28 Jun 2016 10:09:58 -0700
Message-ID: <CAPLgG==K75ZrwdByiiND1p2Rvdivkj_Nj7n1OGsmncm3mhGfFA@mail.gmail.com>
Subject: Re: Gerrit server migration
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114ac616ea9d97053659b478
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
X-List-Received-Date: Tue, 28 Jun 2016 17:10:02 -0000

--001a114ac616ea9d97053659b478
Content-Type: text/plain; charset=UTF-8

I'm willing to help with reviews in any of those groups.  I've had a career
that's plunged me into all of those languages quite deeply.

On Tue, Jun 28, 2016 at 9:39 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Joel,
>
> Both of these questions make me realize we should add the "answers" to
> the documentation.  I'll get it added after Adriana's initial Gerrit
> documentation is in.
>
> On Tue, Jun 28, 2016 at 01:22:57PM +0930, Joel Stanley wrote:
> > How do we get notifications when a patch is proposed for review?
>
> The overall documentation for it can be found here:
>
> https://gerrit-review.googlesource.com/Documentation/user-notify.html#user
>
> Also, you can view the documentation directly on our Gerrit server:
>     https://gerrit.openbmc-project.xyz/Documentation/user-notify.html#user
>
> The net is that you probably want to go to "Settings > Watched Projects"
> and add All-Projects to your subscription.  You can otherwise subscribe
> to individual repositories.
>
> Direct link:
>     https://gerrit.openbmc-project.xyz/#/settings/projects
>
> > Do we have owners of each component that must review before a patch
> > can be merged?
>
> Yes.  We should document the code-review process now that we can have
> one.
>
> Here are the current settings and what has worked well for us in the
> past with Gerrit.  Open to suggestions.
>
>     1. All users are able to +1 / -1 code.
>     2. A set of "maintainers" are able to +2 / -2 and submit code.
>     3. All commits should have (at least) two +1 reviews.
>         3a. Ideally the maintainer is not one of the +1.
>     4. Commits should not be merged with a -1 (or -2) unless there has
>        been a discussion by the maintainer to justify the merge.
>     5. The maintainer should ensure that all past -1 review comments
>        have been addressed in a follow-up patch set.  This is usually
>        handled by having the original -1 reviewer now give a +1.
>
> What I did initially was divide the repositories up based on their
> primary language and assign a maintainer group in Github.  Maybe I
> should make these groups public?
>
>     a. Bitbake recipes.
>         * Brad Bishop, Patrick Williams
>     b. Python repositories.
>         * Brad Bishop, Patrick Williams
>     c. C repositories.
>         * Joel Stanley, Jeremy Kerr
>     d. C++ repositories.
>         * Patrick Williams
>
> Over time I expect the repositories to be grouped more along functional
> lines and subsystem-style maintainers to come about based on their
> contributions.  (I know next to nothing about Python, so I'd be
> especially willing to add someone else in my place there to work with
> Brad.)
>
> You can see the current "maintainer group" assigned to a repository by
> going to "Projects > List > (select repo) > Access" and seeing the
> "Rights Inherit From" line.  By direct link, you can see 'obmc-console'
> is maintained by the 'openbmc-c-repos' group:
>
> https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc/obmc-console,access
>
> That 'openbmc-c-repos' group corresponds to the 'openbmc/c-maintainers'
> group
> on Github as evidenced by this:
> https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc-c-repos,access
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a114ac616ea9d97053659b478
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m willing to help with reviews in any of those group=
s.=C2=A0 I&#39;ve had a career that&#39;s plunged me into all of those lang=
uages quite deeply.</div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Tue, Jun 28, 2016 at 9:39 AM, Patrick Williams <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.x=
yz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Joel,<br>
<br>
Both of these questions make me realize we should add the &quot;answers&quo=
t; to<br>
the documentation.=C2=A0 I&#39;ll get it added after Adriana&#39;s initial =
Gerrit<br>
documentation is in.<br>
<span class=3D""><br>
On Tue, Jun 28, 2016 at 01:22:57PM +0930, Joel Stanley wrote:<br>
&gt; How do we get notifications when a patch is proposed for review?<br>
<br>
</span>The overall documentation for it can be found here:<br>
=C2=A0 =C2=A0 <a href=3D"https://gerrit-review.googlesource.com/Documentati=
on/user-notify.html#user" rel=3D"noreferrer" target=3D"_blank">https://gerr=
it-review.googlesource.com/Documentation/user-notify.html#user</a><br>
<br>
Also, you can view the documentation directly on our Gerrit server:<br>
=C2=A0 =C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/Documentation/u=
ser-notify.html#user" rel=3D"noreferrer" target=3D"_blank">https://gerrit.o=
penbmc-project.xyz/Documentation/user-notify.html#user</a><br>
<br>
The net is that you probably want to go to &quot;Settings &gt; Watched Proj=
ects&quot;<br>
and add All-Projects to your subscription.=C2=A0 You can otherwise subscrib=
e<br>
to individual repositories.<br>
<br>
Direct link:<br>
=C2=A0 =C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/#/settings/proj=
ects" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.x=
yz/#/settings/projects</a><br>
<span class=3D""><br>
&gt; Do we have owners of each component that must review before a patch<br=
>
&gt; can be merged?<br>
<br>
</span>Yes.=C2=A0 We should document the code-review process now that we ca=
n have<br>
one.<br>
<br>
Here are the current settings and what has worked well for us in the<br>
past with Gerrit.=C2=A0 Open to suggestions.<br>
<br>
=C2=A0 =C2=A0 1. All users are able to +1 / -1 code.<br>
=C2=A0 =C2=A0 2. A set of &quot;maintainers&quot; are able to +2 / -2 and s=
ubmit code.<br>
=C2=A0 =C2=A0 3. All commits should have (at least) two +1 reviews.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3a. Ideally the maintainer is not one of the +1=
.<br>
=C2=A0 =C2=A0 4. Commits should not be merged with a -1 (or -2) unless ther=
e has<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0been a discussion by the maintainer to justify t=
he merge.<br>
=C2=A0 =C2=A0 5. The maintainer should ensure that all past -1 review comme=
nts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0have been addressed in a follow-up patch set.=C2=
=A0 This is usually<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0handled by having the original -1 reviewer now g=
ive a +1.<br>
<br>
What I did initially was divide the repositories up based on their<br>
primary language and assign a maintainer group in Github.=C2=A0 Maybe I<br>
should make these groups public?<br>
<br>
=C2=A0 =C2=A0 a. Bitbake recipes.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Brad Bishop, Patrick Williams<br>
=C2=A0 =C2=A0 b. Python repositories.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Brad Bishop, Patrick Williams<br>
=C2=A0 =C2=A0 c. C repositories.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Joel Stanley, Jeremy Kerr<br>
=C2=A0 =C2=A0 d. C++ repositories.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Patrick Williams<br>
<br>
Over time I expect the repositories to be grouped more along functional<br>
lines and subsystem-style maintainers to come about based on their<br>
contributions.=C2=A0 (I know next to nothing about Python, so I&#39;d be<br=
>
especially willing to add someone else in my place there to work with<br>
Brad.)<br>
<br>
You can see the current &quot;maintainer group&quot; assigned to a reposito=
ry by<br>
going to &quot;Projects &gt; List &gt; (select repo) &gt; Access&quot; and =
seeing the<br>
&quot;Rights Inherit From&quot; line.=C2=A0 By direct link, you can see &#3=
9;obmc-console&#39;<br>
is maintained by the &#39;openbmc-c-repos&#39; group:<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc/obmc=
-console,access" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbm=
c-project.xyz/#/admin/projects/openbmc/obmc-console,access</a><br>
<br>
That &#39;openbmc-c-repos&#39; group corresponds to the &#39;openbmc/c-main=
tainers&#39; group<br>
on Github as evidenced by this:<br>
<a href=3D"https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc-c-re=
pos,access" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-pro=
ject.xyz/#/admin/projects/openbmc-c-repos,access</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span><br>_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a114ac616ea9d97053659b478--
