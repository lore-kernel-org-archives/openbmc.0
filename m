Return-Path: <yuenn@google.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDYqc1hhQzDvZq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 05:00:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xe/QLZxf"; 
 dkim-atps=neutral
Received: by mail-wm0-x229.google.com with SMTP id t79so316031888wmt.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AIYC2Lr3Q4cE2PFJymlwQdo89DpdO2xkSfO5Pji2ATM=;
 b=Xe/QLZxf/Q+oJyZKJ19xlNWNrPOz8RoPHiyHoXWwQFRW98nmMiWI88oIm/RqaMTcDy
 MI1JCJ3kh//mhcAxVUXd6UHLRnk1u8V2RdBSW4Prcuxq1GN8UQ3MmX8IoGTf9+nZ+005
 lzDQCwwiMioALLHCovTYcWZh2SZkoL1EO3Tnh+ZrPEjxNd9W5q5HlC4cm0v6O85Gi6MR
 RQHcys13zA8hsn8OmVAnlPU7hZTFicLJfWcdL8lb53fJVRg5/xEJL7s3s1jz0jflPYs6
 /d+aLWbBwrjL0QzIXpgl9TYNVBFFv7b7ikK5twYJZ8Fw7d9V2D3q/+u7C8b8GACS4MkT
 yflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AIYC2Lr3Q4cE2PFJymlwQdo89DpdO2xkSfO5Pji2ATM=;
 b=iYZs3Av5EyBOKG8AdxwJzj0dSnzmqyrt55DgKR7ookEwWtTxlws3kffGDPyuAPuIde
 A3CE6jwD2bCPPyp6f0DCOayA0LHRLvH7a5NolPGddCtRNdGZ+k/4JIREo6M/YTJP1QlO
 HqNR9oJptzd5mVzDTqMGw4TYCbhfFbsRh2oD7f9meGH2Qj0DKeuvFDUUglPcVtNeHGtx
 AaYjAlGLLIauDWoLl0KP7GYkJH7IlP4OSwrnnU6cQvHEB8LC0Q2jWQiKaXZGTLijz45t
 2CEb+NmaNM8h9TUAcdZh02xJ60WOZ9G8z4pJ0SEwIgP1eqeTf4lI9lCLOkFqA5Cc/Pid
 L2QA==
X-Gm-Message-State: ABUngvcRUxFjV/ovr4ouLHDZiyYZV4vi2qfaxrrWHADQvxriQ1w/FWtk+yf+ZWmVXhsKV88opiu102k4sTNSciBv
X-Received: by 10.194.165.136 with SMTP id yy8mr919579wjb.14.1478714408135;
 Wed, 09 Nov 2016 10:00:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Wed, 9 Nov 2016 09:59:27 -0800 (PST)
In-Reply-To: <20161107195706.xojpyngn7cmjntqb@asimov>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
 <20161103120358.GC17105@heinlein.lan>
 <CADfYTpH5BeijShWafcctTukSUE7DdquNtatdqgVcanNmh+vayQ@mail.gmail.com>
 <20161107195706.xojpyngn7cmjntqb@asimov>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 9 Nov 2016 09:59:27 -0800
Message-ID: <CADfYTpFyGY9mUPXm6Nh3++OPChcBxSM2C2rK_vGdsW-NvonXTg@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=089e01228e4805e71a0540e207c3
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
X-List-Received-Date: Wed, 09 Nov 2016 18:00:14 -0000

--089e01228e4805e71a0540e207c3
Content-Type: text/plain; charset=UTF-8

----------
Nancy

On Mon, Nov 7, 2016 at 11:57 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Nov 07, 2016 at 02:25:30AM -0800, Nancy Yuen wrote:
> > > Back to Big Picture
> > > ----------------------------
> > >
> > > I do feel we are seriously missing a broader philosophical question.
In
> > > what ways do you feel the CppCoreGuidelines do not address all of your
> > > coding guidelines suggestions?  Rather than write an entirely new
> > > document why would we not simply point to that and then extend it if
we
> > > feel it is insufficient in a few key areas.  As you saw in my previous
> > > email, nearly everything we agree on comes from the CCG already and
> > > nearly everything we disagree on is a contradiction from the CCG.
> >
> > Our intention isn't to come up with a new document.  In our summit
> > meetings, you agreed we could propose a coding guide as you didn't
> > have anything spelled out and you didn't want to tackle it.  So we put
> > together an initial proposal and we're discussing it.  If your decision
is
> > to say that CCG is the final say for all coding practices in openBMC
> > then we'll have to figure out what that means for us.
> >
> > > I do not want to hear that the CCG is "too long".  If you take out the
> > > references it is in the same order of magnitude as the GSG.  It is
also
> > > organized in a way where each section is a straight-forward statement
to
> > > be followed, so anyone unfamiliar or uninterested can simply read the
> > > TOC to understand all of the rules (ex. "I.2 Avoid global variables.",
> > > E.6 Use RAII to prevent leaks").
> >
> > "You do not want to hear"...I don't understand why you state is in such
> > a manner or assume we'd make this point.
> >
> > > --
> > > Patrick Williams
> >
> > ----------
> > Nancy
>
> Nancy,
>
> From my perspective, I've pointed to the CCG as the primary document
> from the very beginning.  At the summit I recall hearing two arguments
> against it (and it could very well be my misremembering):
>
>     1.  It is insufficient.
>     2.  It is too long.  (I remember specifically 'reams of paper' being
>         thrown about).
>
> It is really hard for me to refute your team's perspective of it being
> insufficient without examples.  You did point out the 'iostreams'
> direction in our discussions and I also freely admit both CCG and our
> current 'guidelines' are lacking in what is classically called 'style'
> (indentation, naming conventions, etc.).
>
> I was also unable to on the spot refute the "it is too long".  It is
> easy to assume that the Google Style Guide is shorter, but after this
> discussion began I checked the two to compare and came to the conclusion
> they are in the same ballpark.
>
> I assumed, perhaps incorrectly, that your team in taking up the "style
> guide" would focus on #1 (where you feel it is insufficient).  It is
> very frustrating to see the proposal simply be a rephrasing of the most
> contentious points of the GSG, because it contradicts the CCG in these
> areas.
>
> I would like to call a "reset" to this discussion.  It is much easier to
> critique a formal proposal than a supposed proposal.  I have therefore
> spent this morning writing my initial take at a style guide.  I have
> attempted to incorporate all of the areas your team (and a few non-vocal
> members of our team) have expressed where the current guidelines are
> incomplete, without violating or changing any of the current guidelines.
> I do still treat the CCG as the "gold standard" here and have very few
> exceptions to it recorded.  I have kept this proposal exclusively to
> items that are not covered by the CCG.
>
> Please have your team review this proposal for any areas that you feel
> it is lacking in specificity.
>
>     https://gerrit.openbmc-project.xyz/1024
>
> These guidelines are also not "set in stone" and I am willing to deviate
> from the CCG if we have good rationale and can come to a consensus as a
> project.  I would like to see us first "approve roughly what is the
> current mode of operations" and then subsequently "propose any
> deviations".  I think each deviation should be approved on its own
> merits and not as a hindrance on the document as a whole.
>
> Is this acceptable?
>

Thank you for putting this together.  Having this openBMC programming
guideline will be really helpful for my team, especially for new members.
I will follow up with my team later today to see if it meets their needs.

With respect to this proposal, and any other issues in general that arise,
as long as it meets our needs and doesn't prevent us from making forward
progress with our servers, we will try to work with it.


> --
> Patrick Williams

--089e01228e4805e71a0540e207c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>----------<br>Nancy<br><br>On Mon, Nov 7, 2016 at =
11:57 AM, Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick=
@stwcx.xyz</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, Nov 07, 2016 at 02:25:30A=
M -0800, Nancy Yuen wrote:<br>&gt; &gt; &gt; Back to Big Picture<br>&gt; &g=
t; &gt; ----------------------------<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; I =
do feel we are seriously missing a broader philosophical question.=C2=A0 In=
<br>&gt; &gt; &gt; what ways do you feel the CppCoreGuidelines do not addre=
ss all of your<br>&gt; &gt; &gt; coding guidelines suggestions?=C2=A0 Rathe=
r than write an entirely new<br>&gt; &gt; &gt; document why would we not si=
mply point to that and then extend it if we<br>&gt; &gt; &gt; feel it is in=
sufficient in a few key areas.=C2=A0 As you saw in my previous<br>&gt; &gt;=
 &gt; email, nearly everything we agree on comes from the CCG already and<b=
r>&gt; &gt; &gt; nearly everything we disagree on is a contradiction from t=
he CCG.<br>&gt; &gt;<br>&gt; &gt; Our intention isn&#39;t to come up with a=
 new document.=C2=A0 In our summit<br>&gt; &gt; meetings, you agreed we cou=
ld propose a coding guide as you didn&#39;t<br>&gt; &gt; have anything spel=
led out and you didn&#39;t want to tackle it.=C2=A0 So we put<br>&gt; &gt; =
together an initial proposal and we&#39;re discussing it.=C2=A0 If your dec=
ision is<br>&gt; &gt; to say that CCG is the final say for all coding pract=
ices in openBMC<br>&gt; &gt; then we&#39;ll have to figure out what that me=
ans for us.<br>&gt; &gt;<br>&gt; &gt; &gt; I do not want to hear that the C=
CG is &quot;too long&quot;.=C2=A0 If you take out the<br>&gt; &gt; &gt; ref=
erences it is in the same order of magnitude as the GSG.=C2=A0 It is also<b=
r>&gt; &gt; &gt; organized in a way where each section is a straight-forwar=
d statement to<br>&gt; &gt; &gt; be followed, so anyone unfamiliar or unint=
erested can simply read the<br>&gt; &gt; &gt; TOC to understand all of the =
rules (ex. &quot;I.2 Avoid global variables.&quot;,<br>&gt; &gt; &gt; E.6 U=
se RAII to prevent leaks&quot;).<br>&gt; &gt;<br>&gt; &gt; &quot;You do not=
 want to hear&quot;...I don&#39;t understand why you state is in such<br>&g=
t; &gt; a manner or assume we&#39;d make this point.<br>&gt; &gt;<br>&gt; &=
gt; &gt; --<br>&gt; &gt; &gt; Patrick Williams<br>&gt; &gt;<br>&gt; &gt; --=
--------<br>&gt; &gt; Nancy<br>&gt;<br>&gt; Nancy,<br>&gt;<br>&gt; From my =
perspective, I&#39;ve pointed to the CCG as the primary document<br>&gt; fr=
om the very beginning.=C2=A0 At the summit I recall hearing two arguments<b=
r>&gt; against it (and it could very well be my misremembering):<br>&gt;<br=
>&gt; =C2=A0 =C2=A0 1.=C2=A0 It is insufficient.<br>&gt; =C2=A0 =C2=A0 2.=
=C2=A0 It is too long. =C2=A0(I remember specifically &#39;reams of paper&#=
39; being<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 thrown about).<br>&gt;<br>&gt=
; It is really hard for me to refute your team&#39;s perspective of it bein=
g<br>&gt; insufficient without examples.=C2=A0 You did point out the &#39;i=
ostreams&#39;<br>&gt; direction in our discussions and I also freely admit =
both CCG and our<br>&gt; current &#39;guidelines&#39; are lacking in what i=
s classically called &#39;style&#39;<br>&gt; (indentation, naming conventio=
ns, etc.).<br>&gt;<br>&gt; I was also unable to on the spot refute the &quo=
t;it is too long&quot;.=C2=A0 It is<br>&gt; easy to assume that the Google =
Style Guide is shorter, but after this<br>&gt; discussion began I checked t=
he two to compare and came to the conclusion<br>&gt; they are in the same b=
allpark.<br>&gt;<br>&gt; I assumed, perhaps incorrectly, that your team in =
taking up the &quot;style<br>&gt; guide&quot; would focus on #1 (where you =
feel it is insufficient).=C2=A0 It is<br>&gt; very frustrating to see the p=
roposal simply be a rephrasing of the most<br>&gt; contentious points of th=
e GSG, because it contradicts the CCG in these<br>&gt; areas.<br>&gt;<br>&g=
t; I would like to call a &quot;reset&quot; to this discussion.=C2=A0 It is=
 much easier to<br>&gt; critique a formal proposal than a supposed proposal=
.=C2=A0 I have therefore<br>&gt; spent this morning writing my initial take=
 at a style guide.=C2=A0 I have<br>&gt; attempted to incorporate all of the=
 areas your team (and a few non-vocal<br>&gt; members of our team) have exp=
ressed where the current guidelines are<br>&gt; incomplete, without violati=
ng or changing any of the current guidelines.<br>&gt; I do still treat the =
CCG as the &quot;gold standard&quot; here and have very few<br>&gt; excepti=
ons to it recorded.=C2=A0 I have kept this proposal exclusively to<br>&gt; =
items that are not covered by the CCG.<br>&gt;<br>&gt; Please have your tea=
m review this proposal for any areas that you feel<br>&gt; it is lacking in=
 specificity.<br>&gt;<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://gerrit.openb=
mc-project.xyz/1024">https://gerrit.openbmc-project.xyz/1024</a><br>&gt;<br=
>&gt; These guidelines are also not &quot;set in stone&quot; and I am willi=
ng to deviate<br>&gt; from the CCG if we have good rationale and can come t=
o a consensus as a<br>&gt; project.=C2=A0 I would like to see us first &quo=
t;approve roughly what is the<br>&gt; current mode of operations&quot; and =
then subsequently &quot;propose any<br>&gt; deviations&quot;.=C2=A0 I think=
 each deviation should be approved on its own<br>&gt; merits and not as a h=
indrance on the document as a whole.<br>&gt;<br>&gt; Is this acceptable?<br=
>&gt;<div><br></div><div><div>Thank you for putting this together.=C2=A0 Ha=
ving this openBMC programming guideline will be really helpful for my team,=
 especially for new members.=C2=A0 I will follow up with my team later toda=
y to see if it meets their needs.</div><div><br></div><div>With respect to =
this proposal, and any other issues in general that arise, as long as it me=
ets our needs and doesn&#39;t prevent us from making forward progress with =
our servers, we will try to work with it.</div><div><br></div></div><div><b=
r>&gt; --<br>&gt; Patrick Williams</div></div>

--089e01228e4805e71a0540e207c3--
