Return-Path: <emilyshaffer@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::234; helo=mail-wm0-x234.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xi3kU51t"; 
 dkim-atps=neutral
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2Z2x6JXQzDwP9
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 01:36:40 +1100 (AEDT)
Received: by mail-wm0-x234.google.com with SMTP id r78so16436485wme.5
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bwYTnDlRGFdNyb4iYTUPIvrSNxnpEvHkGdzJ92fxMms=;
 b=Xi3kU51tSA99Fus8oSdR/VSS2393vhXkfgDALTmqmhxQs4Cl1fFmEpHz7Csjlgdh0h
 tsIZzIeRefZ7W9iGN/PRV4f3UCGZ8MkRZ1qotvAOV0KxZqh6LnTvLE1XhrhhKhmyG8Vu
 n9wNwKLv0NBimuRfmqubXgZmbtnhg9pA3znsAP5HnFsOgQHU5Ypi96DZ3cLCLQR575KS
 hgoFK23XNgkKCYjQGpMNbYlk7n/lULTha2QoWkFm7nU4tF3icY2sNGz1bkeHq3aFpstZ
 atw27d91k+XcQ5YduHO+f3aL2xgjaqWI9dFL38D+yKFLl3lGzZugPlBrN9WKvJk2GBFn
 5zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bwYTnDlRGFdNyb4iYTUPIvrSNxnpEvHkGdzJ92fxMms=;
 b=NhggIX/GarUSv9VxZkwAcvlcXAiz+UUtcVhCCEPpIZlSlegQKJVkBniORPMusKhasL
 D8dyJU0VoA/sZcY88dNWpwukJuzvZPEocAkTOE4vIqdvQeAufGr4Wq3Bpc24cU3CrM1G
 HjAWCOX1gnEEm1I25XiD672CWWA5XkCbQ9dYsCx0qC+aFkbcxVIc9M4f3lmpgVwqdt0u
 FubU/E/ZAf+E8DNH5oxlx1M7AvTi1Gw3LO4wyeO8E/rhZd4vuc4F2HRFvEhIxJr2DCbL
 WF8F4N4QpLY7IDAX6SUsdoPGGHD0rmfWQ7pizkeE26HoWv3TBPq/xF5xuKx/seRh3EOn
 vCfg==
X-Gm-Message-State: AKGB3mITNKF0bT11zakxwgXUD6nTvRGUZ7jA7TSuD/eWlQfNmkMAs2XX
 LcvvLQ/mkTAa2Hdb6DREwR0nSjcjKt4xlVTYI7wcMw==
X-Google-Smtp-Source: ACJfBot+sjI7tTvqBXQ63cCYVjSg0Kys8vHi3dcVN3f0e0/HzEBPFBB8MlHhwbEZsBOPXDhSXEPyZrh/2XIs1nxW+Is=
X-Received: by 10.28.196.194 with SMTP id u185mr10604812wmf.133.1513866996956; 
 Thu, 21 Dec 2017 06:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
 <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
 <26588692-d769-00b8-faf5-104d3b13be00@linux.intel.com>
 <3e7d0315-d4b9-48a4-c48b-0804de27ee29@molgen.mpg.de>
In-Reply-To: <3e7d0315-d4b9-48a4-c48b-0804de27ee29@molgen.mpg.de>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 21 Dec 2017 14:36:26 +0000
Message-ID: <CAJoAoZm9ScASt0M0gTDb1bY3TtW4QWs3AyRov4sVaTMAqiMyHA@mail.gmail.com>
Subject: Re: Gerrit alternatives
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Dave Cobbley <david.j.cobbley@linux.intel.com>, 
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c19401097f8b60560daa0d5"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 14:36:43 -0000

--94eb2c19401097f8b60560daa0d5
Content-Type: text/plain; charset="UTF-8"

In my own experience, not having iterative code reviews ends up being more
trouble than it's worth.  But if others are in favor of reviewees squashing
a commit per iteration during the actual pull, that's fine with me.  I
personally prefer a fetch/rebase personal workflow so Gerrit works well for
me when it works, but I understand with the issues we've been having with
the server if there's a better or cheaper or more reliable alternative it's
worth learning the new workflow.

Emily

On Thu, Dec 21, 2017 at 1:56 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:

> Dear Dave, dear Andrew,
>
>
> On 12/20/17 23:27, Dave Cobbley wrote:
> > On 12/20/2017 12:31 PM, Andrew Geissler wrote:
> >> On Tue, Dec 19, 2017 at 7:26 PM, Dave Cobbley wrote:
>
> >>> I am curious to see peoples input on using github as a code
> >>> review mechanism over gerrit. I see github/openbmc is already
> >>> used quite well for sprint planning and issue tracking, I feel
> >>> like it would make a lot of sense to use it for doing code
> >>> reviews. As far as I understand it has a mechanism to reproduce a
> >>> similar paradigm to what we currently use today - as far as
> >>> Code-Review, Ok-To-Test, and Verified.
> >>>
> >>> I can see github has made several improvements over the last few
> >>> years that make it much more use-able to teams like us:
> >>>
> >>> - The ability to have approved maintainers for each specific
> >>> repository with
> >>> https://github.com/blog/2392-introducing-code-owners
> >>>
> >>> - It has the ability to do a rebase-merge, keeping the git tree
> >>> nice and tidy.
> >>>
> >>> - A strong API to tie in additional tools that we may need.
> >>>
> >>>
> >>> Additionally, it will reduce the point of failure from also
> >>> hosting gerrit.
> >>>
> >>> What are peoples thoughts on using this?
> >> As the guy who ended up having to maintain the current gerrit
> >> server, I'm all for an alternative :)
>  >
> > First off - thanks for maintaining the current Gerrit server, I'm
> > sure it's as glamorous as it sounds :)
>  >
> >> But my problem is I really like gerrit.  github has def made some
> >> improvements to the review process though.  I see it has per-line
> >> comment ability now.
>  >
> > I have been using gerrit for quite a while and am quite accustomed to
> > it as well.
>  >
> >> I have a pull request out here for a non-gerrit openbmc repo if
> >> someone wants to look around -
> >> https://github.com/openbmc/openbmc-tools/pull/5
> >>
> >> One thing I really like is how gerrit allows you to iterate over a
> >> commit.  Someone makes some comments, you respond, upload a new
> >> patch set.  My understanding with github is you basically just keep
> >> adding on new commits in a pull request to address comments.  A
> >> feature I use all the time in gerrit is to look at the diff between
> >> a patch set I last reviewed and the latest one.  Also, I don't see
> >> an obvious mechanism in github to provide the different score
> >> levels (-2,-1,+1,+2)?  The gerrit dashboard is also really nice,
> >> providing me a nice easy way to see what's on my review list and
> >> what the current size and scores of those reviews are (for all
> >> repos in openbmc).
>  >
> > It appears that iterating over commits with github is as easy. When
> > someone checks in an additional commit to address some comments, you
> > can open their pull request, see the newest commit, and click on the
> > button which has the SHA on it, this will show you exactly what new
> > code has been checked in for that commit. When the code is ready to
> > be pulled into master, you can squash and merge to combine all
> > commits into one.
>
> It really depends on your development model and personal opinion, what
> is useful. Do you want a clean history and therefore allow rebasing or not.
>
> Then again, I do not understand why you should be forced to not force
> push to a branch so that the user interface can make your life easier.
>
> Personally, I do not understand how it is a good idea to squash all
> commits into one. You loose the ability to bisect small changes and the
> commit message probably also needs to be rewritten.
>
> Gerrit really excels GitHub in that regard. The only downside to my
> knowledge is, that merging is not supported in Gerrit. But a linear
> history is also fine.
>
> So as Gerrit is running, I personally would stay with Gerrit.
>
> > You're right about the review level, the only granularity I can see
> > is essentially a +0 (comment), and a +/-2 (Approve/request changes),
> > I would love to find a work around to this, or see if we could work
> > in a paradigm without +/- 1.
> >
> > The gerrit dashboard is nice out of the box, but the github filter
> > gives you the same flexibility (and a bit more). I can set: is:open
> > is:pr review-requested:dcobbley to look at all reviews (awaiting
> > reviews from me), or is:open is:pr review:none (reviews that has no
> > review). I definitely think this issomething that people could easily
> > adjust to.
>  >
> >> We also base a lot of our current CI infrastructure off of gerrit
> >> events.  I think most of it can be switched over to using github,
> >> but it's not inconsequential.
>  >
> > I can definitely understand an upfront cost has already been given,
> > and switching to something else would require more work, but I don't
> > really want that to be a blocking issue if something else does offer
> > significant improvement (something I'm still trying to identify with
> > github vs gerrit).
> >
> >> Our current gerrit VM costs on the order of $60 a year....so you
> >> get what you pay for.  I've been poking around IBM trying to see if
> >> we can get something a bit more production worthy.
>
>
> Kind regards,
>
> Paul
>
>

--94eb2c19401097f8b60560daa0d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In my own experience, not having iterative code reviews en=
ds up being more trouble than it&#39;s worth.=C2=A0 But if others are in fa=
vor of reviewees squashing a commit per iteration during the actual pull, t=
hat&#39;s fine with me.=C2=A0 I personally prefer a fetch/rebase personal w=
orkflow so Gerrit works well for me when it works, but I understand with th=
e issues we&#39;ve been having with the server if there&#39;s a better or c=
heaper or more reliable alternative it&#39;s worth learning the new workflo=
w.<div><br></div><div>Emily<br><div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Thu, Dec 21, 2017 at 1:56 AM Paul Menzel &lt;<a href=3D"ma=
ilto:pmenzel@molgen.mpg.de">pmenzel@molgen.mpg.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Dear Dave, dear Andrew,<br>
<br>
<br>
On 12/20/17 23:27, Dave Cobbley wrote:<br>
&gt; On 12/20/2017 12:31 PM, Andrew Geissler wrote:<br>
&gt;&gt; On Tue, Dec 19, 2017 at 7:26 PM, Dave Cobbley wrote:<br>
<br>
&gt;&gt;&gt; I am curious to see peoples input on using github as a code<br=
>
&gt;&gt;&gt; review mechanism over gerrit. I see github/openbmc is already<=
br>
&gt;&gt;&gt; used quite well for sprint planning and issue tracking, I feel=
<br>
&gt;&gt;&gt; like it would make a lot of sense to use it for doing code<br>
&gt;&gt;&gt; reviews. As far as I understand it has a mechanism to reproduc=
e a<br>
&gt;&gt;&gt; similar paradigm to what we currently use today - as far as<br=
>
&gt;&gt;&gt; Code-Review, Ok-To-Test, and Verified.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I can see github has made several improvements over the last f=
ew<br>
&gt;&gt;&gt; years that make it much more use-able to teams like us:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - The ability to have approved maintainers for each specific<b=
r>
&gt;&gt;&gt; repository with<br>
&gt;&gt;&gt; <a href=3D"https://github.com/blog/2392-introducing-code-owner=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/blog/2392-introd=
ucing-code-owners</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - It has the ability to do a rebase-merge, keeping the git tre=
e<br>
&gt;&gt;&gt; nice and tidy.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - A strong API to tie in additional tools that we may need.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Additionally, it will reduce the point of failure from also<br=
>
&gt;&gt;&gt; hosting gerrit.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What are peoples thoughts on using this?<br>
&gt;&gt; As the guy who ended up having to maintain the current gerrit<br>
&gt;&gt; server, I&#39;m all for an alternative :)<br>
=C2=A0&gt;<br>
&gt; First off - thanks for maintaining the current Gerrit server, I&#39;m<=
br>
&gt; sure it&#39;s as glamorous as it sounds :)<br>
=C2=A0&gt;<br>
&gt;&gt; But my problem is I really like gerrit.=C2=A0 github has def made =
some<br>
&gt;&gt; improvements to the review process though.=C2=A0 I see it has per-=
line<br>
&gt;&gt; comment ability now.<br>
=C2=A0&gt;<br>
&gt; I have been using gerrit for quite a while and am quite accustomed to<=
br>
&gt; it as well.<br>
=C2=A0&gt;<br>
&gt;&gt; I have a pull request out here for a non-gerrit openbmc repo if<br=
>
&gt;&gt; someone wants to look around -<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc-tools/pull/5" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc-tools/pul=
l/5</a><br>
&gt;&gt;<br>
&gt;&gt; One thing I really like is how gerrit allows you to iterate over a=
<br>
&gt;&gt; commit.=C2=A0 Someone makes some comments, you respond, upload a n=
ew<br>
&gt;&gt; patch set.=C2=A0 My understanding with github is you basically jus=
t keep<br>
&gt;&gt; adding on new commits in a pull request to address comments.=C2=A0=
 A<br>
&gt;&gt; feature I use all the time in gerrit is to look at the diff betwee=
n<br>
&gt;&gt; a patch set I last reviewed and the latest one.=C2=A0 Also, I don&=
#39;t see<br>
&gt;&gt; an obvious mechanism in github to provide the different score<br>
&gt;&gt; levels (-2,-1,+1,+2)?=C2=A0 The gerrit dashboard is also really ni=
ce,<br>
&gt;&gt; providing me a nice easy way to see what&#39;s on my review list a=
nd<br>
&gt;&gt; what the current size and scores of those reviews are (for all<br>
&gt;&gt; repos in openbmc).<br>
=C2=A0&gt;<br>
&gt; It appears that iterating over commits with github is as easy. When<br=
>
&gt; someone checks in an additional commit to address some comments, you<b=
r>
&gt; can open their pull request, see the newest commit, and click on the<b=
r>
&gt; button which has the SHA on it, this will show you exactly what new<br=
>
&gt; code has been checked in for that commit. When the code is ready to<br=
>
&gt; be pulled into master, you can squash and merge to combine all<br>
&gt; commits into one.<br>
<br>
It really depends on your development model and personal opinion, what<br>
is useful. Do you want a clean history and therefore allow rebasing or not.=
<br>
<br>
Then again, I do not understand why you should be forced to not force<br>
push to a branch so that the user interface can make your life easier.<br>
<br>
Personally, I do not understand how it is a good idea to squash all<br>
commits into one. You loose the ability to bisect small changes and the<br>
commit message probably also needs to be rewritten.<br>
<br>
Gerrit really excels GitHub in that regard. The only downside to my<br>
knowledge is, that merging is not supported in Gerrit. But a linear<br>
history is also fine.<br>
<br>
So as Gerrit is running, I personally would stay with Gerrit.<br>
<br>
&gt; You&#39;re right about the review level, the only granularity I can se=
e<br>
&gt; is essentially a +0 (comment), and a +/-2 (Approve/request changes),<b=
r>
&gt; I would love to find a work around to this, or see if we could work<br=
>
&gt; in a paradigm without +/- 1.<br>
&gt;<br>
&gt; The gerrit dashboard is nice out of the box, but the github filter<br>
&gt; gives you the same flexibility (and a bit more). I can set: is:open<br=
>
&gt; is:pr review-requested:dcobbley to look at all reviews (awaiting<br>
&gt; reviews from me), or is:open is:pr review:none (reviews that has no<br=
>
&gt; review). I definitely think this issomething that people could easily<=
br>
&gt; adjust to.<br>
=C2=A0&gt;<br>
&gt;&gt; We also base a lot of our current CI infrastructure off of gerrit<=
br>
&gt;&gt; events.=C2=A0 I think most of it can be switched over to using git=
hub,<br>
&gt;&gt; but it&#39;s not inconsequential.<br>
=C2=A0&gt;<br>
&gt; I can definitely understand an upfront cost has already been given,<br=
>
&gt; and switching to something else would require more work, but I don&#39=
;t<br>
&gt; really want that to be a blocking issue if something else does offer<b=
r>
&gt; significant improvement (something I&#39;m still trying to identify wi=
th<br>
&gt; github vs gerrit).<br>
&gt;<br>
&gt;&gt; Our current gerrit VM costs on the order of $60 a year....so you<b=
r>
&gt;&gt; get what you pay for.=C2=A0 I&#39;ve been poking around IBM trying=
 to see if<br>
&gt;&gt; we can get something a bit more production worthy.<br>
<br>
<br>
Kind regards,<br>
<br>
Paul<br>
<br>
</blockquote></div></div></div></div></div>

--94eb2c19401097f8b60560daa0d5--
