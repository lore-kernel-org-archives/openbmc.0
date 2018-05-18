Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dN0bS91L"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ndBQ3DqczF2Fh
 for <openbmc@lists.ozlabs.org>; Sat, 19 May 2018 05:13:49 +1000 (AEST)
Received: by mail-io0-x22d.google.com with SMTP id r9-v6so7434885iod.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=H17ayMtGlANjygzxwF1Xdxt1r8/6nmax1JR4PRf1wfE=;
 b=dN0bS91Lcq8TFOaqOv3gvT+b2TflKaWvJyunRQ6asR2HVm/9XAc37Cg2FiIKUS6jh+
 wbXj9q+4urLRukN4fyOI09RWsFFHVRYgbwYRujV0+E9kA0cO6CHVCtop3HJKfqd3Fj8h
 4ncmtgcGdFEBuL+dFUcCJ/JL8kNAFw31yArB35r63oC0eqRo3hj7m+hhaYYeKRPR5eW3
 Y9mJopcTmBQbQWg+CvfmN5bd9IAd8RVczQODLYJ1jSaz9KP3wxulMxiUB2ozkSS0/35x
 ntdpTNN0RwzBJcf+HC4JUruglzuYrcHBb5HGdu5JO2VPKbKofKeh1oB+IMynQMF52Xe3
 fRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=H17ayMtGlANjygzxwF1Xdxt1r8/6nmax1JR4PRf1wfE=;
 b=JhklEXjPQXs5x0+WM2KUhsyjTIooM4uwdcNGERbxm9uzkWcINn8EQ3VEA2BSbI44eW
 KDTbosPRdlYoXTWoQBMztQbYliEEyV24Fbf9AkGVzyCbRdwMxadvo+sh8YCaJUtCUQff
 G8lS2UKYjfmK+6HcrFbryDb6vBU5P5lB78PMbMaXu8u2uOo2KLB+yKdQg+UxyF/cvGfS
 WHeSBFuluzOA8IE4HO/kirV4CE9toTeXueEEI9lRIwNVMxjFW6oXoHhpuKR47dqZAzL5
 lf/Iew0CGSMQQIrfmAY4QFwokgswYkopUPaSwPnVfK4xjmERdsbPmtPC+6+VoGipbBqg
 bTNw==
X-Gm-Message-State: ALKqPwf2Lm0hlgDATaKkBtze5+tEOeq+W89YCqSFiTJLgbvsty0iNJvg
 BWVqzBDxuaDDELbdpWKq7NtYexHZSUCrbwOI2pFUCQZa6uA=
X-Google-Smtp-Source: AB8JxZrqwMRuz5sULvUKlNXlxoe5cnH7l3dRjnptvl6kQ4/ys/ZQldhkJLV2zSsvn6wHsXy+zUvezyyBctaRb2lxBjI=
X-Received: by 2002:a6b:c006:: with SMTP id
 q6-v6mr11749023iof.61.1526670826336; 
 Fri, 18 May 2018 12:13:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:c90c:0:0:0:0:0 with HTTP; Fri, 18 May 2018 12:13:05
 -0700 (PDT)
In-Reply-To: <CACPK8XcTC_BnxVCW4fEymcfGGwpOPGY-cOhWx_1MfhJ6jD_stg@mail.gmail.com>
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
 <CACPK8XcTC_BnxVCW4fEymcfGGwpOPGY-cOhWx_1MfhJ6jD_stg@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 18 May 2018 12:13:05 -0700
Message-ID: <CADfYTpEb25ex9znunS1xBtWm7x-Zc8VOw2wAQ33B1NT03rvouQ@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004c174b056c7fc0f3"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 19:13:51 -0000

--0000000000004c174b056c7fc0f3
Content-Type: text/plain; charset="UTF-8"

:D Happy to have you for any part of it Joel!

----------
Nancy

On Thu, May 10, 2018 at 5:43 AM, Joel Stanley <joel@jms.id.au> wrote:

> Hi Nancy,
>
> On 9 May 2018 at 04:58, Nancy Yuen <yuenn@google.com> wrote:
> > Please join my team for an OpenBMC  community "fix-it" event in June!
> >
> > My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
> > part of a larger fix-it initiative. OpenBMC is a large part of our
> project
> > so I'd like to spend part of the week on a fix-it on OpenBMC.
>
> > Anyone interested in participating?
>
> I would be, as much as is practical given timezones :)
>
> Cheers,
>
> Joel
>

--0000000000004c174b056c7fc0f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">:D Happy to have you for any part of it Joel!<br></div><di=
v class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Thu, May 10, 2018 at 5:43 AM, Joel Stanle=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank"=
>joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi =
Nancy,<br>
<span class=3D"gmail-"><br>
On 9 May 2018 at 04:58, Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com">=
yuenn@google.com</a>&gt; wrote:<br>
&gt; Please join my team for an OpenBMC=C2=A0 community &quot;fix-it&quot; =
event in June!<br>
&gt;<br>
&gt; My team is devoting the week of 6/11/-15 to a Google OpenBMC &quot;fix=
 it&quot; as<br>
&gt; part of a larger fix-it initiative. OpenBMC is a large part of our pro=
ject<br>
&gt; so I&#39;d like to spend part of the week on a fix-it on OpenBMC.<br>
<br>
</span>&gt; Anyone interested in participating?<br>
<br>
I would be, as much as is practical given timezones :)<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--0000000000004c174b056c7fc0f3--
