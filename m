Return-Path: <yuenn@google.com>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9H7M52V9zDvQV
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 20:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Wykj2tHm"; 
 dkim-atps=neutral
Received: by mail-wm0-x22f.google.com with SMTP id t79so38161055wmt.0
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ISXhxUYR843HfcQBcNgZVs91cNl/48Vhw2HHa122L4o=;
 b=Wykj2tHmpZY+W04pMqHH/XfBQiqk+uMYuSGBnZXznR3/e+KfvZBpRjPReVvKbCUrcw
 v9DM/7O76knJERY1F6X4f948VY+OFP20aHL35he0mIywoaANmVHRZZflzcihY/ay5rQl
 nX/c1gS8xLfQfTThR3A3S+jy2QQol2Ef2zFDNnpKOxtYZmgrlwVnH9p/15MEF8t3B3+O
 Z8h61YARsqZUGhymKoYTVigMhiFOiLsc7wziFD8rO3L3DSjvd5ab7/73s8j7LJY/rfuZ
 flyVWQo411ZxKbZue/rdAnKDRfgQ9Uu2ZWYMKFgUf/7HF/YTAoBOt72Cp93OGVOjZiuF
 zcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ISXhxUYR843HfcQBcNgZVs91cNl/48Vhw2HHa122L4o=;
 b=flvYxu8mKrR1mm75YT25zlhS+N2Y+A1MDTVvZbqfjSVpUZDIUW57Dd8W9RS8rNKNip
 PkBiSE+sS6ZX4Pxum0h3NHDnd8GqXouVQ6KkB1QVpUnI3wjGwq8c0RqCwoJSUr4jOv8G
 Oa9ZH2hmkDBbxZ2bH4FioVZsJ8HZR3RF8BWBVBWUoiiw3FhhQPVB4EFo9AftV4aoNVwT
 1P5V353/SS++RFlWiZ+K4cMJIOlNS0Mf6zOlJ942tfDHa4bbiIIM5OwEPnXixMdhnPRB
 C/b12iRl5FlhWMbsIFjKtuqAkEWhScWh+6TJRYjzXqePVqAPr6NGUB6N3J7sTyxzrT7a
 tHOw==
X-Gm-Message-State: ABUngvdzhRPn5DIwHgUcnkUMw7VwvNQjcnVIjDwwjyDIQSIKqQjhEpfRmO8j8l920AwMhwzprcdP0h+CqrF+f8Jf
X-Received: by 10.28.30.3 with SMTP id e3mr2606479wme.40.1478252843523; Fri,
 04 Nov 2016 02:47:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Fri, 4 Nov 2016 02:46:42 -0700 (PDT)
In-Reply-To: <20161102171839.GB17105@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 4 Nov 2016 02:46:42 -0700
Message-ID: <CADfYTpF_MtD2v07Rmopu11_VVo0SnzTKN73A9NqyBvtsTkSE_Q@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114b3508a0c6be0540768f74
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
X-List-Received-Date: Fri, 04 Nov 2016 09:47:28 -0000

--001a114b3508a0c6be0540768f74
Content-Type: text/plain; charset=UTF-8

Thanks Brendan for putting this list together and getting the discussion
going.
It's an important discussion to have.  A coding style or coding guidelines
is crucial developing software collaboratively and effectively.  Especially
since we all want OpenBMC to have other contributors eventually.
I'm still catching up on thread.  I wanted to give my reply to Patrick's
msg even though Brendan's has already replied.

On Wed, Nov 2, 2016 at 10:18 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Our legacy product is somewhere between 1 and 3 MLOC.  Titus talked
> about the internal Google repository being on the order of 10 MLOC.
> Code bases this big certainly have unique problems and the code rules
> were put in place to mitigate some of these problems.  The two key
> points of Titus' talk were:
>
>     1) Have a style guide; tailor it to your situation.
>     2) Use your guide to encourage "good" and discourage "bad".
>
> I strongly feel that if we simply leap to a style guide targeting a
> monolithic N-MLOC codebase, we are taking on solutions that are not
> relevant to our own problems.  My expectation is that OpenBMC is a
> collection of small, self-contained repositories on the order of 5 -
> 50kLOC each.  The dependencies between repositories (interfaces) are
> purposefully segmented via the DBus interfaces, which represent a very
> different problem from a monolitic codebase where a new dependency is
> simply an #include away.  With small repositories, the code itself can
> "fit in the head" of a maintainer or active contributor fairly easily[1].

The features Brendan discusses may appear in the Google style guide but
they are equally applicable to smaller code bases.  In fact, I've worked on
embedded systems with a much smaller code base, prior to working at Google,
and the style guide had most, if not all, these items.

As for fitting in the head of the contributor or maintainer, I don't think
it's reasonable.  One of the points made during our meeting was that
openBMC should be a project other people can come in and contribute to.
Future contributors may or may not be devoting all their time to openBMC
and may not have the bandwidth to "fit" one of the repos in their head.

Btw, Google's codebase is not monolithic.

> My typical philosophy regarding coding practices tends to be fairly
> pragmatic.  I don't tend to see practices as "black" and "white" but
> more along a scale of how much justification you need to have to use a
> practice (more on this in the specifics, maybe).  The aspects that
> concern me more, when I am doing code reviews, are in the general sense:
>
>     1) Conciseness:
>         - Did you use far more lines of code to solve the problem than
>           necessary?  Those are lines we have to maintain.
>     2) Modern, widely-accepted practices:
>         - This is already spelled out in the 'contributing' doc, having
>           priority over any specific style statements. [2]
>     3) Performance:
>         - Favoring in order { Code size, CPU utilization, memory size }
>           due to the unique concerns of the OpenBMC project and current
>           technologies used.
>         - Macro-level optimization that does not violate conciseness and
>           clarity:
>             - Are the algorithms used of the appropriate algorithmic
>               complexity?
>             - Are you avoiding practices that would contribute to large
>               generated code sizes?

We're not suggesting the style guide be black and white.  Every rule has
it's exceptions.  But rules provide structure which is necessary when
trying to collaborate.

Thank you for this list.  It's general, but still helpful for those of use
sending code to you for review.

> Quantifying "code smell" into a set of non-ambiguous rules is a hard
> problem and, as such, one that I have avoided up until now.  I would
> prefer we start with industry recognized experts opinion[3] and then
> document deviations specific to OpenBMC as they come up.

I haven't read all of [3] in detail but,Brendan's list isn't meant to
replace any industry guideline, just spell out guidelines for a few things
that we feel are particularly important to writing concise, debuggable code.

And while it's hard to write a set of guidelines, it's a worthwhile task to
complete.  From [3] "Please remember that one purpose of a guideline is to
help someone who is less experienced or coming from a different background
or language to get up to speed."  Ideally, as OpenBMC is adopted, there
will be more contributors, so this guideline will help them.  Right now,
it'll help us collaborate.

I also want to echo Brendan's caution in his reply with regard to citing
industry experts.  [3] is not a list of do and don't dos by industry
experts.  Their abstract clearly states "Please try to verify or disprove
rules! In particular, we'd really like to have some of our rules backed up
with measurements or better examples"


> >     * Variables of class type with static storage duration (including
> > constants),
> CppCoreGuidelines I.22 and R.6 already have this point covered
> sufficiently to me without further elaboration.
> >     * Implicit conversion constructors and operators
> CppCoreGuidelines has a "To-do: Unclassified proto-rules" section which
> says "Avoid implicit conversions".

For these items, I think the CppCoreGuidelines are more or less in line
with what Brendan has proposed.

> > On the other hand, we do not think restrictions should be placed on
using
> > virtual
> > functions.
>
> I was not proposing an elimination or prohibition on virtual functions,
> but a "justification required".  As in, you need to be prepared to
> answer how this is better and why compile-time polymorphism would be
> insufficient.
>
> CppCoreGuidelines C.10 suggests effectively the same thing: "You need a
> reason for using a hierarchy."

CppCoreGuidelines do list reasons for using a hierarchy in C.120-122.  I
think these are sufficient for most of the cases of inheritance that we'd
be interested in.


----------
Nancy

--001a114b3508a0c6be0540768f74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Brendan for putting this list together and get=
ting the discussion going.</div><div>It&#39;s an important discussion to ha=
ve.=C2=A0 A coding style or coding guidelines is crucial developing softwar=
e collaboratively and effectively.=C2=A0 Especially since we all want OpenB=
MC to have other contributors eventually.</div><div>I&#39;m still catching =
up on thread.=C2=A0 I wanted to give my reply to Patrick&#39;s msg even tho=
ugh Brendan&#39;s has already replied.</div><div><br></div><div>On Wed, Nov=
 2, 2016 at 10:18 AM, Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.=
xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><div>&gt; Our legacy product=
 is somewhere between 1 and 3 MLOC.=C2=A0 Titus talked<br>&gt; about the in=
ternal Google repository being on the order of 10 MLOC.<br>&gt; Code bases =
this big certainly have unique problems and the code rules<br>&gt; were put=
 in place to mitigate some of these problems.=C2=A0 The two key<br>&gt; poi=
nts of Titus&#39; talk were:<br>&gt;<br>&gt; =C2=A0 =C2=A0 1) Have a style =
guide; tailor it to your situation.<br>&gt; =C2=A0 =C2=A0 2) Use your guide=
 to encourage &quot;good&quot; and discourage &quot;bad&quot;.<br>&gt;<br>&=
gt; I strongly feel that if we simply leap to a style guide targeting a<br>=
&gt; monolithic N-MLOC codebase, we are taking on solutions that are not<br=
>&gt; relevant to our own problems.=C2=A0 My expectation is that OpenBMC is=
 a<br>&gt; collection of small, self-contained repositories on the order of=
 5 -<br>&gt; 50kLOC each.=C2=A0 The dependencies between repositories (inte=
rfaces) are<br>&gt; purposefully segmented via the DBus interfaces, which r=
epresent a very<br>&gt; different problem from a monolitic codebase where a=
 new dependency is<br>&gt; simply an #include away.=C2=A0 With small reposi=
tories, the code itself can<br>&gt; &quot;fit in the head&quot; of a mainta=
iner or active contributor fairly easily[1].<br></div><div><br></div><div>T=
he features Brendan discusses may appear in the Google style guide but they=
 are equally applicable to smaller code bases.=C2=A0 In fact, I&#39;ve work=
ed on embedded systems with a much smaller code base, prior to working at G=
oogle, and the style guide had most, if not all, these items.</div><div><br=
></div><div>As for fitting in the head of the contributor or maintainer, I =
don&#39;t think it&#39;s reasonable.=C2=A0 One of the points made during ou=
r meeting was that openBMC should be a project other people can come in and=
 contribute to.=C2=A0 Future contributors may or may not be devoting all th=
eir time to openBMC and may not have the bandwidth to &quot;fit&quot; one o=
f the repos in their head.</div><div><br></div><div>Btw, Google&#39;s codeb=
ase is not monolithic.</div><div><br></div><div>&gt; My typical philosophy =
regarding coding practices tends to be fairly<br>&gt; pragmatic.=C2=A0 I do=
n&#39;t tend to see practices as &quot;black&quot; and &quot;white&quot; bu=
t<br>&gt; more along a scale of how much justification you need to have to =
use a<br>&gt; practice (more on this in the specifics, maybe).=C2=A0 The as=
pects that<br>&gt; concern me more, when I am doing code reviews, are in th=
e general sense:<br>&gt;<br>&gt; =C2=A0 =C2=A0 1) Conciseness:<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - Did you use far more lines of code to solve the =
problem than<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 necessary?=C2=A0 Th=
ose are lines we have to maintain.<br>&gt; =C2=A0 =C2=A0 2) Modern, widely-=
accepted practices:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - This is already s=
pelled out in the &#39;contributing&#39; doc, having<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 priority over any specific style statements. [2]<br>&g=
t; =C2=A0 =C2=A0 3) Performance:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Favo=
ring in order { Code size, CPU utilization, memory size }<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 due to the unique concerns of the OpenBMC proje=
ct and current<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 technologies used=
.<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Macro-level optimization that does =
not violate conciseness and<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clar=
ity:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Are the algorithms=
 used of the appropriate algorithmic<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 complexity?<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 - Are you avoiding practices that would contribute to large<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 generated code sizes?<br>=
</div><div><br></div><div>We&#39;re not suggesting the style guide be black=
 and white.=C2=A0 Every rule has it&#39;s exceptions.=C2=A0 But rules provi=
de structure which is necessary when trying to collaborate.</div><div><br><=
/div><div>Thank you for this list.=C2=A0 It&#39;s general, but still helpfu=
l for those of use sending code to you for review.</div><div><br></div><div=
>&gt; Quantifying &quot;code smell&quot; into a set of non-ambiguous rules =
is a hard<br>&gt; problem and, as such, one that I have avoided up until no=
w.=C2=A0 I would<br>&gt; prefer we start with industry recognized experts o=
pinion[3] and then<br>&gt; document deviations specific to OpenBMC as they =
come up.<br></div><div><br></div><div>I haven&#39;t read all of [3] in deta=
il but,Brendan&#39;s list isn&#39;t meant to replace any industry guideline=
, just spell out guidelines for a few things that we feel are particularly =
important to writing concise, debuggable code.</div><div><br></div><div>And=
 while it&#39;s hard to write a set of guidelines, it&#39;s a worthwhile ta=
sk to complete.=C2=A0 From [3] &quot;Please remember that one purpose of a =
guideline is to help someone who is less experienced or coming from a diffe=
rent background or language to get up to speed.&quot; =C2=A0Ideally, as Ope=
nBMC is adopted, there will be more contributors, so this guideline will he=
lp them.=C2=A0 Right now, it&#39;ll help us collaborate.</div><div><br></di=
v><div>I also want to echo Brendan&#39;s caution in his reply with regard t=
o citing industry experts. =C2=A0[3] is not a list of do and don&#39;t dos =
by industry experts.=C2=A0 Their abstract clearly states=C2=A0&quot;Please =
try to verify or disprove rules! In particular, we&#39;d really like to hav=
e some of our rules backed up with measurements or better examples&quot;</d=
iv><div><br></div><div><div><br class=3D"gmail-Apple-interchange-newline">&=
gt; &gt; =C2=A0 =C2=A0 * Variables of class type with static storage durati=
on (including<br>&gt; &gt; constants),<br></div><div>&gt; CppCoreGuidelines=
 I.22 and R.6 already have this point covered<br>&gt; sufficiently to me wi=
thout further elaboration.<br></div></div><div>&gt; &gt; =C2=A0 =C2=A0 * Im=
plicit conversion constructors and operators<br></div><div>&gt; CppCoreGuid=
elines has a &quot;To-do: Unclassified proto-rules&quot; section which<br>&=
gt; says &quot;Avoid implicit conversions&quot;.<br></div><div><br></div><d=
iv>For these items, I think the CppCoreGuidelines are more or less in line =
with what Brendan has proposed.</div><div><br></div><div>&gt; &gt; On the o=
ther hand, we do not think restrictions should be placed on using<br>&gt; &=
gt; virtual<br>&gt; &gt; functions.<br>&gt;<br>&gt; I was not proposing an =
elimination or prohibition on virtual functions,<br>&gt; but a &quot;justif=
ication required&quot;.=C2=A0 As in, you need to be prepared to<br>&gt; ans=
wer how this is better and why compile-time polymorphism would be<br>&gt; i=
nsufficient.<br>&gt;<br>&gt; CppCoreGuidelines C.10 suggests effectively th=
e same thing: &quot;You need a<br>&gt; reason for using a hierarchy.&quot;<=
br></div><div><br></div><div>CppCoreGuidelines do list reasons for using a =
hierarchy in C.120-122.=C2=A0 I think these are sufficient for most of the =
cases of inheritance that we&#39;d be interested in.</div><div><br></div><b=
r>----------<br>Nancy<br><br><br></div>

--001a114b3508a0c6be0540768f74--
