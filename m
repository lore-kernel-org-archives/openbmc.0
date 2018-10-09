Return-Path: <jefro.net@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=jefro.net@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CVlkLdac"; 
 dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V5RN46YxzDqNF
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 05:31:41 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id d2-v6so2910836wro.7
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VDSS6Z6ep9B/yvcNt2BdZ7RrIpR4V5+N2I6zVa0WnYE=;
 b=CVlkLdach7voqy/H1jvR3v75GNaEzFa6/ppulqhP+wO71xiZF62EHDmiDUTlI6nzjZ
 XA1VVrqmk6NPbp8TNBfRwB0MaPXnLHtf8WdfRnPxV1Cf71UOAXszFQWz4TyvqaFSiRvp
 XVm/c2otvbAjK8XIqWy1ZBn35WOCOfSUkOgpFOBloR17IKLv6Fm2YxmIImBuLyjJTU5D
 0Mdq4DHoORLXpaYI9YbosUaCZ1d6gqJSNtr5btX4eKkjXElYHSUxdGGlLpIJw0jQPDy0
 5/SHt5fBcSJj4ohs+rencTRr4Guytz+Y4kA9LdnFbz9pqfsAssywGSkxnoEt3EH75ouv
 CWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDSS6Z6ep9B/yvcNt2BdZ7RrIpR4V5+N2I6zVa0WnYE=;
 b=tYAMnkdrgZXFgCIlctcInObEdqryzeW9bagRIvKQ6SCQcSKOfBqj56odQa6AW4U9QP
 9wGTtTKSLgQbbD17xlY9E3aLvzV55bsvk4INLRu2Qga5rjOxBUe+HW3ZMp+S1PRz5fSy
 BSKh4Xozg99D8tjAOomMZL2LJ3/iPmTSCALtT/WP/5M9MDlsKiPKGXlIUpyBHfufJB9B
 943o0of7ebLFm4wYm3UxW1w03M7vKv2UvoZMt2Nq1K+WpirL1Ceqlrts5wBppBZCoe37
 mgtBlCYqZHQhB8wMB7CuK3zRx8cov+zorAhD82ZMQyWjcH9yJj7JS2szVg3DW5tmc9w1
 cGhw==
X-Gm-Message-State: ABuFfojWfDBDXcE4lw4Qys4RZQxsgczVvvEC663KLtlyk8OxGM/HTfUI
 3tXZJ3GCucRF6nlYEOoBEKlOAOrXuSecv/hfWbg=
X-Google-Smtp-Source: ACcGV60y4qXKaPmqs3/E/kQSTdhasIX//NsgoNUjn9ROARMn8KOzdX7LNaphkrDk2UB/4vkAZWp9JFB/IhihWUYQKZA=
X-Received: by 2002:a5d:450d:: with SMTP id
 s13-v6mr20612894wrq.82.1539109898325; 
 Tue, 09 Oct 2018 11:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
In-Reply-To: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro.net@gmail.com>
Date: Tue, 9 Oct 2018 11:31:26 -0700
Message-ID: <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c2ae700577cff28e"
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
X-List-Received-Date: Tue, 09 Oct 2018 18:31:45 -0000

--000000000000c2ae700577cff28e
Content-Type: text/plain; charset="UTF-8"

Hi folks

We strongly recommend the contributor covenant coc. Being adopted by many
projects.

https://www.contributor-covenant.org/version/1/4/code-of-conduct

Glad to discuss more

On Tue, Oct 9, 2018, 11:28 AM Emily Shaffer <emilyshaffer@google.com> wrote:

> Hi all,
>
> As I briefly mentioned at the end of Brad's presentation today, I'd like
> to propose adding and enforcing a code of conduct for us to follow.
>
> For now, I am planning to grab a copy of the Linux CoC and put it up for
> review in /docs. If anybody has a different CoC source to suggest, I'd be
> happy to discuss.
>
> Brad asked me whether I had seen an issue so far and I had not, so please
> don't take this email as some kind of retaliation - it's not. I think we've
> got a great, positive community and as we grow I'd like to preserve that
> culture, and the code of conduct is a great way to do so.
>
> - Emily
>

--000000000000c2ae700577cff28e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi folks=C2=A0<div dir=3D"auto"><br></div><div dir=3D"aut=
o">We strongly recommend the contributor covenant coc. Being adopted by man=
y projects.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><span =
style=3D"font-family:sans-serif"><a href=3D"https://www.contributor-covenan=
t.org/version/1/4/code-of-conduct">https://www.contributor-covenant.org/ver=
sion/1/4/code-of-conduct</a></span><br></div><div dir=3D"auto"><span style=
=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto"><span style=
=3D"font-family:sans-serif">Glad to discuss more</span></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9, 2018, 11:28 AM Emily=
 Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com">emilyshaffer@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">Hi all,<div><br></div><div>As I briefly mentioned at the end of Brad&#39;=
s presentation today, I&#39;d like to propose adding and enforcing a code o=
f conduct for us to follow.</div><div><br></div><div>For now, I am planning=
 to grab a copy of the Linux CoC and put it up for review in /docs. If anyb=
ody has a different CoC source to suggest, I&#39;d be happy to discuss.</di=
v><div><br></div><div>Brad asked me whether I had seen an issue so far and =
I had not, so please don&#39;t take this email as some kind of retaliation =
- it&#39;s not. I think we&#39;ve got a great, positive community and as we=
 grow I&#39;d like to preserve that culture, and the code of conduct is a g=
reat way to do so.</div><div><br></div><div>- Emily</div></div>
</blockquote></div>

--000000000000c2ae700577cff28e--
