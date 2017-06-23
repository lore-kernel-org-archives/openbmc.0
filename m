Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wvRrj2HZ3zDqjD
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jun 2017 04:32:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PKR+NhcX"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id p21so42123516qke.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jun 2017 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vv8jt2kju4wIumlPpIVTow2OZuh04WswuFTUYf84PXo=;
 b=PKR+NhcX7sneYbHDbAdhWUpdqkIitlplX0nmE9/jE1xoNzq4WN4zlFy3qEscs8HAiC
 VFiSlP3R6jHi5boIPks3/MdnAsSQNU/k2Swx19hJypENR9ZL/CeCK/gVQA6FRmt5Zqvs
 60QztY1GQ60ePUtQUYUYhdWRDSLlm+SdLLxj+1bVQDQlRXz3V++NjS3p3OV0xsRacfWA
 i9zxS2mRlPu3p0ePTxLU6UqX3GBd+M077k7Bd9V0IqDDj7dptbFqyaYKwLTy3NXgUvxD
 nxeR7kG5zXLTtMEQwqBHHdbXmS6ZpDrljgBFglhn0fR/B2/j6OiD2jRR6GLIZKR7TUSk
 Fqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vv8jt2kju4wIumlPpIVTow2OZuh04WswuFTUYf84PXo=;
 b=E7SSLQS++e4fUFt41dCuuvkOf5Pd5BTGOvtvVLii8OskoR1lYyI1OyzVthNOpoIo3O
 trrauj6ZCbcWYALyZMJ5fa/aAD15ofgoUgRdWQ12rWwjB3AYwn32KFYdxMZDd1bQAuzo
 pbXh37MZEBBoq0YV7zsYQNclSbd146LrcdNGv1FuGZ5s4KaIyXfymfPsaHEI/4n+CmPk
 zoqdFhsxZ4n3yGktb9f1N0xt2aHqUrVymQUEL3HfVL5APXnvtGpQb69vQnYbO3kc8eRt
 4qmbxF7HXENeoqeuJKTeREdON7GDb7dPqFpmhfH/6qdgBg/soM7ViyFFrxLX8RkujUgY
 +tRA==
X-Gm-Message-State: AKS2vOy72E6I/1Tb94MKeFFN2ARKsz8nz+eWMqTT1BPL+AzajDbFX7gp
 ytfaT+u7ZI5KOlLV3FRSvkcR1lkqAXc/
X-Received: by 10.55.9.141 with SMTP id 135mr11075409qkj.9.1498242754309; Fri,
 23 Jun 2017 11:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <201706230720.v5N7K755030029@mactruck.svl.corp.google.com>
In-Reply-To: <201706230720.v5N7K755030029@mactruck.svl.corp.google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 23 Jun 2017 18:32:23 +0000
Message-ID: <CAFd5g47f6Cd3GYnrZPKZ+Hnamm1narto9zmGffDpfyKdtAu-7g@mail.gmail.com>
Subject: Re: phosphor-net-ipmid
To: ilya@yadro.com
Cc: patrick@stwcx.xyz, tomjoseph@in.ibm.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1148a36e28f13e0552a4d3b1"
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
X-List-Received-Date: Fri, 23 Jun 2017 18:32:39 -0000

--001a1148a36e28f13e0552a4d3b1
Content-Type: text/plain; charset="UTF-8"

Whoops, looks like you already hopped on the IRC. Anyways, welcome!

On Fri, Jun 23, 2017 at 12:20 AM <brendanhiggins@google.com> wrote:

> > Hello,
> > we would like to help with phosphor-net-ipmid and have volunteer. For us
> main
> > priorities are sensors and sel. Obviously work is in progress there and
> we don't
> > want to duplicate it, so please share tasks with us and tell how we can
> > contribute?
> > Thanks!
>
> Awesome! Always great to see more people getting involved!
>
> The first thing to do would be to hop on the IRC channel: #openbmc on
> freenode.net and say hi to everyone.
>
> Next, in order to see what tasks we have going on, install Zenhub:
> https://www.zenhub.com/. Then look at
> https://github.com/openbmc/openbmc#boards
>
> Probably also a good idea to talk to Patrick and Tom (I CC'ed them). I am
> pretty
> sure they are more familiar with that codebase than anyone else.
>
> Once you know what you want to work on, or even if you just need some help,
> either start a conversation on the IRC channel or send an email to the
> list.
>
> phosphor-net-ipmid is not something I work on or am likely to work on in
> the
> near future, but I think I know most of the people on the list, so feel
> free to
> CC me on future emails and I will try to make sure the right people are
> involved
> in the conversation.
>
> Cheers!
>

--001a1148a36e28f13e0552a4d3b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops, looks like you already hopped on the IRC. Anyways,=
 welcome!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun =
23, 2017 at 12:20 AM &lt;<a href=3D"mailto:brendanhiggins@google.com">brend=
anhiggins@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>&gt; Hello,<br>
&gt; we would like to help with phosphor-net-ipmid and have volunteer. For =
us main<br>
&gt; priorities are sensors and sel. Obviously work is in progress there an=
d we don&#39;t<br>
&gt; want to duplicate it, so please share tasks with us and tell how we ca=
n<br>
&gt; contribute?<br>
&gt; Thanks!<br>
<br>
Awesome! Always great to see more people getting involved!<br>
<br>
The first thing to do would be to hop on the IRC channel: #openbmc on<br>
<a href=3D"http://freenode.net" rel=3D"noreferrer" target=3D"_blank">freeno=
de.net</a> and say hi to everyone.<br>
<br>
Next, in order to see what tasks we have going on, install Zenhub:<br>
<a href=3D"https://www.zenhub.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.zenhub.com/</a>. Then look at <a href=3D"https://github.com/openb=
mc/openbmc#boards" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/openbmc#boards</a><br>
<br>
Probably also a good idea to talk to Patrick and Tom (I CC&#39;ed them). I =
am pretty<br>
sure they are more familiar with that codebase than anyone else.<br>
<br>
Once you know what you want to work on, or even if you just need some help,=
<br>
either start a conversation on the IRC channel or send an email to the list=
.<br>
<br>
phosphor-net-ipmid is not something I work on or am likely to work on in th=
e<br>
near future, but I think I know most of the people on the list, so feel fre=
e to<br>
CC me on future emails and I will try to make sure the right people are inv=
olved<br>
in the conversation.<br>
<br>
Cheers!<br>
</blockquote></div>

--001a1148a36e28f13e0552a4d3b1--
