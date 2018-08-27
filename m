Return-Path: <kun.yi.731@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=kun.yi.731@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u0Ys+vr1"; 
 dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zpgG2zCNzDqwt
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:55:53 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id m84-v6so570276lje.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsGrEqDEVwdZVMHCN/MaBNlkO1m4GhXDC9s8FitjJ2M=;
 b=u0Ys+vr1aYdaksHTlV4zcKuh6M8c8xIyHIIxeAcwv2uwNgZLfpyTIVX9ZJ55k0yggu
 20DUfNc5UgnZIL/wROvqPgaHz7UuuXyuMqG4Jyd5WwWZtO1Q10eVW+mWT2pKmOJKVIJ8
 3Qe+gERhqwJi7IJ9rku+DOg182t1czsAtCeX8gA0LZEPvVcMF+tNe5YMmyag735+0CXm
 q+SbsQDe6u0zyK4NNzXLvXvvbBQx9a+lNfF6bh4jGPPxA8w5psUIWkMsOHq4aS6199nq
 MtIoGVemhQXdURkzUttjkq60BWoldGW7o1x7aeFU8BfiqUOUar1Ug5BgQ5No498oJs/g
 AgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsGrEqDEVwdZVMHCN/MaBNlkO1m4GhXDC9s8FitjJ2M=;
 b=VrbUXRccNSydeivC3BNG3Kcl6YGWWJihSIF8RM2q1NINfBOfH+oAiXRPzTacnbz17n
 cNvvKgTmQ1USLYERWZJzhh68wNyB7TntRC4ml42SkO7yppXMlesILkq8MTU3/tL533RS
 HQTrZkoUGRNXRuPhCLg9OoTEzuIhG7NzhoksLntUBtDzDGsQRmO9L54nRX1VfsoAjxoI
 yTPor/45+Dx+WaIo0WOUr/iWUGcCDpaD1mdNlSLEySwlAcEVAKHPAW9z/CaH1l6SoU4K
 zd81KLsz1SJx3RQImgSPJeFmzw5rBM+bqmYLnMDqllQFFwJ19aYd7QJmu3TgLLrQUbYe
 xwmw==
X-Gm-Message-State: APzg51B8rGhKPip9R3skjOJ6V7FWeKmrPrQHl6IzLcfy2pIMgG842cvg
 1zr2MikeGOE84P0wxg1EphgfITZ35y9duC89dOY=
X-Google-Smtp-Source: ANB0VdaV9NO2gzTJDHOW/dhwexOpkFJNuHctAkArgwtYoxDuN/0dUQ5sQLD6cnyzint77EsU+nwxqw42V78V0pvLMIE=
X-Received: by 2002:a2e:5f93:: with SMTP id
 x19-v6mr9693840lje.60.1535414150532; 
 Mon, 27 Aug 2018 16:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
In-Reply-To: <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
From: Kun Yi <kun.yi.731@gmail.com>
Date: Mon, 27 Aug 2018 16:55:14 -0700
Message-ID: <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
Subject: Re: RE: Proposal for caching/buffering POST codes list for one boot
 process.
To: ed.tanous@intel.com
Cc: chunhui.jia@linux.intel.com, venture@google.com, kuiying.wang@intel.com, 
 james.mihm@intel.com, hai.v.nguyen@intel.com, james.feist@intel.com, 
 chunhui.jia@intel.com, openbmc@lists.ozlabs.org, yong.b.li@intel.com, 
 cheng.c.yang@intel.com, bradleyb@fuzziesquirrel.com, qiang.xu@intel.com, 
 geissonator@yahoo.com, Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="00000000000006943505747377b5"
X-Mailman-Approved-At: Mon, 10 Sep 2018 10:12:06 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 23:55:55 -0000

--00000000000006943505747377b5
Content-Type: text/plain; charset="UTF-8"

Obvious another thing we would need to consider is performance. A host
booting session could produce dozens or hundreds of POST codes depending on
how verbose the BIOS is, and we should be careful not to design something
that creates too much DBus traffic. These embedded processors are not
performance beasts by any means.

Kun


On Mon, Aug 27, 2018 at 4:52 PM Kun Yi <kun.yi.731@gmail.com> wrote:

> I think the choice of *where* to put such buffering warrants some thoughts
> and design. Going through what I have thought:
>
> 1. It's possible to implement host state detection and host POST code
> buffering all in a client daemon, which is a long-lived process that
> - keeps listening to POST codes published
> - keeps polling host state
> - when host power state toggled, write the POST codes received to a file
> on disk
>
> Pros of this approach is that server daemons are kept simple. POST code
> server doesn't need to talk to host state daemon or even assume its
> existence.
> Pros of buffering on server side: potentially there will be more than one
> identities needing the list of POST codes. IPMI? Logging? It would really
> help if we can identify some concrete use cases.
>
> On Mon, Aug 27, 2018 at 8:47 AM Tanous, Ed <ed.tanous@intel.com> wrote:
>
>> > Could you confirm if the "/xyz/openbmc_project/host/post/1" that we
>> talked here contains a list of post code for one cycle?
>>
>> Correct.  Each one would contain a list of POST codes for that boot.
>>
>> -Ed
>>
>

--00000000000006943505747377b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Obvious another thing we would need to consider is perform=
ance. A host booting session could produce dozens or hundreds of POST codes=
 depending on how verbose the BIOS is, and we should be careful not to desi=
gn something that creates too much DBus traffic. These embedded processors =
are not performance beasts by any means.<div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Kun<=
/div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Aug 27, 2018 at 4:52 PM Kun Yi &lt;<a href=3D"mailto:kun.yi.731@gma=
il.com">kun.yi.731@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr">I think the choice of *where* to put such bufferi=
ng warrants some thoughts and design. Going through what I have thought:<di=
v><br></div><div>1. It&#39;s possible to implement host state detection and=
 host POST code buffering all in a client daemon, which is a long-lived pro=
cess that</div><div>- keeps listening to POST codes published</div><div>- k=
eeps polling host state</div><div>- when host power state toggled, write th=
e POST codes received to a file on disk</div><div><br></div><div>Pros of th=
is approach is that server daemons are kept simple. POST code server doesn&=
#39;t need to talk to host state daemon or even assume its existence.</div>=
<div>Pros of buffering on server side: potentially there will be more than =
one identities needing the list of POST codes. IPMI? Logging? It would real=
ly help if we can identify some concrete use cases.</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 27, 2018 at 8:47 AM Tanous, =
Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; Could =
you confirm if the &quot;/xyz/openbmc_project/host/post/1&quot; that we tal=
ked here contains a list of post code for one cycle?=C2=A0<br>
<br>
Correct.=C2=A0 Each one would contain a list of POST codes for that boot.<b=
r>
<br>
-Ed<br>
</blockquote></div></div></div>
</blockquote></div>

--00000000000006943505747377b5--
