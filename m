Return-Path: <jefro.net@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=jefro.net@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SwCsZ403"; 
 dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VPvd0DzTzF22r
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 17:53:48 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id w5-v6so4357771wrt.2
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1wih2bbPmw8WkfHfDhf5kyi3De3WF4tLp8iXAxOkf3g=;
 b=SwCsZ403Vx+c4SEF3Q5A7utlR4/m1pSqy6iQVGyZ3joW0G0OVnyn5XJDlc5KmGDxWH
 2yYOPr35zqc7bQrI6z5QRnTamvBSbpNAtVMwkCkTyTw2FfpvVFrzxs6wyL5q8FXM2vSW
 MlGo71DBJLs5HII57H7M90nHdFi6S4ZfjJMrp24HvZ1+fjfYGOtLrR3GZhtV6O4rHEe9
 OxQnPf7iHUogU+6Vwk9LsLEp6UTk/th9dQJUCgdOxfTWmxRsfpKG+38rXb09He6b6tlz
 NhXRBq6OO8eVT5of7LAJaEQ2iMlMRgCR27oq/eNZmRRPXvspHymPNOmgi6vKYdib+Vne
 SGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1wih2bbPmw8WkfHfDhf5kyi3De3WF4tLp8iXAxOkf3g=;
 b=DysDNhLt36o/lOwwn61qaBEp29nbgZsi4slrJUCN1fIQpo7B+l8/rak/7ER1R5LpWV
 PdAZHi2Q2NbXFurL3vIMwexUCxwFZpFlv+cjb9riqoN8YrGO2ct5rdEKh9u3moNqjftS
 EqeddUR7sq3zGiN08nYvP2Q5TAp1ZeoAJnczZitc7UsKK83xIYe1jthsz7wbIjEE2//N
 4aDU9XvZxxyM0+NjOlOBShNpn5miLmRtwayA7jSiC6rcN0Ria0KTPQ0E0BwCj4KxoU8o
 9H/nTV5YaqzuBaQy+WCjpJjWrYxxM4YlIulvTm1t9SYNBaLePrpYQnJ1C18MmDYABTOR
 xmhg==
X-Gm-Message-State: ABuFfohqw2XXm/5IXaCBFvhAs0zIwznJnKM2WWFP9lBOK89Q7+J4HaIR
 u+yDMWkPcHw2q+mmyfHIAVCOiqJx/NdxaiaqxzQ=
X-Google-Smtp-Source: ACcGV61gSkolC4S/E10nJLfks50sFuxXtlai2Kve5RID3RC/S/Hiz4yRE0gRWSEmM2prkD92LYNu6YrVrUftct2S0EE=
X-Received: by 2002:a5d:450d:: with SMTP id
 s13-v6mr22076599wrq.82.1539154425693; 
 Tue, 09 Oct 2018 23:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
In-Reply-To: <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro.net@gmail.com>
Date: Tue, 9 Oct 2018 23:53:34 -0700
Message-ID: <CA+YB3rbDhYE158AVgQU+x8DKZFCx+y0SpA2LBJaKV059UVv0VA@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cc4b9b0577da5073"
X-Mailman-Approved-At: Fri, 12 Oct 2018 16:55:59 +1100
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
X-List-Received-Date: Wed, 10 Oct 2018 06:53:50 -0000

--000000000000cc4b9b0577da5073
Content-Type: text/plain; charset="UTF-8"

You are absolutely right to ask these questions, and I'm sure each
community will want to fine-tune it, although as a community manager I
actually prefer some of the vagueness in it. It is normal to add to a CoC
to try to cover all the bases, but people will always think up ways to
violate the spirit of the rule while staying within the letter. For a
positive community (like openbmc) the CoC is a guideline for new users,
rather than legislation for behavior, as it should be.

The best offense is a good community manager who can set the tone, with an
escalation path to a TSC or governing board, whichever is appropriate for a
given community. Ideally it would never be used - it never has been needed
in almost 8 yrs of the Yocto Project, as the leaders simply set a tone of
respect.

That's a really good question of harassment outside. Technically it is
private conversation, or outside the project's boundaries. If I were
community mgr in that case, I would have a frank conversation with the
harasser and let them know that simply isn't the way escalation is done in
this project, then provide the proper way and make sure their concern is
answered while respecting both sides. That being said, being hands-on
doesn't scale up to thousands of participants.

One more tidbit - this is the same CoC adopted by the kernel community and
several other high profile communities, so there is precedent within the
wider open source community for it. One thing I like quite a lot about it
is that it is itself open source - if I find a bug with it, I can submit a
pull request to the CoC itself.

I hope this is helpful to the process and not disruptive  :)

On Tue, Oct 9, 2018 at 11:53 AM Emily Shaffer <emilyshaffer@google.com>
wrote:

> Reading through this, I've got a couple concerns:
>
> - There's a clause for enforcement. How do we want to assign ownership
> when enforcement is needed? We probably want to lay it out, I'm not sure
> that it should come through the TSC. Maybe Kurt would be a good start as
> the community manager? No offense to Kurt but I'd also like an escalation
> path or alternative path - with these kinds of things it's important to be
> able to bypass an individual if necessary.
>
> - The clause on scope seems to me like it may leave a gap surrounding
> harassment of community members outside of the official OpenBMC setting -
> ie, Foo posts to their Twitter account, "I'm having a lot of trouble with
> Bar's code reviews. What an idiot! Tell them so - their email is
> bar@baz.org!" I'm not sure I'm seeing how the contributor covenant
> protects against this kind of behavior. Maybe I'm just misreading and this
> counts as "prviate communication"?
>
> On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.com>
> wrote:
>
>> Hi folks
>>
>> We strongly recommend the contributor covenant coc. Being adopted by many
>> projects.
>>
>> https://www.contributor-covenant.org/version/1/4/code-of-conduct
>>
>> Glad to discuss more
>>
>> On Tue, Oct 9, 2018, 11:28 AM Emily Shaffer <emilyshaffer@google.com>
>> wrote:
>>
>>> Hi all,
>>>
>>> As I briefly mentioned at the end of Brad's presentation today, I'd like
>>> to propose adding and enforcing a code of conduct for us to follow.
>>>
>>> For now, I am planning to grab a copy of the Linux CoC and put it up for
>>> review in /docs. If anybody has a different CoC source to suggest, I'd be
>>> happy to discuss.
>>>
>>> Brad asked me whether I had seen an issue so far and I had not, so
>>> please don't take this email as some kind of retaliation - it's not. I
>>> think we've got a great, positive community and as we grow I'd like to
>>> preserve that culture, and the code of conduct is a great way to do so.
>>>
>>> - Emily
>>>
>>

--000000000000cc4b9b0577da5073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You are absolutely right to ask these questions, and I&#39=
;m sure each community will want to fine-tune it, although as a community m=
anager I actually prefer some of the vagueness in it. It is normal to add t=
o a CoC to try to cover all the bases, but people will always think up ways=
 to violate the spirit of the rule while staying within the letter. For a p=
ositive community (like openbmc) the CoC is a guideline for new users, rath=
er than legislation for behavior, as it should be.<div><br></div><div>The b=
est offense is a good community manager who can set the tone, with an escal=
ation path to a TSC or governing board, whichever is appropriate for a give=
n community. Ideally it would never be used - it never has been needed in a=
lmost 8 yrs of the Yocto Project, as the leaders simply set a tone of respe=
ct.=C2=A0</div><div><br></div><div>That&#39;s a really good question of har=
assment outside. Technically it is private conversation, or outside the pro=
ject&#39;s boundaries. If I were community mgr in that case, I would have a=
 frank conversation with the harasser and let them know that simply isn&#39=
;t the way escalation is done in this project, then provide the proper way =
and make sure their concern is answered while respecting both sides. That b=
eing said, being hands-on doesn&#39;t scale up to thousands of participants=
.</div><div><br></div><div>One more tidbit - this is the same CoC adopted b=
y the kernel community and several other high profile communities, so there=
 is precedent within the wider open source community for it. One thing I li=
ke quite a lot about it is that it is itself open source - if I find a bug =
with it, I can submit a pull request to the CoC itself.<br></div><div><br><=
/div><div>I hope this is helpful to the process and not disruptive=C2=A0 :)=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, =
2018 at 11:53 AM Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.co=
m">emilyshaffer@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Reading through this, I&#39;ve got a couple concern=
s:<div><br></div><div>- There&#39;s a clause for enforcement. How do we wan=
t to assign ownership when enforcement is needed? We probably want to lay i=
t out, I&#39;m not sure that it should come through the TSC. Maybe Kurt wou=
ld be a good start as the community manager? No offense to Kurt but I&#39;d=
 also like an escalation path or alternative path - with these kinds of thi=
ngs it&#39;s important to be able to bypass an individual if necessary.</di=
v><div><br></div><div>- The clause on scope seems to me like it may leave a=
 gap surrounding harassment of community members outside of the official Op=
enBMC setting - ie, Foo posts to their Twitter account, &quot;I&#39;m havin=
g a lot of trouble with Bar&#39;s code reviews. What an idiot! Tell them so=
 - their email is=C2=A0<a href=3D"mailto:bar@baz.org" target=3D"_blank">bar=
@baz.org</a>!&quot; I&#39;m not sure I&#39;m seeing how the contributor cov=
enant protects against this kind of behavior. Maybe I&#39;m just misreading=
 and this counts as &quot;prviate communication&quot;?</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, 2018 at 11:31 AM Jeff=
 Osier-Mixon &lt;<a href=3D"mailto:jefro.net@gmail.com" target=3D"_blank">j=
efro.net@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"auto">Hi folks=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto=
">We strongly recommend the contributor covenant coc. Being adopted by many=
 projects.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><span s=
tyle=3D"font-family:sans-serif"><a href=3D"https://www.contributor-covenant=
.org/version/1/4/code-of-conduct" target=3D"_blank">https://www.contributor=
-covenant.org/version/1/4/code-of-conduct</a></span><br></div><div dir=3D"a=
uto"><span style=3D"font-family:sans-serif"><br></span></div><div dir=3D"au=
to"><span style=3D"font-family:sans-serif">Glad to discuss more</span></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, 2018,=
 11:28 AM Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" targ=
et=3D"_blank">emilyshaffer@google.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr">Hi all,<div><br></div><div>As I briefly =
mentioned at the end of Brad&#39;s presentation today, I&#39;d like to prop=
ose adding and enforcing a code of conduct for us to follow.</div><div><br>=
</div><div>For now, I am planning to grab a copy of the Linux CoC and put i=
t up for review in /docs. If anybody has a different CoC source to suggest,=
 I&#39;d be happy to discuss.</div><div><br></div><div>Brad asked me whethe=
r I had seen an issue so far and I had not, so please don&#39;t take this e=
mail as some kind of retaliation - it&#39;s not. I think we&#39;ve got a gr=
eat, positive community and as we grow I&#39;d like to preserve that cultur=
e, and the code of conduct is a great way to do so.</div><div><br></div><di=
v>- Emily</div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000cc4b9b0577da5073--
