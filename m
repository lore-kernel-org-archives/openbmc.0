Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KGgxGe+h"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411Nmh0dbYzF31r
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 08:35:47 +1000 (AEST)
Received: by mail-io0-x22b.google.com with SMTP id t5-v6so9534542ioa.8
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jun 2018 15:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=otlosNbpBFduQBgcOMEXs3hRqzmfD2iuzNxEypqYLM0=;
 b=KGgxGe+hvlmPCW8vUVDajo68AeGuMvnNtWF4kpv/Y9fs1MVoZUlAg/KWv44z07R4QH
 oYv6pGLmuoeJrQUKof7p8C9TRi6ZNUG5ZMQtZiCBFN2KaqiPXIveJyFhZKBgdmpWf5XS
 hgy03xdCRLBKMRAx6FEu1OH4CTrWMYwnvpkJJuFqgE/kxs1u3N6vJqhTrh6cznjahlpu
 n0zlkfCdcwlxaJgoo9lB0YYOEM0Q6JuijJo4AZimVPDEhwuHxBUq2qJ9JY65kEtGyzZR
 rG3R4nuVDf6gicDKkST77ueP4kX8ZqRS994wcivoIirwD5D4+1vS6KuJ0bytKgZjdqNl
 c03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=otlosNbpBFduQBgcOMEXs3hRqzmfD2iuzNxEypqYLM0=;
 b=oxOnvujM9W6Rt72GAsQ47tDVXwKVwnQaWeSis/I+LnP9mK7UyBskyaZVoDaI1T3x31
 y6eky7aHruEVI69FtGVlITWlMUpUzpByIqA2gvTP96PpPOuSjxNiOydLO6PjBljeo2pT
 PdBPMUIfYC5BjklBd9pG8qjTmelQ/uCIRu+sQz7tqUSx75f/N++8Q1YBUH52retxZZ4v
 jlVkeXr9OdtxPzxlhOpG99/mYuVFip3EOxvZpH/zT2pclYG4S7tWcZti27ykoi7QhxbN
 7fs6s0F9qHayjxcNbKVQGa7NhuxQA/m9D+UME0Rb4TDDsAuPP6mUqTIYySFx4rqC4JsT
 4/gg==
X-Gm-Message-State: APt69E1SUhWCWHzXr3YnGChwl6Davj2nX2CaI0foo8AV4BJMQEIEMnJu
 GulcdOFhXy2jgHwSUQhvak7OF5rfLrYy6fEBUnx16jAl
X-Google-Smtp-Source: ADUXVKK8UFdab1s3fG0TVfghhv27iCse1UUIkOdB+avGoQx3a5ScTQKCHWtXF8ucWqzcWP/GSoT+ZFxaZoGkFfFStJo=
X-Received: by 2002:a6b:452:: with SMTP id 79-v6mr4489483ioe.50.1528324544655; 
 Wed, 06 Jun 2018 15:35:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5003:0:0:0:0:0 with HTTP;
 Wed, 6 Jun 2018 15:35:04 -0700 (PDT)
In-Reply-To: <1527813505.462430.1392457368.418CFB45@webmail.messagingengine.com>
References: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
 <87efhs43uo.fsf@linux.vnet.ibm.com>
 <1527813505.462430.1392457368.418CFB45@webmail.messagingengine.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 6 Jun 2018 15:35:04 -0700
Message-ID: <CADfYTpEbEE3sbbgNFvEwrqOAX+xv8jtSGG=Trpva6=-r1OVrgw@mail.gmail.com>
Subject: Re: OpenBMC Security Working Group Kick Off
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Stewart Smith <stewart@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000969825056e00c92e"
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
X-List-Received-Date: Wed, 06 Jun 2018 22:35:49 -0000

--000000000000969825056e00c92e
Content-Type: text/plain; charset="UTF-8"

----------
Nancy

On Thu, May 31, 2018 at 5:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Thu, 31 May 2018, at 18:08, Stewart Smith wrote:
> > Nancy Yuen <yuenn@google.com> writes:
> > > The OpenBMC Security Work Group kick off meeting is scheduled for
> Thurs May
> > > 31, 9AM PDT.  This first meeting is by invite only.  Please email me
> if you
> > > are interested in participating in this working group.
> >
> > Would topics like "security of the BMC from a hostile host" be part of
> > this?
>
> I vote yes, and I'm picking up the work to shut down some of the obvious
> holes again now, at least from an OpenPOWER perspective.
>

Definitely it would be a security topic for our platforms.


>
> >
> > A design of OpenPOWER systems is that the BMC and the Host don't have to
> > trust each other, and this should extend to a host that's hostile
> > towards the BMC.
> >
> > I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
> > we started fuzzing those interfaces.
>
> I've have a neglected branch floating around that adds an AFL harness for
> mboxd. I should start hacking on that again :)
>

Maybe for OpenBMC Fix it next week? :D


>
> Andrew
>

--000000000000969825056e00c92e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br clear=3D"all"><div><div=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">----------<br=
>Nancy</div></div>
<br><div class=3D"gmail_quote">On Thu, May 31, 2018 at 5:38 PM, Andrew Jeff=
ery <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_bla=
nk">andrew@aj.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Thu, 31 May 2018, at 18:08, Stewart Smith wrote:<br>
&gt; Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com">yuenn@google.com</a=
>&gt; writes:<br>
&gt; &gt; The OpenBMC Security Work Group kick off meeting is scheduled for=
 Thurs May<br>
&gt; &gt; 31, 9AM PDT.=C2=A0 This first meeting is by invite only.=C2=A0 Pl=
ease email me if you<br>
&gt; &gt; are interested in participating in this working group.<br>
&gt; <br>
&gt; Would topics like &quot;security of the BMC from a hostile host&quot; =
be part of<br>
&gt; this?<br>
<br>
</span>I vote yes, and I&#39;m picking up the work to shut down some of the=
 obvious holes again now, at least from an OpenPOWER perspective.<br></bloc=
kquote><div><br></div><div>Definitely it would be a security topic for our =
platforms.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; <br>
&gt; A design of OpenPOWER systems is that the BMC and the Host don&#39;t h=
ave to<br>
&gt; trust each other, and this should extend to a host that&#39;s hostile<=
br>
&gt; towards the BMC.<br>
&gt; <br>
&gt; I&#39;d be surprised if we didn&#39;t find bugs in both mboxd and host=
 ipmi if<br>
&gt; we started fuzzing those interfaces.<br>
<br>
</span>I&#39;ve have a neglected branch floating around that adds an AFL ha=
rness for mboxd. I should start hacking on that again :)<br></blockquote><d=
iv><br></div><div>Maybe for OpenBMC Fix it next week? :D</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Andrew<br>
</font></span></blockquote></div><br></div></div>

--000000000000969825056e00c92e--
