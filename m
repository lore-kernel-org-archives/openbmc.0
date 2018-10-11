Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mUmHf+qw"; 
 dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WPGh5chvzDqC7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 08:28:44 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id l41-v6so11671826qtl.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 14:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rJQOuWXXiFB7icv2kTx6ui39pzGd81o7IM+hRLI8Blo=;
 b=mUmHf+qwxdOqTKNT6mGoZenOJRBRm/+L5DYcJtblSKhjcJKP18+hPQQ0HvLpSivNnr
 usBDq6mAI4v1pUmPM9TwpP/FvFJ3JMOWxURhIFzpoHacbsW/8xl/xDwM1mQhOu/S6Iva
 d+2burJAk0KSJb3+WabBL+WBynBefeLe2y6UU4KIDsMamaNlnz4s9oUoj/YqCGr3+0U9
 guNvJypS738sc2mLaCKg1RZL3JqkiO7LwKyY26YPwJEqNfLxDn9ydVhat3MTefzPubGk
 AtZ5XfLtDGn4Pz4yDjeL56rY+SFTNY2oqAJMu/EcKHPESdLtv0VgKbAd0qJohMp8Did7
 46xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJQOuWXXiFB7icv2kTx6ui39pzGd81o7IM+hRLI8Blo=;
 b=GVFZiF7e1b1VLtKylhN1fafh4apjszh8/EsbKfPrG1WzwLdQPaTbyrDrO+TtjjFc3L
 VqeApg1lFZHLIw3Cuhjq9ODwLBStxR22pPoAnxHP31C6RtC2Mo0Sx9HlRfjVNtrXeHOs
 WjTYvIJjbaI1xJTgmc7JsBURk68eHgNMz2rU2IOl6pZ52psDYygLCuzGprLlq55cJMJ4
 MDFHPP2Euf6oLqnC3qp173lQpEtgloVfyzTIaqbA0hnek/cSvGEJiDPVOYSaLdVkaILv
 P6pHXTgaUkerNXCX97mtlahTE+cuWWMfq2uX5ndAYQq49s1+i+qlfIfEBa+mHqlSzB12
 L+kQ==
X-Gm-Message-State: ABuFfoiDol6a1Y/6DBlLIFyAN94sn98a+zmIu8LX7mRFVrFtUmll4fm4
 6BVvRWQMBKLqSgcr0pS1ZrF7lGEQunYqUOxm07qtpg==
X-Google-Smtp-Source: ACcGV62bFm6VmAuave2bHZMFjsMsg93tJPz0gAmDk1dKqBjtoUCx33gCwyOLUIcGZDK1TPWmUxqDzQ53TEHPqGIAH64=
X-Received: by 2002:ac8:794a:: with SMTP id
 r10-v6mr3368715qtt.386.1539293321986; 
 Thu, 11 Oct 2018 14:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
 <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
 <CAJoAoZnPrkRoioHxwGnWfdB-J5ArHAFtnkdD_CTwW6V3fYCuUQ@mail.gmail.com>
 <CAO=notw73kUmhkqYYYNLDWO2ZnpOEpt+ZeWaJZKwYxLqqQgUwg@mail.gmail.com>
In-Reply-To: <CAO=notw73kUmhkqYYYNLDWO2ZnpOEpt+ZeWaJZKwYxLqqQgUwg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 11 Oct 2018 14:28:30 -0700
Message-ID: <CAJoAoZksHO9M8LT9qbXM3LgDJAzP1fOaCeRq_RjnUKmPFcwTwA@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000aa1b6e0577faa720"
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
X-List-Received-Date: Thu, 11 Oct 2018 21:28:45 -0000

--000000000000aa1b6e0577faa720
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 11, 2018, 2:26 PM Patrick Venture <venture@google.com> wrote:

> On Thu, Oct 11, 2018 at 2:21 PM Emily Shaffer <emilyshaffer@google.com>
> wrote:
> >
> >
> >
> > On Wed, Oct 10, 2018, 7:52 PM Patrick Venture <venture@google.com>
> wrote:
> >>
> >> On Wed, Oct 10, 2018 at 7:58 AM krtaylor <kurt.r.taylor@gmail.com>
> wrote:
> >> >
> >> > On 10/9/18 1:53 PM, Emily Shaffer wrote:
> >> > > Reading through this, I've got a couple concerns:
> >> > >
> >> > > - There's a clause for enforcement. How do we want to assign
> ownership
> >> > > when enforcement is needed? We probably want to lay it out, I'm not
> sure
> >> > > that it should come through the TSC. Maybe Kurt would be a good
> start as
> >> > > the community manager? No offense to Kurt but I'd also like an
> >> > > escalation path or alternative path - with these kinds of things
> it's
> >> > > important to be able to bypass an individual if necessary.
> >> >
> >> > Re: Community Manager, I am already partially doing that in an
> >> > unofficial sense, but for an escalation path, I would highly recommend
> >> > first reaching out to the TSC. Any inappropriate activity or
> harassment
> >> > must be taken care of immediately and the community leadership would
> be
> >> > tasked to take care of that.
> >> >
> >> > >
> >> > > - The clause on scope seems to me like it may leave a gap
> surrounding
> >> > > harassment of community members outside of the official OpenBMC
> setting
> >> > > - ie, Foo posts to their Twitter account, "I'm having a lot of
> trouble
> >> > > with Bar's code reviews. What an idiot! Tell them so - their email
> is
> >> > > bar@baz.org <mailto:bar@baz.org>!" I'm not sure I'm seeing how the
> >> > > contributor covenant protects against this kind of behavior. Maybe
> I'm
> >> > > just misreading and this counts as "prviate communication"?
> >> >
> >> > This would absolutely require that the person be put on notice. Maybe
> it
> >> > will help, but I have also never seen this behavior work for anyone
> >> > trying to harass anyone. It has always backfired on the person doing
> the
> >> > harassing in every case I can think of (I have been involved in a
> couple).
> >> >
> >> > >
> >> > > On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <
> jefro.net@gmail.com
> >> > > <mailto:jefro.net@gmail.com>> wrote:
> >> > >
> >> > >     Hi folks
> >> > >
> >> > >     We strongly recommend the contributor covenant coc. Being
> adopted by
> >> > >     many projects.
> >> > >
> >> > >
> https://www.contributor-covenant.org/version/1/4/code-of-conduct
> >> > >
> >> > >     Glad to discuss more
> >> >
> >> > As I said in my previous email, we already have a CoC under the LF
> >> > policies, but I am not opposed to adopting a new one. That said, do we
> >> > need to improve the existing one? Is there something missing? Has
> anyone
> >> > compared the two? Did I just sign up to do that?  :)
> >> >
> >> > Kurt Taylor (krtaylor)
> >>
> >> I just read over the LF CoC and I think it's pretty solid.
> >
> >
> > I'd say my only serious concern about the LF one is that it directs
> concerns to someone outside of the project, first. It seems like we can
> expedite responses if we encourage folks to report via the TSC or community
> manager first, and escalate to the LF community manager if necessary.
>
> True, but one would typically see this be a level thing -- if
> something isn't severe, keep it in house, otherwise escalate. But who
> defines when to escalate or what's severe or,... yeah, it is nice to
> keep some aspect in the project so that minor things might be worked
> out more quickly.. but I don't know.
>
> >
> > As a side point, we should make it more clear that we adhere to the LF
> CoC. I would be comfortable mentioning it explicitly in some doc in docs/
> or the openbmc/openbmc readme, or something. Looking for LF membership and
> then from there to the CoC isn't very clear to me.
>
> We should definitely point to something somewhere.
>

FWIW, I just surprised a contributor to a different LF project when I told
him we were under the LF CoC already - he didn't know his project had
inherited a CoC either. Sounds like this is an issue that might be a little
widespread.

>

--000000000000aa1b6e0577faa720
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Oct 11, 2018, 2=
:26 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct=
 11, 2018 at 2:21 PM Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@googl=
e.com" target=3D"_blank">emilyshaffer@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Oct 10, 2018, 7:52 PM Patrick Venture &lt;<a href=3D"mailto:ve=
nture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Oct 10, 2018 at 7:58 AM krtaylor &lt;<a href=3D"mailto:kur=
t.r.taylor@gmail.com" target=3D"_blank">kurt.r.taylor@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 10/9/18 1:53 PM, Emily Shaffer wrote:<br>
&gt;&gt; &gt; &gt; Reading through this, I&#39;ve got a couple concerns:<br=
>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; - There&#39;s a clause for enforcement. How do we want t=
o assign ownership<br>
&gt;&gt; &gt; &gt; when enforcement is needed? We probably want to lay it o=
ut, I&#39;m not sure<br>
&gt;&gt; &gt; &gt; that it should come through the TSC. Maybe Kurt would be=
 a good start as<br>
&gt;&gt; &gt; &gt; the community manager? No offense to Kurt but I&#39;d al=
so like an<br>
&gt;&gt; &gt; &gt; escalation path or alternative path - with these kinds o=
f things it&#39;s<br>
&gt;&gt; &gt; &gt; important to be able to bypass an individual if necessar=
y.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Re: Community Manager, I am already partially doing that in a=
n<br>
&gt;&gt; &gt; unofficial sense, but for an escalation path, I would highly =
recommend<br>
&gt;&gt; &gt; first reaching out to the TSC. Any inappropriate activity or =
harassment<br>
&gt;&gt; &gt; must be taken care of immediately and the community leadershi=
p would be<br>
&gt;&gt; &gt; tasked to take care of that.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; - The clause on scope seems to me like it may leave a ga=
p surrounding<br>
&gt;&gt; &gt; &gt; harassment of community members outside of the official =
OpenBMC setting<br>
&gt;&gt; &gt; &gt; - ie, Foo posts to their Twitter account, &quot;I&#39;m =
having a lot of trouble<br>
&gt;&gt; &gt; &gt; with Bar&#39;s code reviews. What an idiot! Tell them so=
 - their email is<br>
&gt;&gt; &gt; &gt; <a href=3D"mailto:bar@baz.org" target=3D"_blank">bar@baz=
.org</a> &lt;mailto:<a href=3D"mailto:bar@baz.org" target=3D"_blank">bar@ba=
z.org</a>&gt;!&quot; I&#39;m not sure I&#39;m seeing how the<br>
&gt;&gt; &gt; &gt; contributor covenant protects against this kind of behav=
ior. Maybe I&#39;m<br>
&gt;&gt; &gt; &gt; just misreading and this counts as &quot;prviate communi=
cation&quot;?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This would absolutely require that the person be put on notic=
e. Maybe it<br>
&gt;&gt; &gt; will help, but I have also never seen this behavior work for =
anyone<br>
&gt;&gt; &gt; trying to harass anyone. It has always backfired on the perso=
n doing the<br>
&gt;&gt; &gt; harassing in every case I can think of (I have been involved =
in a couple).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon &lt;<a =
href=3D"mailto:jefro.net@gmail.com" target=3D"_blank">jefro.net@gmail.com</=
a><br>
&gt;&gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:jefro.net@gmail.com" target=
=3D"_blank">jefro.net@gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi folks<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0We strongly recommend the contributor=
 covenant coc. Being adopted by<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0many projects.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.contributor-co=
venant.org/version/1/4/code-of-conduct" rel=3D"noreferrer" target=3D"_blank=
">https://www.contributor-covenant.org/version/1/4/code-of-conduct</a><br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Glad to discuss more<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As I said in my previous email, we already have a CoC under t=
he LF<br>
&gt;&gt; &gt; policies, but I am not opposed to adopting a new one. That sa=
id, do we<br>
&gt;&gt; &gt; need to improve the existing one? Is there something missing?=
 Has anyone<br>
&gt;&gt; &gt; compared the two? Did I just sign up to do that?=C2=A0 :)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Kurt Taylor (krtaylor)<br>
&gt;&gt;<br>
&gt;&gt; I just read over the LF CoC and I think it&#39;s pretty solid.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;d say my only serious concern about the LF one is that it direct=
s concerns to someone outside of the project, first. It seems like we can e=
xpedite responses if we encourage folks to report via the TSC or community =
manager first, and escalate to the LF community manager if necessary.<br>
<br>
True, but one would typically see this be a level thing -- if<br>
something isn&#39;t severe, keep it in house, otherwise escalate. But who<b=
r>
defines when to escalate or what&#39;s severe or,... yeah, it is nice to<br=
>
keep some aspect in the project so that minor things might be worked<br>
out more quickly.. but I don&#39;t know.<br>
<br>
&gt;<br>
&gt; As a side point, we should make it more clear that we adhere to the LF=
 CoC. I would be comfortable mentioning it explicitly in some doc in docs/ =
or the openbmc/openbmc readme, or something. Looking for LF membership and =
then from there to the CoC isn&#39;t very clear to me.<br>
<br>
We should definitely point to something somewhere.<br></blockquote></div><d=
iv><br></div><div>FWIW, I just surprised a contributor to a different LF pr=
oject when I told him we were under the LF CoC already - he didn&#39;t know=
 his project had inherited a CoC either. Sounds like this is an issue that =
might be a little widespread.</div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
</blockquote></div>

--000000000000aa1b6e0577faa720--
