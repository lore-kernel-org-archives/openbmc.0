Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22e.google.com (mail-wr0-x22e.google.com
 [IPv6:2a00:1450:400c:c0c::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyrjL0xn2zDqHK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 02:22:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OoknHatj"; 
 dkim-atps=neutral
Received: by mail-wr0-x22e.google.com with SMTP id t20so22318282wra.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xuN+pOIkXfTGDVPS1XPDkyEBbkjkSrMaTR3+lQXa94o=;
 b=OoknHatjsWEP4gp2seYQV0McEU8238zHS9j+jowaX22VLP73KnzKdjh8C3Aw7gB/tw
 iGsRpxRrh1eJi00gbZ6Q8BE2rn1pbihwNabzUV/myGl6iZRkuPP4KS+DtJ/E6Y3hjrot
 5svRzh+rLG9h8n/ezYEuezUpWBnixu0fa+2KACbVJgC36gtdJqQsMruhYtA6xH7H6VDA
 JueLQ2+Q0/zpa/vYcM6jYbGB9hKOovPEB+kh3+uMfUkdx+BlKdswJ/IEW0D63YIC9u7h
 t66tyWrHYJe6XhNPlXRzdPOKt85I9q4K4e4yk4xZll1v1Ir5fWfSJxlYujINb3xRmGkf
 p9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xuN+pOIkXfTGDVPS1XPDkyEBbkjkSrMaTR3+lQXa94o=;
 b=DiNbHgWq53SMVtcV13kQz8doa5OJ04+6CyUCz36eQwEYa4jtgKlk3AVrHgemwv1uS2
 jllpnQtGABH1luTdnkhC/2Cx0y+dF0FH/Wtf+UqErlFu4WIfdKm8QO51tNsVVvoEUpwq
 HD8swoxab+QUZiIIZ0gcRwMFld3D+V/ukpDa3qbXGqrqFqY5ddDXD2LhhrJaYNEYLrf1
 RIiObR5nEU1lFjICs5DrSQUkEuH/Cyv3uHnVZ1Sldeg24i4FBkiRcqpWlMgmKp1yz/Fb
 wSVP1lrMeaOWBU7/l4CDSyYPB7Sj+VoTLgv9Hzt/lRgmlUpZc4fAENdeh+vicSpKYOXa
 IgCQ==
X-Gm-Message-State: AFeK/H2LOT1oMUZAnbt1vU/zA3L4W9DJ1vQOhu9md0hCYe9pgtesivlMAmoFCeD3kZxc1so4SEs2zlOTZXv99eZX
X-Received: by 10.223.136.246 with SMTP id g51mr25354957wrg.83.1491409361954; 
 Wed, 05 Apr 2017 09:22:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Wed, 5 Apr 2017 09:22:41 -0700 (PDT)
In-Reply-To: <20170405125717.GB26558@gondor.apana.org.au>
References: <20170404214307.7748-1-raltherr@google.com>
 <20170405125717.GB26558@gondor.apana.org.au>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 5 Apr 2017 09:22:41 -0700
Message-ID: <CAPLgG==p8W0vvWXMF7-9k_q482F7f9H1OJA_ZNbnV69tgYVZJw@mail.gmail.com>
Subject: Re: [PATCH v1] hw_random: Fix timeriomem_rng for sub-jiffie update
 periods
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Alexander Clouter <alex@digriz.org.uk>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary=001a11491b603c41bb054c6dcd92
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
X-List-Received-Date: Wed, 05 Apr 2017 16:22:46 -0000

--001a11491b603c41bb054c6dcd92
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 5:57 AM, Herbert Xu <herbert@gondor.apana.org.au>
wrote:

> On Tue, Apr 04, 2017 at 02:43:07PM -0700, Rick Altherr wrote:
> > Some hardware RNGs provide a single register for obtaining random data.
> > Instead of signaling when new data is available, the reader must wait a
> > fixed amount of time between reads for new data to be generated.
> > timeriomem_rng implements this scheme with the period specified in
> > platform data or device tree.  While the period is specified in
> > microseconds, the implementation used a standard timer which has a
> > minimum delay of 1 jiffie and caused a significant bottleneck for
> > devices that can update at 1us.  By switching to an hrtimer, 1us periods
> > now only delay at most 2us per read.
> >
> > Migrated to new hw_random API while I in this driver.
> >
> > Signed-off-by: Rick Altherr <raltherr@google.com>
>
> Thanks Rick.  Could you split this into two patches? One doing
> the API conversion and the other one doing the substantive change
> to the entropy gathering?
>
> That way if there is a problem it'll be easier to track down.
>
>
Will do.


> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>

--001a11491b603c41bb054c6dcd92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Apr 5, 2017 at 5:57 AM, Herbert Xu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:herbert@gondor.apana.org.au" target=3D"_blank">herbert@gondor.a=
pana.org.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Tue, Apr 04, 2017 at 02:43:07PM -0700, Rick Altherr wrote:<br>
&gt; Some hardware RNGs provide a single register for obtaining random data=
.<br>
&gt; Instead of signaling when new data is available, the reader must wait =
a<br>
&gt; fixed amount of time between reads for new data to be generated.<br>
&gt; timeriomem_rng implements this scheme with the period specified in<br>
&gt; platform data or device tree.=C2=A0 While the period is specified in<b=
r>
&gt; microseconds, the implementation used a standard timer which has a<br>
&gt; minimum delay of 1 jiffie and caused a significant bottleneck for<br>
&gt; devices that can update at 1us.=C2=A0 By switching to an hrtimer, 1us =
periods<br>
&gt; now only delay at most 2us per read.<br>
&gt;<br>
&gt; Migrated to new hw_random API while I in this driver.<br>
&gt;<br>
&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com"=
>raltherr@google.com</a>&gt;<br>
<br>
</span>Thanks Rick.=C2=A0 Could you split this into two patches? One doing<=
br>
the API conversion and the other one doing the substantive change<br>
to the entropy gathering?<br>
<br>
That way if there is a problem it&#39;ll be easier to track down.<br>
<br></blockquote><div><br></div><div>Will do.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
Thanks,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Email: Herbert Xu &lt;<a href=3D"mailto:herbert@gondor.apana.org.au">herber=
t@gondor.apana.org.au</a>&gt;<br>
Home Page: <a href=3D"http://gondor.apana.org.au/~herbert/" rel=3D"noreferr=
er" target=3D"_blank">http://gondor.apana.org.au/~<wbr>herbert/</a><br>
PGP Key: <a href=3D"http://gondor.apana.org.au/~herbert/pubkey.txt" rel=3D"=
noreferrer" target=3D"_blank">http://gondor.apana.org.au/~<wbr>herbert/pubk=
ey.txt</a><br>
</font></span></blockquote></div><br></div></div>

--001a11491b603c41bb054c6dcd92--
