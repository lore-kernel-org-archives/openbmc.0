Return-Path: <yuenn@google.com>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFr3f71z4zDt2g
 for <openbmc@lists.ozlabs.org>; Sat, 12 Nov 2016 06:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WS/3T65a"; 
 dkim-atps=neutral
Received: by mail-wm0-x22d.google.com with SMTP id a197so442874353wmd.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 11:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SKJaFrttHRAT45T1L31dL1qw/8IAywDMep0do4U/Id0=;
 b=WS/3T65aiEiDG+dVMjWUIY46VaSQhoVUWXuLPCG/EnSSZ/hGNLjsETSJbMmHHqzAdn
 fMdbBqZP+PnQBPViVrlLDZ1SVp/jgLlHUV+DPTi+QVUxoiGHXHEdNfjiCwuXgme8LS18
 Mzd4nHlasQcq3I+Rh3dwgZJ7k7nNZlB7+LBMs0uZlArjnJ+uWPcrBtLkgHLzmKbsq1mQ
 0uJpjSgy2Rgicet+YvTxx5K3na1FfNnILL6++UIEt1AmVYSgz8rP+QzRUGY0SlFLJiJY
 Dpi9sdw8QVYCMwIh2wCxKGqVppINz9HzMQsvJqPdJnONfPEm8hh/WS1x+NQc3rHe6JhI
 D8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SKJaFrttHRAT45T1L31dL1qw/8IAywDMep0do4U/Id0=;
 b=g9aKUDbTOMcHAzsO32/Wk56XV4+n5lFzMZG2q4VhOflj+H9ZNjwWy33TgRi8l7NVsN
 ltNoC9h9lpj15S8sZrifoRBFND3/BmLGIRAaLkAl1PJke4UNhlP/iBzA9PzxOJzecSsH
 T4io0MthgM5AbFvIbmK3RwwyUAsL2mZBJu3rs1Lv2G+V/Kk0oTKAFKkxu3Us0mT+KIoU
 QVZT7htQBtL7Bmj6ZDXHA9efsM29mbQCG4g3UF+adnt4XdjDx3CWwHsa0TmXcsClq19w
 ctwnZtnUbw4ERnzd9XSCDd0g80+ineKRte5hyWJLMlpyZtHLdKGlAXrZjShNKB++7P5V
 o2cQ==
X-Gm-Message-State: ABUngveXhNXHanW9yOjEbk9mCMEZGGdexlqKrOBYqTM4W/HqRyrt5c1LTandIFHLYMWPveIMytITZOHyu9/gm9FQ
X-Received: by 10.28.103.134 with SMTP id b128mr13488500wmc.54.1478893496038; 
 Fri, 11 Nov 2016 11:44:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Fri, 11 Nov 2016 11:44:15 -0800 (PST)
In-Reply-To: <31E13033-730E-4EC4-BFA9-A3798CF00792@fuzziesquirrel.com>
References: <CADfYTpHjti40QXSwPHGvgBUTZO9mK8t5h2dvTCnE+1BUAUi1xA@mail.gmail.com>
 <31E13033-730E-4EC4-BFA9-A3798CF00792@fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 11 Nov 2016 11:44:15 -0800
Message-ID: <CADfYTpEKym3+VidubNthSCC0RYCT1MW4bo4=wzLWnLKtCTTWuA@mail.gmail.com>
Subject: Re: AUTHORS files
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114b2fae7e497805410bb9fe
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
X-List-Received-Date: Fri, 11 Nov 2016 19:45:03 -0000

--001a114b2fae7e497805410bb9fe
Content-Type: text/plain; charset=UTF-8

It is a requirement for any open source project to which a Google employee
contributes.  The repos must contain a LICENSE file and an AUTHORS file
that list Google Inc as one of the contributors.

I was able to get a waiver for the AUTHORS requirement for openBMC current
repos so no need to worry about it now.


----------
Nancy

On Thu, Nov 10, 2016 at 3:49 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi Nancy
>
> Is it any open source project or just ones on GitHub?
>
> Would you mind sending a link to an example GitHub project that already
> has this file?
>
> Thx!
>
> -brad
>
> > On Nov 10, 2016, at 5:36 PM, Nancy Yuen <yuenn@google.com> wrote:
> >
> > The open source policy at Google requires that any repo on GitHub we
> contribute to contain an AUTHORS file listing all contributing
> companies/people including Google.
> >
> > Any objection if I send out patches for AUTHORS files for each of the
> openbmc repos, listing Google in the ones where we've contributed?
> >
> > ----------
> > Nancy
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>

--001a114b2fae7e497805410bb9fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It is a requirement for any open source project to wh=
ich a Google employee contributes.=C2=A0 The repos must contain a LICENSE f=
ile and an AUTHORS file that list Google Inc as one of the contributors.</d=
iv><div><br></div><div>I was able to get a waiver for the AUTHORS requireme=
nt for openBMC current repos so no need to worry about it now.</div><div><b=
r></div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">----------<br>Nancy=
</div></div>
<br><div class=3D"gmail_quote">On Thu, Nov 10, 2016 at 3:49 PM, Brad Bishop=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" targe=
t=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Nancy<br>
<br>
Is it any open source project or just ones on GitHub?<br>
<br>
Would you mind sending a link to an example GitHub project that already has=
 this file?<br>
<br>
Thx!<br>
<br>
-brad<br>
<div><div class=3D"h5"><br>
&gt; On Nov 10, 2016, at 5:36 PM, Nancy Yuen &lt;<a href=3D"mailto:yuenn@go=
ogle.com">yuenn@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The open source policy at Google requires that any repo on GitHub we c=
ontribute to contain an AUTHORS file listing all contributing companies/peo=
ple including Google.<br>
&gt;<br>
&gt; Any objection if I send out patches for AUTHORS files for each of the =
openbmc repos, listing Google in the ones where we&#39;ve contributed?<br>
&gt;<br>
&gt; ----------<br>
&gt; Nancy<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div>

--001a114b2fae7e497805410bb9fe--
