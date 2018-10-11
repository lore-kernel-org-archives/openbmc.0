Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WVBY/c+Q"; 
 dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WP6v1RwFzF0QC
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 08:21:57 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id a85-v6so6452849qkg.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmxL3E/HN8R7EzBzfEgaPdKE3f9NBOHwuEyW4yf9Keo=;
 b=WVBY/c+QF0aaacawy3C5WxhBzeCbhauzHCREnGCjOlj7vBJA2eKz28uz8izkEc97Ts
 zkRv/iHga/H0Pvvx5w3gGvrnLdnTvPaJgVpTWtIiru9FAd5esWPesI8H/H+Tqub329vB
 mReCQcqkb5RcznY5fWa6ct1xlA29K3yek3Nae/jpNmomj4jyaVhh+TxtMf2NYPGdq/bs
 KyTOjyb6DmXv6S1WDtciKRLCokL04Qp3cFjLdiSFERzkCiOgEswQrsSgiY/Kw7Up7h/c
 3qSZwjq7Z2r3YbUPJeHlK7PfFn0GwNQ7MRwYE8KyuYTYGAxOJ5tqJcQzBVyWqmCVlejW
 hbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmxL3E/HN8R7EzBzfEgaPdKE3f9NBOHwuEyW4yf9Keo=;
 b=rQOMqLSpk04m4nfEKiNXZIY57J6/aTtR+kobwxOnx1/3TaVvIVwFITI61DDYGJtrwY
 /Pf1j/J50QqIasPBu4gMTk/le9qCrNbFVkapPnCJFnCOtsCwfjiqXDZ9MoN2byYkYIZp
 xrDV4GPgo9BCo9lrFk+X82CdXefZ8Sf1a1XUCJnb+m0f0JKlyCdxaTacAU35lDy7y5jT
 B1bHjqYIoe/UmhinGFgM6SyPObP2JUusaGd0Vgv8KV9drI53yV1B9nD2KOSRndlzXBem
 rpWvV0Uv6eoK3FQ2WqGWCM2GRS4EO4EubBEUcBkpzBM7MQwNcJ+9oSNBvFWViJ+gMfuS
 WDyQ==
X-Gm-Message-State: ABuFfogUPGwIgSyWhtwmjaycK8T1P4gOWwS9uXGqhBunXFAqob9O8434
 sCgsVqpnL8FY6sYBu1rrKE+ACgGy8RmwnVkjlORe+w==
X-Google-Smtp-Source: ACcGV61N0rJliRcT175wB/KQmCunD5YwnCubZxPjUPwoFL9OwrnS64CvCQeTnwnm5dg/NcjeatM/g6N0xrH0njWQRXs=
X-Received: by 2002:a37:1f88:: with SMTP id n8-v6mr3223017qkh.64.1539292914826; 
 Thu, 11 Oct 2018 14:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
 <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
In-Reply-To: <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 11 Oct 2018 14:21:41 -0700
Message-ID: <CAJoAoZnPrkRoioHxwGnWfdB-J5ArHAFtnkdD_CTwW6V3fYCuUQ@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000065358e0577fa8fde"
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
X-List-Received-Date: Thu, 11 Oct 2018 21:22:00 -0000

--00000000000065358e0577fa8fde
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 10, 2018, 7:52 PM Patrick Venture <venture@google.com> wrote:

> On Wed, Oct 10, 2018 at 7:58 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
> >
> > On 10/9/18 1:53 PM, Emily Shaffer wrote:
> > > Reading through this, I've got a couple concerns:
> > >
> > > - There's a clause for enforcement. How do we want to assign ownership
> > > when enforcement is needed? We probably want to lay it out, I'm not
> sure
> > > that it should come through the TSC. Maybe Kurt would be a good start
> as
> > > the community manager? No offense to Kurt but I'd also like an
> > > escalation path or alternative path - with these kinds of things it's
> > > important to be able to bypass an individual if necessary.
> >
> > Re: Community Manager, I am already partially doing that in an
> > unofficial sense, but for an escalation path, I would highly recommend
> > first reaching out to the TSC. Any inappropriate activity or harassment
> > must be taken care of immediately and the community leadership would be
> > tasked to take care of that.
> >
> > >
> > > - The clause on scope seems to me like it may leave a gap surrounding
> > > harassment of community members outside of the official OpenBMC setting
> > > - ie, Foo posts to their Twitter account, "I'm having a lot of trouble
> > > with Bar's code reviews. What an idiot! Tell them so - their email is
> > > bar@baz.org <mailto:bar@baz.org>!" I'm not sure I'm seeing how the
> > > contributor covenant protects against this kind of behavior. Maybe I'm
> > > just misreading and this counts as "prviate communication"?
> >
> > This would absolutely require that the person be put on notice. Maybe it
> > will help, but I have also never seen this behavior work for anyone
> > trying to harass anyone. It has always backfired on the person doing the
> > harassing in every case I can think of (I have been involved in a
> couple).
> >
> > >
> > > On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.com
> > > <mailto:jefro.net@gmail.com>> wrote:
> > >
> > >     Hi folks
> > >
> > >     We strongly recommend the contributor covenant coc. Being adopted
> by
> > >     many projects.
> > >
> > >     https://www.contributor-covenant.org/version/1/4/code-of-conduct
> > >
> > >     Glad to discuss more
> >
> > As I said in my previous email, we already have a CoC under the LF
> > policies, but I am not opposed to adopting a new one. That said, do we
> > need to improve the existing one? Is there something missing? Has anyone
> > compared the two? Did I just sign up to do that?  :)
> >
> > Kurt Taylor (krtaylor)
>
> I just read over the LF CoC and I think it's pretty solid.
>

I'd say my only serious concern about the LF one is that it directs
concerns to someone outside of the project, first. It seems like we can
expedite responses if we encourage folks to report via the TSC or community
manager first, and escalate to the LF community manager if necessary.

As a side point, we should make it more clear that we adhere to the LF CoC.
I would be comfortable mentioning it explicitly in some doc in docs/ or the
openbmc/openbmc readme, or something. Looking for LF membership and then
from there to the CoC isn't very clear to me.

>

--00000000000065358e0577fa8fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 10, 2018, 7=
:52 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Oct=
 10, 2018 at 7:58 AM krtaylor &lt;<a href=3D"mailto:kurt.r.taylor@gmail.com=
" target=3D"_blank">kurt.r.taylor@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/9/18 1:53 PM, Emily Shaffer wrote:<br>
&gt; &gt; Reading through this, I&#39;ve got a couple concerns:<br>
&gt; &gt;<br>
&gt; &gt; - There&#39;s a clause for enforcement. How do we want to assign =
ownership<br>
&gt; &gt; when enforcement is needed? We probably want to lay it out, I&#39=
;m not sure<br>
&gt; &gt; that it should come through the TSC. Maybe Kurt would be a good s=
tart as<br>
&gt; &gt; the community manager? No offense to Kurt but I&#39;d also like a=
n<br>
&gt; &gt; escalation path or alternative path - with these kinds of things =
it&#39;s<br>
&gt; &gt; important to be able to bypass an individual if necessary.<br>
&gt;<br>
&gt; Re: Community Manager, I am already partially doing that in an<br>
&gt; unofficial sense, but for an escalation path, I would highly recommend=
<br>
&gt; first reaching out to the TSC. Any inappropriate activity or harassmen=
t<br>
&gt; must be taken care of immediately and the community leadership would b=
e<br>
&gt; tasked to take care of that.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; - The clause on scope seems to me like it may leave a gap surroun=
ding<br>
&gt; &gt; harassment of community members outside of the official OpenBMC s=
etting<br>
&gt; &gt; - ie, Foo posts to their Twitter account, &quot;I&#39;m having a =
lot of trouble<br>
&gt; &gt; with Bar&#39;s code reviews. What an idiot! Tell them so - their =
email is<br>
&gt; &gt; <a href=3D"mailto:bar@baz.org" target=3D"_blank">bar@baz.org</a> =
&lt;mailto:<a href=3D"mailto:bar@baz.org" target=3D"_blank">bar@baz.org</a>=
&gt;!&quot; I&#39;m not sure I&#39;m seeing how the<br>
&gt; &gt; contributor covenant protects against this kind of behavior. Mayb=
e I&#39;m<br>
&gt; &gt; just misreading and this counts as &quot;prviate communication&qu=
ot;?<br>
&gt;<br>
&gt; This would absolutely require that the person be put on notice. Maybe =
it<br>
&gt; will help, but I have also never seen this behavior work for anyone<br=
>
&gt; trying to harass anyone. It has always backfired on the person doing t=
he<br>
&gt; harassing in every case I can think of (I have been involved in a coup=
le).<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon &lt;<a href=3D"m=
ailto:jefro.net@gmail.com" target=3D"_blank">jefro.net@gmail.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:jefro.net@gmail.com" target=3D"_blan=
k">jefro.net@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi folks<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0We strongly recommend the contributor covenant=
 coc. Being adopted by<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0many projects.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.contributor-covenant.or=
g/version/1/4/code-of-conduct" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.contributor-covenant.org/version/1/4/code-of-conduct</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Glad to discuss more<br>
&gt;<br>
&gt; As I said in my previous email, we already have a CoC under the LF<br>
&gt; policies, but I am not opposed to adopting a new one. That said, do we=
<br>
&gt; need to improve the existing one? Is there something missing? Has anyo=
ne<br>
&gt; compared the two? Did I just sign up to do that?=C2=A0 :)<br>
&gt;<br>
&gt; Kurt Taylor (krtaylor)<br>
<br>
I just read over the LF CoC and I think it&#39;s pretty solid.<br></blockqu=
ote></div><div><br></div><div>I&#39;d say my only serious concern about the=
 LF one is that it directs concerns to someone outside of the project, firs=
t. It seems like we can expedite responses if we encourage folks to report =
via the TSC or community manager first, and escalate to the LF community ma=
nager if necessary.</div><div><br></div><div>As a side point, we should mak=
e it more clear that we adhere to the LF CoC. I would be comfortable mentio=
ning it explicitly in some doc in docs/ or the openbmc/openbmc readme, or s=
omething. Looking for LF membership and then from there to the CoC isn&#39;=
t very clear to me.</div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
</blockquote></div>

--00000000000065358e0577fa8fde--
