Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B6ZVJT/G"; 
 dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Zykj2TgFzF3Vv
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 03:46:52 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id e22-v6so30806417qto.6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WG+UO/DM+hovPYtlYYr1qBQunMfLqkcorD7ARjMvB8=;
 b=B6ZVJT/GSaq3sdKVE48NJfXtiBvctGY5rpyJ84d521YnETDBDKHHz5eHeFa+UYp4mj
 T/Y+yZefRrZR9oUXZLz3WLhQkV6rYUou1awCymJfbbkHnRYkieGnzCKxucXXULZosKIT
 QOLDSIPGVutAR316HS8BCceSdS7/1eP5NhSUsxanlJJ9UmKqGo8kDqTOR6H9FiLRPRbw
 hVK3kKtvaTaDnX5ciEU7BtnWLGjOeIJwRwS3R/txYL/DIyWDO2XUqSuAXRgvn2gMkisp
 +lzUMBLADcdtx8j4WZ2+/6n3F1qL+IdggImEYJzyPUV7wos2TvkUoAwCdGSKVBHdBGhH
 IPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WG+UO/DM+hovPYtlYYr1qBQunMfLqkcorD7ARjMvB8=;
 b=B2wOdOLHavA4gYiIUwSpciw0xmSDccPnmQH19AM2Ifud+dM+qNuIkC9SCiThJJqIsz
 6F+/0E3GVzr8Oatex8pZpKIbt55XjpVxxVtYRzSPt8ljityS4vtmsuqKCjBYshCf3Bap
 RFoFRSq7oEmknMx63+hDE8sAS8bWVIsCVi3SORZrFzVghMD5koAD3b7Mtyl2MkOTQWjH
 BR0H0+zuex3KmDHWlHD4vomFuHH1/tVAT0U85jPmcdUlRWheFq+Vp7gMmziN6ceDtImz
 4hGVV041b92VazFePF1J39EQKr/ECwlJ2GTnN+If2dx+hpoAl5TF0i1msT5Lrdw/z7GL
 8hag==
X-Gm-Message-State: ABuFfohXTY8w7CxqjhA6Iwg7rouw+bifkPqQjED6C0UNfRTqpOp0qwKD
 c/xzireYVg2d/ZBJMxGJqwQWPfYDx6P1KRulMmGjgA==
X-Google-Smtp-Source: ACcGV63dqY5+/Vk4EQT8V1MEc9zWNba6b6ri4qmz72WMdT7ZDKVHPzmR2J8nAKvgSIr1xMleLp6McfTVVfgE5Gl01X0=
X-Received: by 2002:a0c:d851:: with SMTP id i17mr6413441qvj.211.1539794809633; 
 Wed, 17 Oct 2018 09:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
 <20181017154224.GF8064@mauery.jf.intel.com>
In-Reply-To: <20181017154224.GF8064@mauery.jf.intel.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 17 Oct 2018 09:46:37 -0700
Message-ID: <CAJoAoZk1N4=qyqT1dh42Znv2=SdOeOkDuyiVpq1OVMw975X96Q@mail.gmail.com>
Subject: Re: New repo request "stdplus"
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: William Kennington <wak@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a85bd405786f6ad2"
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
X-List-Received-Date: Wed, 17 Oct 2018 16:46:54 -0000

--000000000000a85bd405786f6ad2
Content-Type: text/plain; charset="UTF-8"

I'd personally like to see the mockable DBus wrappers in here.

On Wed, Oct 17, 2018 at 8:43 AM Vernon Mauery <vernon.mauery@linux.intel.com>
wrote:

> On 15-Oct-2018 02:44 PM, William Kennington wrote:
> >I'd like to request a new repo be created where we can put universally
> >used c++ functions and classes that any of our projects could inherit
> >from. This would not be allowed to have any runtime dependencies
> >outside of the typical built-in ones (libstdc++, libc, and the kernel
> >syscall interface).
> >
> >Right now I've got a smart file descriptor and signal blocking
> >function which I'd like to include. It would look something like
> >(although I actually want to break this down into a uniquefd and
> >dupablefd for the purposes of stdplus):
> >
> https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e8965e33f1f28985cf88d22d/src/gpioplus/internal/fd.hpp
> >
> >Let me know what you think,
>
> I think a mmap interface might be nice to go in this library too. While
> there is a boost one, it does require linking against boost_filesystem
> IIRC. And it is a little heavy handed for most use cases.
>
> --Vernon
>

--000000000000a85bd405786f6ad2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d personally like to see the mockable DBus wrappers =
in here.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 1=
7, 2018 at 8:43 AM Vernon Mauery &lt;<a href=3D"mailto:vernon.mauery@linux.=
intel.com">vernon.mauery@linux.intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 15-Oct-2018 02:44 PM, William Kennington wrote:<br>
&gt;I&#39;d like to request a new repo be created where we can put universa=
lly<br>
&gt;used c++ functions and classes that any of our projects could inherit<b=
r>
&gt;from. This would not be allowed to have any runtime dependencies<br>
&gt;outside of the typical built-in ones (libstdc++, libc, and the kernel<b=
r>
&gt;syscall interface).<br>
&gt;<br>
&gt;Right now I&#39;ve got a smart file descriptor and signal blocking<br>
&gt;function which I&#39;d like to include. It would look something like<br=
>
&gt;(although I actually want to break this down into a uniquefd and<br>
&gt;dupablefd for the purposes of stdplus):<br>
&gt;<a href=3D"https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e89=
65e33f1f28985cf88d22d/src/gpioplus/internal/fd.hpp" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e896=
5e33f1f28985cf88d22d/src/gpioplus/internal/fd.hpp</a><br>
&gt;<br>
&gt;Let me know what you think,<br>
<br>
I think a mmap interface might be nice to go in this library too. While <br=
>
there is a boost one, it does require linking against boost_filesystem <br>
IIRC. And it is a little heavy handed for most use cases.<br>
<br>
--Vernon<br>
</blockquote></div>

--000000000000a85bd405786f6ad2--
