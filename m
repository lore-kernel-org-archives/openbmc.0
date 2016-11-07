Return-Path: <yuenn@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC7tF2pxCzDvMQ
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 21:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c1KB9RmH"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id f82so108847095wmf.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 02:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CfBSzHlRrW/seMl2zNsAB82o83a3tXHJw6YSyIV82ZI=;
 b=c1KB9RmH0cxQCXT86yupVIpIStT7+B2tHwa7I5cyxFffxAVKyNK6j5qItHh8nZNbBC
 Gh1G1SMBPU1FmFqibvQSq+3m6mR8fTjBbO8nd6JnQzpUCAWSG0y95r+f4I0L0Urf6RcX
 LVAo0ZHYWtP8hVp5zkR8EdvnTk0sPVDMn0P0tZ8NXyjSZrJYY/dkulkx88bzkYwo3NCY
 WMA14MJbL87+GVGm+DfiW9hglmA7TrJwI+V6kyK97abhUc1C2iEPjQPt4gWyarXn3FvY
 lM7Ek91ZywqIYXOc0EEsuGKisP5DX+OyRk+xvGQtElPDb31Uy4ODG/Ra16HZGrNI2ZsB
 YC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CfBSzHlRrW/seMl2zNsAB82o83a3tXHJw6YSyIV82ZI=;
 b=AbI5nKnwEUuOWwKAEiJe03ZPNiEakaRGHB/QOQNDf/Rkpnvir4pnOR4F7OsaGlmRb/
 KxXkFtK9vtkkPRR1dgzGsZxdfFF60PUKx3pT8iqAVMpbVdpQiFLnLA4XiUeto2d9iNKz
 bJpjpSbiT4a1pQ/Y9nK8lyUIZy/eoBGWiaJ9CmMywOqCIOmUfKBsG2MWYpDXSfKtW6oW
 HOy0iTyVXNd6ARcBMbvk+1F4/9ND0xPEKfCP1Bbk0eoEyDjff2XgI8nGJdiYI1ZjzeYI
 uYE/UBzDGpDT7NLsWOhcAxVn2pfe0JnEyvxyuXeYPyxfI2LzkGj5TmSD/yW5G9ddLTCU
 Bc/w==
X-Gm-Message-State: ABUngvchdYJWcrQik/2rptCFptV9GbqLa4oSRVWp7KRM9ia2HS1F8ulbnPU/A9UbaFJJPpHiPd7u7H+HFjfjCSlf
X-Received: by 10.194.113.129 with SMTP id iy1mr4946141wjb.127.1478514450012; 
 Mon, 07 Nov 2016 02:27:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Mon, 7 Nov 2016 02:26:49 -0800 (PST)
In-Reply-To: <20161107034425.GA15757@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CADfYTpF_MtD2v07Rmopu11_VVo0SnzTKN73A9NqyBvtsTkSE_Q@mail.gmail.com>
 <20161107034425.GA15757@heinlein.lan>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 7 Nov 2016 02:26:49 -0800
Message-ID: <CADfYTpFJc1qp1tmwjeex6S7JTxmCQbJ7QyaOfqbPqqtdzNme7g@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1130cf0696d6170540b378af
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
X-List-Received-Date: Mon, 07 Nov 2016 10:27:34 -0000

--001a1130cf0696d6170540b378af
Content-Type: text/plain; charset=UTF-8

My comments inline.

On Sun, Nov 6, 2016 at 7:44 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Nancy,
>
> A few minor responses below.
>
> On Fri, Nov 04, 2016 at 02:46:42AM -0700, Nancy Yuen wrote:
> > As for fitting in the head of the contributor or maintainer, I don't
think
> > it's reasonable.  One of the points made during our meeting was that
> > openBMC should be a project other people can come in and contribute to.
> > Future contributors may or may not be devoting all their time to openBMC
> > and may not have the bandwidth to "fit" one of the repos in their head.
>
> What I meant by this was not that every contributor is expected to know
> all of the code, but that the maintainer is likely to know the internal
> APIs of it enough to be able to review contributions.  One of the main
> points of contention is a proposal that "makes it easier to review" and
> that is the part that makes more sense when you are talking about 1+
> MLOC of interdependent code.  That particular point is less interesting
> when you are talking about <50kLOC.
>
> > Btw, Google's codebase is not monolithic.
>
> I realize that was not likely the case, but those were the words Titus
> used in his public talk.
>
> > I also want to echo Brendan's caution in his reply with regard to citing
> > industry experts.  [3] is not a list of do and don't dos by industry
> > experts.  Their abstract clearly states "Please try to verify or
disprove
> > rules! In particular, we'd really like to have some of our rules backed
up
> > with measurements or better examples"
>
> I feel you have taken this one sentence very much out of context.

I disagree.

>
> The first paragraph of the abstract says:
>
>     The C++ Core Guidelines are a collaborative effort led by Bjarne
>     Stroustrup, much like the C++ language itself. They are the result of
>     many person-years of discussion and design across a number of
>     organizations. Their design encourages general applicability and broad
>     adoption but they can be freely copied and modified to meet your
>     organization's needs.
>
> They are actively encouraging others to use this list.  The also state

I did not suggest they were encouraging people not to use their guidelines.

> in the abstract:
>
>     The rules are designed to be supported by an analysis tool. Violations
>     of rules will be flagged with references (or links) to the relevant
>     rule. We do not expect you to memorize all the rules before trying to
>     write code.
>
> In fact, clang-tidy has a number of checks for these rules to encourage
> their use.

I would love it if we could install clang-tidy to enforce these rules on
openBMC's gerrit.

>
> The one sentence you quoted I read as "We are willing to change these
> rules if evidence points to the contrary.  Please prove us wrong."  And,
> in fact, the guidelines are "actively maintained" on Github and have
> changed since their original introduction.

Actually, the sentence I quoted specifically mentions both verifying and
disproving their rules, not just disproving.  To me that says the rules
aren't perfect, may be wrong, have unintended consequences, scenarios when
it doesn't work etc.  To me it says please feel free to check that rules
have the intended affect and not use them blindly.

>
> --
> Patrick Williams

----------
Nancy

--001a1130cf0696d6170540b378af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My comments inline.<br><br>On Sun, Nov 6, 2016 at 7:44 PM,=
 Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank=
">patrick@stwcx.xyz</a>&gt; wrote:<br>&gt;<br>&gt; Nancy,<br>&gt;<br>&gt; A=
 few minor responses below.<br>&gt;<br>&gt; On Fri, Nov 04, 2016 at 02:46:4=
2AM -0700, Nancy Yuen wrote:<br>&gt; &gt; As for fitting in the head of the=
 contributor or maintainer, I don&#39;t think<br>&gt; &gt; it&#39;s reasona=
ble.=C2=A0 One of the points made during our meeting was that<br>&gt; &gt; =
openBMC should be a project other people can come in and contribute to.<br>=
&gt; &gt; Future contributors may or may not be devoting all their time to =
openBMC<br>&gt; &gt; and may not have the bandwidth to &quot;fit&quot; one =
of the repos in their head.<br>&gt;<br>&gt; What I meant by this was not th=
at every contributor is expected to know<br>&gt; all of the code, but that =
the maintainer is likely to know the internal<br>&gt; APIs of it enough to =
be able to review contributions.=C2=A0 One of the main<br>&gt; points of co=
ntention is a proposal that &quot;makes it easier to review&quot; and<br>&g=
t; that is the part that makes more sense when you are talking about 1+<br>=
&gt; MLOC of interdependent code.=C2=A0 That particular point is less inter=
esting<br>&gt; when you are talking about &lt;50kLOC.<br>&gt;<br>&gt; &gt; =
Btw, Google&#39;s codebase is not monolithic.<br>&gt;<br>&gt; I realize tha=
t was not likely the case, but those were the words Titus<br>&gt; used in h=
is public talk.<br>&gt;<br>&gt; &gt; I also want to echo Brendan&#39;s caut=
ion in his reply with regard to citing<br>&gt; &gt; industry experts. =C2=
=A0[3] is not a list of do and don&#39;t dos by industry<br>&gt; &gt; exper=
ts.=C2=A0 Their abstract clearly states &quot;Please try to verify or dispr=
ove<br>&gt; &gt; rules! In particular, we&#39;d really like to have some of=
 our rules backed up<br>&gt; &gt; with measurements or better examples&quot=
;<br>&gt;<br>&gt; I feel you have taken this one sentence very much out of =
context.<div><br></div><div>I disagree.</div><div><br></div><div>&gt;<br>&g=
t; The first paragraph of the abstract says:<br>&gt;<br>&gt; =C2=A0 =C2=A0 =
The C++ Core Guidelines are a collaborative effort led by Bjarne<br>&gt; =
=C2=A0 =C2=A0 Stroustrup, much like the C++ language itself. They are the r=
esult of<br>&gt; =C2=A0 =C2=A0 many person-years of discussion and design a=
cross a number of<br>&gt; =C2=A0 =C2=A0 organizations. Their design encoura=
ges general applicability and broad<br>&gt; =C2=A0 =C2=A0 adoption but they=
 can be freely copied and modified to meet your<br>&gt; =C2=A0 =C2=A0 organ=
ization&#39;s needs.<br>&gt;<br>&gt; They are actively encouraging others t=
o use this list.=C2=A0 The also state</div><div><br></div><div>I did not su=
ggest they were encouraging people not to use their guidelines.</div><div><=
br>&gt; in the abstract:<div>&gt;<br>&gt; =C2=A0 =C2=A0 The rules are desig=
ned to be supported by an analysis tool. Violations<br>&gt; =C2=A0 =C2=A0 o=
f rules will be flagged with references (or links) to the relevant<br>&gt; =
=C2=A0 =C2=A0 rule. We do not expect you to memorize all the rules before t=
rying to<br>&gt; =C2=A0 =C2=A0 write code.<br>&gt;<br>&gt; In fact, clang-t=
idy has a number of checks for these rules to encourage<br>&gt; their use.<=
/div><div><br></div><div>I would love it if we could install clang-tidy to =
enforce these rules on openBMC&#39;s gerrit.</div><div><br>&gt;<br>&gt; The=
 one sentence you quoted I read as &quot;We are willing to change these<br>=
&gt; rules if evidence points to the contrary.=C2=A0 Please prove us wrong.=
&quot; =C2=A0And,<br>&gt; in fact, the guidelines are &quot;actively mainta=
ined&quot; on Github and have<br>&gt; changed since their original introduc=
tion.</div><div><br></div><div>Actually, the sentence I quoted specifically=
 mentions both verifying and disproving their rules, not just disproving.=
=C2=A0 To me that says the rules aren&#39;t perfect, may be wrong, have uni=
ntended consequences, scenarios when it doesn&#39;t work etc.=C2=A0 To me i=
t says please feel free to check that rules have the intended affect and no=
t use them blindly.</div><div><br></div><div>&gt;<br>&gt; --<br>&gt; Patric=
k Williams</div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><di=
v class=3D"gmail_signature">----------<br>Nancy</div></div></div></div>

--001a1130cf0696d6170540b378af--
