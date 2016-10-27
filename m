Return-Path: <maxims@google.com>
Received: from mail-yw0-x22b.google.com (mail-yw0-x22b.google.com
 [IPv6:2607:f8b0:4002:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4bcN1W8RzDvQp
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 05:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=cCTTco9a; 
 dkim-atps=neutral
Received: by mail-yw0-x22b.google.com with SMTP id u124so55190714ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=v1AkSNOmYuizccDE00s6NgYVU6rAbeLKvAWMV3JSJtQ=;
 b=cCTTco9aNvUPlC9r9vYxqUuat77mjb7iJwGDvpH1VHr2RL00cwIE6XmIBL+udFizao
 uYOp1o32ulN58I4vOX+WeqGZEQn/BoTQzPouqO8l0JTWSCEbhb7p3MOwVOfOzq1rrnG0
 idBQsr8q25HQitjcR8HK/B4dXa/UgZbwFdCixolvTTZ9p1joPYDPET71PrYN28/Iv0FR
 AYoEC3FlSDybb5B/iqziaASDKwtzpGaEUYOswB/Ei9Lmlu8gtFm069qvWhK+ZhnXHEx/
 26d+x2RKGqTvVIUU9XfMsRrczqnrFDXN8H6zpj/Qkohxv4ETf/XG3lcqAIBNUeDHgZJ0
 su8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=v1AkSNOmYuizccDE00s6NgYVU6rAbeLKvAWMV3JSJtQ=;
 b=Fb5yaF1W62wgfGK6soyYgBAyQPc+uNsAp5DalYcILKTQRHGqIQHxKR0oG912jdJk1o
 Pam+R+ylAbn8MsMJzKX9L88ytCwqS5wGntJ65JW3IXgXPheDi/6qN0aNRqG2PwxbPrvm
 BcwhcDK5q2IAoTAsIM401yH0D5n+dkPxDGb8QnAucRf87oHlqVVis06D4I05GdzG9To2
 F8e4xE/g4+nl9pBwxm2gQu6nf991QPhsq/K50A7K0rrWYXk1f+mHn4Vo9s4D0EaxkILa
 8IhfqbLOKDh8NVZqsM4wGhrfsWzqEpO7x4mrXTm4AMCZGg3DdLQ37Yh9+thvqT/be6xA
 rYYw==
X-Gm-Message-State: ABUngverCGVMIJJHJTxIOtneePCCRAMl231xECR3egVwdnes35Gh0U4m/em42NPBWV09ne75hthMiMmFZ8mt177H
X-Received: by 10.13.212.198 with SMTP id w189mr4095877ywd.180.1477594369587; 
 Thu, 27 Oct 2016 11:52:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Thu, 27 Oct 2016 11:52:49 -0700 (PDT)
In-Reply-To: <CACPK8Xfgr+i_pY7vyH+NV=A2jbCPU77YRWdP-HREnfG8ufTzBw@mail.gmail.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
 <1475184427-144121-2-git-send-email-maxims@google.com>
 <CACPK8XfS3kY3PHK7r+aiGQ+5FXe8Wrs2p-FYr=_f58JrCRiQfg@mail.gmail.com>
 <CAFR_W8qd0fOztUqzed=WMXc4KLsMbo3pnb9JYPezQrLV_YeW7g@mail.gmail.com>
 <CACPK8Xfgr+i_pY7vyH+NV=A2jbCPU77YRWdP-HREnfG8ufTzBw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 27 Oct 2016 11:52:49 -0700
Message-ID: <CAFR_W8ongNssKsUsgAS4S3o47Z5Gap6cg2O7rMsdM+p60Q-M7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fd9cc8620d6053fdd3f2a
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
X-List-Received-Date: Thu, 27 Oct 2016 18:52:52 -0000

--001a114fd9cc8620d6053fdd3f2a
Content-Type: text/plain; charset=UTF-8

Hi Joel,

Sorry for long delay, I got distracted by other projects that needed
immediate attention. I'll be sending new and updated patches soon.

On Mon, Oct 17, 2016 at 11:36 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, Oct 18, 2016 at 4:27 AM, Maxim Sloyko <maxims@google.com> wrote:
> >
> >
> > On Thu, Oct 13, 2016 at 5:07 PM, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> On Fri, Sep 30, 2016 at 7:27 AM,  <maxims@google.com> wrote:
> >> > From: Maxim Sloyko <maxims@google.com>
> >> >
> >> > Fixed FUC -> FUN typo in SCU.
> >>
> >> This lacks a signed off by as previously discussed.
> >>
> >> You have not made a convincing argument for this change. I suggest you
> >> drop the patch from your series.
> >
> >
> > Are you against this change per se or just against it being in this patch
> > series?
>
> In our tree at the moment.
>
> We're happy to take drivers that are on their way to being upstream,
> or fixes for bugs that we're hitting.
>
> Other than that our goal should be cleaning up the tree so we can
> submit it upstream. Once we submit upstream everyone has a common base
> to work from, which makes doing cleanups easier.
>

I still don't get it. Is this not a cleanup? I think having consistent
naming is important. It would be understandable if this file was already in
upstream tree and I would be touching parts that are in upstream version
and parts that aren't, but
this file only exists in our tree.

What is the downside?


>
> Cheers,
>
> Joel
>



-- 
*M*axim *S*loyko

--001a114fd9cc8620d6053fdd3f2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Sorry for long delay, I got di=
stracted by other projects that needed immediate attention. I&#39;ll be sen=
ding new and updated patches soon.</div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Mon, Oct 17, 2016 at 11:36 PM, Joel Stanley <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@j=
ms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Tue, Oct 18, 2016 at 4:27 AM, Maxim Sloyko &lt;<a href=3D"mailt=
o:maxims@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Oct 13, 2016 at 5:07 PM, Joel Stanley &lt;<a href=3D"mailto:jo=
el@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Sep 30, 2016 at 7:27 AM,=C2=A0 &lt;<a href=3D"mailto:maxim=
s@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;&gt; &gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">m=
axims@google.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fixed FUC -&gt; FUN typo in SCU.<br>
&gt;&gt;<br>
&gt;&gt; This lacks a signed off by as previously discussed.<br>
&gt;&gt;<br>
&gt;&gt; You have not made a convincing argument for this change. I suggest=
 you<br>
&gt;&gt; drop the patch from your series.<br>
&gt;<br>
&gt;<br>
&gt; Are you against this change per se or just against it being in this pa=
tch<br>
&gt; series?<br>
<br>
</span>In our tree at the moment.<br>
<br>
We&#39;re happy to take drivers that are on their way to being upstream,<br=
>
or fixes for bugs that we&#39;re hitting.<br>
<br>
Other than that our goal should be cleaning up the tree so we can<br>
submit it upstream. Once we submit upstream everyone has a common base<br>
to work from, which makes doing cleanups easier.<br></blockquote><div><br><=
/div><div>I still don&#39;t get it. Is this not a cleanup? I think having c=
onsistent naming is important. It would be understandable if this file was =
already in upstream tree and I would be touching parts that are in upstream=
 version and parts that aren&#39;t, but=C2=A0</div><div>this file only exis=
ts in our tree.</div><div><br></div><div>What is the downside?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114fd9cc8620d6053fdd3f2a--
