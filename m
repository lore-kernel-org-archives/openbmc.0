Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8GDY5k4yzDvNn
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 05:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=ie7exCIp; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id d65so19805997vkg.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ANoJyDQy4Kf66q8PKi6XUbrZWcVk3Gp7bAYm166nP5Q=;
 b=ie7exCIp+9cGM6T7X2Cb//MmTaa2xcqfVEge09Wml/eUShxy80rH4g1v0/Ko/OdVx0
 vf/XrbV8ekJ+kb1p8kRRFsrMUthW54bIyL/PBttFMPRoJG4xdxZwerTI2WBkjbZqBpck
 3IHWZWIzvC88CMDM13KXVVukZ4EMawzyUQmB3aFmDIgN+OWThvP6Us/+lkYsjy1IAK6N
 zSrHH0QjpLFhaA9KTmo4P26DXPoXtuT+DorSdbkLZ30ixdmm3yXwQiuMKwcVjCrTsfyA
 9hzFSN+qHJJ9awIpQYUD2kO8HdtYFAcAIs0MYlel0dy0YnIIrHkqxbXVoBly9HNls/KE
 8AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ANoJyDQy4Kf66q8PKi6XUbrZWcVk3Gp7bAYm166nP5Q=;
 b=Gvzsw4St0WxXgw03g8kVFVCgs2cr3ZeUcYH+kjfiuipwjHRf7EiRq4sGjcGp4GpNYN
 TU6z93nPprYrET5Kqb+5ZTWrbZUhW8WS2INZmB9qC5kjQ+pND3mlxPGlg44m9YnTUdxX
 jDmCryy1mEascPtKockkI2SvQGG8Ug6LUaz/H+TETPQMGezF9nFY3ymfgcskm336hWlP
 PdQ9zdIDLGbZNk+e/c6wo9Cz1BXLgBtdklYT18iu0LnRjQljl5wR15wKgYPAZQ15miUn
 gRbxceE6XkWsRmuop5cCkIxE9q9QRvzgvlof2XXZyPPQemTnAzJQptziWF+BKmJnWQBo
 Gu+A==
X-Gm-Message-State: ABUngvcmlFHp+jFYRSkiWk/8uGcgVc4uYxWju65e5jKhBoCIzU2eJWCxpa1J08m2Ea+8RUhECPY+P5Od6bATAgVM
X-Received: by 10.31.193.71 with SMTP id r68mr3688088vkf.114.1478109802603;
 Wed, 02 Nov 2016 11:03:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.36 with HTTP; Wed, 2 Nov 2016 11:03:21 -0700 (PDT)
In-Reply-To: <E611E1DD-010C-4F96-9368-C6265082325C@fuzziesquirrel.com>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <E611E1DD-010C-4F96-9368-C6265082325C@fuzziesquirrel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 2 Nov 2016 11:03:21 -0700
Message-ID: <CAFd5g45uRKmUcayV45aRr3RaDw4X-ATy4SXaHShRQ=cVU4M-_A@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114dca64b99c1705405541ec
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
X-List-Received-Date: Wed, 02 Nov 2016 18:03:26 -0000

--001a114dca64b99c1705405541ec
Content-Type: text/plain; charset=UTF-8

>
> Hi Brendan
>
> First let me say thanks for your work formalizing processes and
> facilitating community
> participation by raising concerns, documenting things, your code
> contributions, etc.
> Thats all goodness.
>
> I think the lists below make sense 95% of the time.  Perhaps more.  If we
> have a formalized
> list such as the one below, and I find myself in the 5% situation, what
> does that mean?
>
> Maybe a better question for discussion is, could you elaborate on what
> advantages a community
> project with a set of non-negotiable rules would have over a project
> without such a set?
>
> thx - brad
>

Great question,

First off, what I consider a blacklist to be: I call it a black list to
distinguish it from the rest of the style guide purely for the purpose of
discussion; I do not plan on submitting this as part of a separate
document; they will be mixed in with the rest of the style guide.
Nevertheless, most rules and suggestions in a style guide are much weaker
than effectively removing a feature from a language. Things are usually
discouraged, but not _forbidden_. Naturally, a stronger rule requires more
discussion and will elicit a stronger reaction from someone who either
agrees with it or disagrees with it; that is the only reason I pulled it
out into a separate discussion.

What I mean when I say forbidden: I think there are exceptions to every
rule, but if a style guide says something is forbidden, the person who is
writing the code needs to document clearly why he is breaking convention
and the reviewers are to make clear that the exception is well explained
(and that they agree with it). So  I would not say they are non-negotiable;
they place a clear onus on the people writing code to document a very good
reason for doing something which makes it easier for reviewers; it also
makes it easier for people writing code because they know what they are
allowed to do and what they are not; so they know what to expect when time
for code review, saving review cycles and thus time.

Cheers!

--001a114dca64b99c1705405541ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"font-size:12.8px">Hi Brendan</span><br style=3D"font-size:12.8px"><b=
r style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">First let me =
say thanks for your work formalizing processes and facilitating community</=
span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">partic=
ipation by raising concerns, documenting things, your code contributions, e=
tc.</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">T=
hats all goodness.</span><br style=3D"font-size:12.8px"><br style=3D"font-s=
ize:12.8px"><span style=3D"font-size:12.8px">I think the lists below make s=
ense 95% of the time.=C2=A0 Perhaps more.=C2=A0 If we have a formalized</sp=
an><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">list suc=
h as the one below, and I find myself in the 5% situation, what does that m=
ean?</span><br style=3D"font-size:12.8px"><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">Maybe a better question for discussion is, c=
ould you elaborate on what advantages a community</span><br style=3D"font-s=
ize:12.8px"><span style=3D"font-size:12.8px">project with a set of non-nego=
tiable rules would have over a project without such a set?</span><br style=
=3D"font-size:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">thx - brad</span><br></blockquote><div><br></div>Great question,=
<div><br></div><div>First off, what I consider a blacklist to be: I call it=
 a black list to distinguish it from the rest of the style guide purely for=
 the purpose of discussion; I do not plan on submitting this as part of a s=
eparate document; they will be mixed in with the rest of the style guide. N=
evertheless, most rules and suggestions in a style guide are much weaker th=
an effectively removing a feature from a language. Things are usually disco=
uraged, but not _forbidden_. Naturally, a stronger rule requires more discu=
ssion and will elicit a stronger reaction from someone who either agrees wi=
th it or disagrees with it; that is the only reason I pulled it out into a =
separate discussion.</div><div><br></div><div>What I mean when I say forbid=
den: I think there are exceptions to every rule, but if a style guide says =
something is forbidden, the person who is writing the code needs to documen=
t clearly why he is breaking convention and the reviewers are to make clear=
 that the exception is well explained (and that they agree with it). So =C2=
=A0I would not say they are non-negotiable; they place a clear onus on the =
people writing code to document a very good reason for doing something whic=
h makes it easier for reviewers; it also makes it easier for people writing=
 code because they know what they are allowed to do and what they are not; =
so they know what to expect when time for code review, saving review cycles=
 and thus time.</div><div><br></div><div>Cheers!</div></div>

--001a114dca64b99c1705405541ec--
