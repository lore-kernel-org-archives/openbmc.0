Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QkJeV1rf"; 
 dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yn0m2xjGzF3K6
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 05:24:55 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id c56-v6so22597482qtd.11
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JCaDZhZxXEqXOZL5cNPlkAmeHynJ50HNWNmKyUsyYUI=;
 b=QkJeV1rfGNwOHa2ActZFN/iWv60s9ecEx+SBsc2MvY5zFe7/iYK9lwIhYvQLrr1Eqx
 9aBnucW+ZUwPMSjWGzpR5wcEptp3oTVbMRQIfHaFOdrkAx8ybTGGNzvLR1RxG+YOVj9Y
 E18qZH7rIim2FqsV835NeEJRtepLDldpIIJJ98NnK374gW6BP90YncilIX2f0vZaVvQ+
 d9ROMBurHmak53yVZHrydcW6412+EE5zKIY1rU+nOOuyhha24tdk7I9Jogpp1A46kp9k
 tVAG+aDbzJMUTGaYM6HB1u132d1I0LlhiAi/WRTpHdQnf37HU+bu9AVufU4cuS1xvchZ
 0bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCaDZhZxXEqXOZL5cNPlkAmeHynJ50HNWNmKyUsyYUI=;
 b=XRUeYBfPHoKxxWcFCpaUDCnp4KuHgQlYbkGGQpVREHqLyFECR2ma1NSZNC0iWuMJ1V
 YyydcnFZ5gpgZxoqfH9aKR5mySCozap5IObv0tPcnMLl5HFGEr5MVeGaFeVNSdwnNV73
 POUBjzZt0eT6k0+4rgW8Qy9uV3iQeooSdDIkK6OgxZ1e4LV22rTTkmLRifpi8ooEnEqI
 JOHPHR01zJM6P+fMJh4IcOekTS7TnGXFniSSUJrlI89IQl2MoiX5jBVRbuC1ZnUTryy0
 K1t8tVkwnNDoSh52e4k/z9gNdYG0kDXjg4eShhflbxAX4/HV4lkPb31gBAqBXUSb69Gs
 vz8w==
X-Gm-Message-State: ABuFfohgSKtnlwzgHzlmwXnV2hSspFuLSd5cyhSEb4ISPFx0fQ78W0q8
 UVJ35hrIzfs/cMpBKduGYVprlj6uWMsimMj/LBbP4Q==
X-Google-Smtp-Source: ACcGV615ySio7owTaHnSbHmvzx88iP1BbwpoFJGb+bk3d3D0dT2Hv1BVKBOwCRar+1bFcDe9oe5uCZ8lPrgFesOQVAM=
X-Received: by 2002:a0c:b04d:: with SMTP id l13mr8953495qvc.139.1539627893407; 
 Mon, 15 Oct 2018 11:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
 <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
 <CAJoAoZnPrkRoioHxwGnWfdB-J5ArHAFtnkdD_CTwW6V3fYCuUQ@mail.gmail.com>
 <CAO=notw73kUmhkqYYYNLDWO2ZnpOEpt+ZeWaJZKwYxLqqQgUwg@mail.gmail.com>
 <CAJoAoZksHO9M8LT9qbXM3LgDJAzP1fOaCeRq_RjnUKmPFcwTwA@mail.gmail.com>
In-Reply-To: <CAJoAoZksHO9M8LT9qbXM3LgDJAzP1fOaCeRq_RjnUKmPFcwTwA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 15 Oct 2018 11:24:41 -0700
Message-ID: <CAJoAoZmMJEQALNpLOXMs8PPGTCupZYRFrsnj=vtVNygRqwTaAQ@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000accdc20578488d3a"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2018 18:24:57 -0000

--000000000000accdc20578488d3a
Content-Type: text/plain; charset="UTF-8"

Hi all,

I wanted to send a quick summary of the discussion ongoing in the review
for the Contributor Covenant in Gerrit.

It looks like we're down to two options: a slightly-modified LF Code of
Conduct, or a slightly-modified Contributor Covenant.

**Linux Foundation Code of Conduct**
+ Concise and vague language leaves room for us to address new problems we
aren't anticipating today.
+ We're already using it, so there's very little change to the community as
stands.
- As written today, it points to a community representative in the LF
organization as the first and only point of contact for escalations.
- The vague language may leave question of what constitutes abuse, leaving
room for gaslighting or otherwise leaving a victim unsure of whether they
can seek recourse.
- It's currently very unclear that the project is expected to adhere to
this CoC.

**Contributor Covenant**
+ Explicit language makes expectations clear and mitigates possibility of
bad actors on the escalation path
+ It's the CoC in use by many high-profile projects, including the Linux
kernel (github.com/torvalds/linux)
+ There is room for us to establish a line of escalation
- Explicit language may leave gaps for poor behavior we haven't anticipated

Please go ahead and reply with your +/- on the two documents if I've missed
something important to you.

Regardless, we have some additional actions to pursue:
* Indicate in documentation clearly that we have a Code of Conduct and how
to find it. (Mostly, if we keep the LF CoC.)
* Determine the escalation path. I see the following needs (please reply
with more or arguments):
** Reporters should have an expectation of confidentiality
** Reporters should be able to circumvent an individual on the path if
necessary for their safety (i.e. if someone on the escalation path is a bad
actor)
** Individuals on the escalation path should not be made to feel unsafe by
their participation. To elaborate, this is a hot topic in the FLOSS
community right now, and I'm worried about the possibility of trolls
harassing our escalation path members. (Maybe it's unreasonable?)
** Individuals on the escalation path should know and consent to being on
the escalation path. (I'm working on drafting a mail to the TSC to ask for
their support now, but that might not be the right way to move forward.)

-Emily

>

--000000000000accdc20578488d3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I wanted to send a quick summar=
y of the discussion ongoing in the review for the Contributor Covenant in G=
errit.</div><div><br></div><div>It looks like we&#39;re down to two options=
: a slightly-modified LF Code of Conduct, or a slightly-modified Contributo=
r Covenant.</div><div><br></div><div>**Linux Foundation Code of Conduct**<b=
r>+ Concise and vague language leaves room for us to address new problems w=
e aren&#39;t anticipating today.<br></div><div>+ We&#39;re already using it=
, so there&#39;s very little change to the community as stands.<br></div><d=
iv>- As written today, it points to a community representative in the LF or=
ganization as the first and only point of contact for escalations.</div><di=
v>- The vague language may leave question of what constitutes abuse, leavin=
g room for gaslighting or otherwise leaving a victim unsure of whether they=
 can seek recourse.</div><div>- It&#39;s currently very unclear that the pr=
oject is expected to adhere to this CoC.</div><div><br></div><div>**Contrib=
utor Covenant**</div><div>+ Explicit language makes expectations clear and =
mitigates possibility of bad actors on the escalation path<br></div><div>+ =
It&#39;s the CoC in use by many high-profile projects, including the Linux =
kernel (<a href=3D"http://github.com/torvalds/linux">github.com/torvalds/li=
nux</a>)<br></div><div>+ There is room for us to establish a line of escala=
tion<br></div><div>- Explicit language may leave gaps for poor behavior we =
haven&#39;t anticipated=C2=A0<br></div><div><br></div><div>Please go ahead =
and reply with your=C2=A0+/- on the two documents if I&#39;ve missed someth=
ing important to you.</div><div><br></div><div>Regardless, we have some add=
itional actions to pursue:<br>* Indicate in documentation clearly that we h=
ave a Code of Conduct and how to find it. (Mostly, if we keep the LF CoC.)<=
/div><div>* Determine the escalation path. I see the following needs (pleas=
e reply with more or arguments):<br>** Reporters should have an expectation=
 of confidentiality</div><div>** Reporters should be able to circumvent an =
individual on the path if necessary for their safety (i.e. if someone on th=
e escalation path is a bad actor)<br>** Individuals on the escalation path =
should not be made to feel unsafe by their participation. To elaborate, thi=
s is a hot topic in the FLOSS community right now, and I&#39;m worried abou=
t the possibility of trolls harassing our escalation path members. (Maybe i=
t&#39;s unreasonable?)<br>** Individuals on the escalation path should know=
 and consent to being on the escalation path. (I&#39;m working on drafting =
a mail to the TSC to ask for their support now, but that might not be the r=
ight way to move forward.)</div><div><br></div><div>-Emily<br></div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
</blockquote></div>
</blockquote></div></div>

--000000000000accdc20578488d3a--
