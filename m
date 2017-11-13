Return-Path: <yuenn@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e4AkVGdq"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybLrM4ZnKzDqjf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 06:52:03 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id x65so10808162vkx.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=b6+KIfEuj1fwdCbGWSkLMtVOKScmlLIGuVSUPcqQqYA=;
 b=e4AkVGdqdvQW7Q9R/SrrraVAG3QVFK3J3dad3+BhGVeuOUNui7Pj6X0qH55pzuyw8e
 NkZWqJmO6XQfqRBfup0bziCpiqP5rLwblgbdJ8w7ADqZEzAz7Aovq6snOI8LnDl0sR2e
 szqkSesBadptbb/UOEUsr6pSNdDljC1Pet8Wne96wXrKdK6uV3kIWo9yMy/35KPOThY0
 YSiQBx9hpwbTr3PUFhHjVD5fh3MQjkTANqOC3VeFa6sk0jYt0JZB+YSUzjgcmEYlsVVG
 w/82DGdBXBxDCLMR5eq/XUC8O6nfykp/pmZQz0VvBw6DcptSDgdff8K8jT2yije7w22G
 N1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=b6+KIfEuj1fwdCbGWSkLMtVOKScmlLIGuVSUPcqQqYA=;
 b=OC9YLojgN9Lst5HKNXJh2dyNdfyPN6tuX/TF6qBOihP29NXYl3VVmZKRaztRMXobwq
 G/Qz2RJCqPdrPthQHGOefmxr0huLi4jrQbuuhGsYfw5foTM7E4DPhcSszcVWoIZATABv
 snDG9VFVsj/q999bjcHmX0Zm5vm/TTnFEHShej94KP8O2OIwqBCz5wHUN/IJxbQ/IF6v
 z5nRzQtXfC+kyZo5mMB174PiXCqcKL4wyCo46oNOn2GxzqhsWmMOEPmcv401PNRqsLp0
 3W8UL2j6PL9RVgEAEB9NlxcmuUjAgjou04fOekzwYciUvutWnRlSVmJslxfu7LOQ8nlc
 URdQ==
X-Gm-Message-State: AJaThX4o3Rx8krrs+ecYTnpcb1zRQu8v/BVNwXoQERqnNnTedFzauI/d
 75L5tGA4Waana+8lYlkr1rkldIE4/xufhDj1zHoUBQ==
X-Google-Smtp-Source: AGs4zMbZbWiMMTOax307F3LBzqPTObhUiiIj2IWOJR2krEvATAQ7Bc5iDKAMJ0PgsOx/aObyCVIepgtNJwXwSzvjDlM=
X-Received: by 10.31.14.144 with SMTP id 138mr7429179vko.88.1510602720403;
 Mon, 13 Nov 2017 11:52:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.178.66 with HTTP; Mon, 13 Nov 2017 11:51:19 -0800 (PST)
In-Reply-To: <CACPK8XfeOVFEq6mRSL2DKOJazSvGSPYHrG6OtEtNi+EeWptvWg@mail.gmail.com>
References: <4322480B-15BC-4260-9D78-917E823CB8D8@fuzziesquirrel.com>
 <CACPK8XfeOVFEq6mRSL2DKOJazSvGSPYHrG6OtEtNi+EeWptvWg@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 13 Nov 2017 11:51:19 -0800
Message-ID: <CADfYTpFLS4MO4iAYnw9i-LqS5_WNwkkqO7PX3kk6hXJB2KR1Zw@mail.gmail.com>
Subject: Re: OpenBMC community telecom - call for 11/13 topics
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114551d88c67d2055de29a16"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 19:52:04 -0000

--001a114551d88c67d2055de29a16
Content-Type: text/plain; charset="UTF-8"

I'd like to talk a bit more about testing.

----------
Nancy

On Sat, Nov 11, 2017 at 4:46 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> > Please reply with any topics for the 11/13 call.
>
>  - Moving to a new base kernel (4.13)
>
> Cheers,
>
> Joel
>

--001a114551d88c67d2055de29a16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d like to talk a bit more about testing.</div><div c=
lass=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Sat, Nov 11, 2017 at 4:46 PM, Joel Stanle=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank"=
>joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop<br>
&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.=
com</a>&gt; wrote:<br>
&gt; Please reply with any topics for the 11/13 call.<br>
<br>
</span>=C2=A0- Moving to a new base kernel (4.13)<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br></div>

--001a114551d88c67d2055de29a16--
