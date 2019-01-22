Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Izy5MK4O"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kgqH09QnzDqKl
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 08:02:50 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id g9so12076678plo.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4HiKXpjA1WaQ8m01EX+3R3sN54qC7B1WTCNh/UzKkE=;
 b=Izy5MK4OHDdTgRtKvK+SQIJiuiwlH+oQP5Vto7+mOAKT4G3ZDLXEV3zMyYyF845JhO
 rbmS7U9DQsKyB9wh/OWxoo5t1R8kPcrjkwD+7APagA13Uz0NVyJWRVquGwrYPYUjik4D
 5CkjKHmpLSEgvtU6FmjNmvXmhtm6E6YKd9XEbpnXYwiyWIJgFBtBodpUm+NnSq3w6GM1
 p0Pd8MJ7fnmqYSfRe+qiXNoPRjWg8GNeoS03mTdg3Vu4bD4afLH3PUp01exSoNSiLB4r
 6psQP65i35+RsMBH/T0ym5dKvYC6eEB5fKvlwbrPR6VInO75xfscMvg6KwdAnyxbDntb
 mPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4HiKXpjA1WaQ8m01EX+3R3sN54qC7B1WTCNh/UzKkE=;
 b=DEJd40msJCevb7GrxbKdEpjAe2HZPuJ+yTGFilzxwBUCWroa1o6Xvor5oD9dYwkZSD
 ZPATK3YXAWeCYeI64gkJxkHkUjHO1DdWe1kjOaAQPrq+XOfTOJg/X+13Ln51oWzMe5IY
 aFjuuA0KqKhbbC94rHW99brnVXEG2zxYLDlRK/7CAQaFlcf720bJOi8rTQnOxP+jIwJC
 Mln5xMpl5+UZ+Wth32xCk132WvkRikImU2gtmUvini6QgQvA/ngaKO2Fpp2RQdvjEMdN
 w7WfQjfE8z/+setlxHXBgJKtdduD++wPYD+4JO61S21Bm5UQXxY7g323osV8XoAHoeBE
 SHYA==
X-Gm-Message-State: AJcUukfU7u2/dcEceNR/EcUZSkcK++cxFV52PsR6oWcE2SOjpysItwuM
 O2af51IxdiYzAisoDigK6lLyhCiv/tq8XlfqUdIv/g==
X-Google-Smtp-Source: ALg8bN4Vfxzy1I7wW5vzDUavErb0Q6aRtlNbLdkPA9aJQRK59d4zGb96d7bkZh0iQzDWO8artjjNu6EO0umAB6kjc7c=
X-Received: by 2002:a17:902:1126:: with SMTP id
 d35mr33862246pla.1.1548190968430; 
 Tue, 22 Jan 2019 13:02:48 -0800 (PST)
MIME-Version: 1.0
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <20190122205338.m2giw4ghhievyssc@thinkpad>
In-Reply-To: <20190122205338.m2giw4ghhievyssc@thinkpad>
From: Patrick Venture <venture@google.com>
Date: Tue, 22 Jan 2019 13:02:37 -0800
Message-ID: <CAO=notxTxQgmvjofWZqozZGLYwDbQwNRnneGvU4qV2L-_yCF7g@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>, openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b83b750580124c39"
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
X-List-Received-Date: Tue, 22 Jan 2019 21:02:52 -0000

--000000000000b83b750580124c39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 12:53 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Tue, Jan 22, 2019 at 06:16:20PM +0000, Vijay Khemka wrote:
> > Team,
> > Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. I
> see several functionality in this repo like sensors and storage commands
> are generic enough to be used by other platform who is using entity
> manager. So I feel that we should have these functionalities to be moved =
to
> a separate common repo which can be used by everyone and this repo can on=
ly
> contain Intel OEM specific IPMI command support.
> >
> > My 2 cents =F0=9F=98=8A
>
> In general I support the goal here.
>
> More repos, sure.  Let me know what you want them called, who the
> maintainers of each should be, and confirm that they can be licensed
> as Apache-2.0.
>
> Sorry Vijay - I'm going to hijack your thread.  This is something
> I've been thinking about lately and your note put it at a tipping
> point for me.
>
> We have evolved into a bit of a wild-west culture as far as putting code
> (repos) up in the openbmc namespace.  There are simply no rules at all.
> Anyone can simply ask Brad for a repo and it gets created, no questions
> asked, no accountability.
>
> So I guess a quick poll - does anyone find this concerning (or not)?
>

I'm holding the hypothesis that things expand for a bit, and then fall back
onto themselves. -- which maybe isn't the best approach.  I could be wrong,
it could be the universe expanding and accelerating, which has the
unfortunate consequence of moving galaxies further apart -- code less
compatible or allowing more duplication.


>
> fwiw, I think I'm ok with this model at this point in the project,
> assuming that the rules (or lack thereof) apply to everyone equally.
>
> thx - brad
>

--000000000000b83b750580124c39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Tue, Jan 22, 2019 at 12:53 PM Brad Bishop &lt;<a href=
=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
Jan 22, 2019 at 06:16:20PM +0000, Vijay Khemka wrote:<br>
&gt; Team,<br>
&gt; Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. =
I see several functionality in this repo like sensors and storage commands =
are generic enough to be used by other platform who is using entity manager=
. So I feel that we should have these functionalities to be moved to a sepa=
rate common repo which can be used by everyone and this repo can only conta=
in Intel OEM specific IPMI command support.<br>
&gt; <br>
&gt; My 2 cents =F0=9F=98=8A<br>
<br>
In general I support the goal here.<br>
<br>
More repos, sure.=C2=A0 Let me know what you want them called, who the<br>
maintainers of each should be, and confirm that they can be licensed<br>
as Apache-2.0.<br>
<br>
Sorry Vijay - I&#39;m going to hijack your thread.=C2=A0 This is something<=
br>
I&#39;ve been thinking about lately and your note put it at a tipping<br>
point for me.<br>
<br>
We have evolved into a bit of a wild-west culture as far as putting code<br=
>
(repos) up in the openbmc namespace.=C2=A0 There are simply no rules at all=
.<br>
Anyone can simply ask Brad for a repo and it gets created, no questions<br>
asked, no accountability.<br>
<br>
So I guess a quick poll - does anyone find this concerning (or not)?<br></b=
lockquote><div><br></div><div>I&#39;m holding the hypothesis that things ex=
pand for a bit, and then fall back onto themselves. -- which maybe isn&#39;=
t the best approach.=C2=A0 I could be wrong, it could be the universe expan=
ding and accelerating, which has the unfortunate consequence of moving gala=
xies further apart -- code less compatible or allowing more duplication.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
fwiw, I think I&#39;m ok with this model at this point in the project,<br>
assuming that the rules (or lack thereof) apply to everyone equally.<br>
<br>
thx - brad<br>
</blockquote></div></div>

--000000000000b83b750580124c39--
