Return-Path: <kun.yi.731@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=kun.yi.731@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VlbXwWcn"; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zplL5NVRzDqwt
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:59:25 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id r4-v6so560312lff.12
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 16:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Uh44tihlmwrNJ+04XTxYDFKDM3G2UHGJjOpzd96c/hc=;
 b=VlbXwWcn6YlF6MboUDY1a7ibnpKe1N6jjCXNo+7HbtsuL0XmSFr4L+tB282ZYlddWk
 4eA1Corkl0ecFfOurH3DPfudSGx1ajQ8bAahOVuxdqKJVauZCLmgEXIiHBe4+x3rbLCe
 j89zbF2JGcMmu4T2EGaEcr7+YFx5wyjQz7VLmbRJC7SwoNpoKlBBVIQ6waz5QEEa4vGZ
 wZWAVX/c8oxqatC4ZBxT/ioK+TNUj0wp0lzFLZ01hooYvhuuuC7h0xbWjqoG6g3tmksk
 nZZjuVFXN6a1zuTwtvORODZU7YimbG/Kk9GpNLqBfYI/cbyEui55aptKKwGYc25WTQmD
 L/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Uh44tihlmwrNJ+04XTxYDFKDM3G2UHGJjOpzd96c/hc=;
 b=hscur35nf2tIQXbckap9xcZJicfB/Cm/ymPLkkbMgWolQ2f++Ej1vcP+6vs8L7SRE+
 L2LuBjYpooNXPmrWrniuRaLbhOgxmnHfUVwgPuqQbWbVcp0bJNnEwJLEuUcHRYkWbM3j
 SNiV+K8S86wsOCgZ+51SBMtm6noX2CLIPWtbfM8QKnz5lrj/K2z3CVKtN5EETvVqkFks
 G/i50BuLNFTyUFbNzOilqD4OsiGgfHaS0RdF48IMjaWgHog4tii4DjbmEgKTWv2aRYXP
 ffa5C+3zqhUhj3Zicc70xa1XF/HPuwjPfTxi14PNTcPhWfuriJh6iPQja5na7XHpwRUZ
 TVBw==
X-Gm-Message-State: APzg51DzkUiBK9OonGkcXw5XD8dP48R3+5d6CZZjZkw+V7nPU0BV6Lv6
 rFTSbLWJk5HQ1SPPpcU3PQ21LcEXxbTjHefrxbDbiKm2
X-Google-Smtp-Source: ANB0VdZmtTBMI80cBfpAjOY/Xl5ATdoeVhp9/B8GiqHFKYk1tNTchHavOlYMP5LZA0VZj+Fy3bXLR7aKYIurPeDLJug=
X-Received: by 2002:a19:c5:: with SMTP id 188-v6mr9409305lfa.45.1535414362003; 
 Mon, 27 Aug 2018 16:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
 <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
In-Reply-To: <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
Reply-To: kunyi731@gmail.com
From: Kun Yi <kun.yi.731@gmail.com>
Date: Mon, 27 Aug 2018 16:58:45 -0700
Message-ID: <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
Subject: Re: RE: Proposal for caching/buffering POST codes list for one boot
 process.
To: ed.tanous@intel.com
Cc: chunhui.jia@linux.intel.com, venture@google.com, kuiying.wang@intel.com, 
 james.mihm@intel.com, hai.v.nguyen@intel.com, james.feist@intel.com, 
 chunhui.jia@intel.com, openbmc@lists.ozlabs.org, yong.b.li@intel.com, 
 cheng.c.yang@intel.com, bradleyb@fuzziesquirrel.com, qiang.xu@intel.com, 
 geissonator@yahoo.com, Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="000000000000a15caa05747383d2"
X-Mailman-Approved-At: Mon, 10 Sep 2018 10:12:07 +1000
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
X-List-Received-Date: Mon, 27 Aug 2018 23:59:28 -0000

--000000000000a15caa05747383d2
Content-Type: text/plain; charset="UTF-8"

Duh previous messages were filtered because of dots in my email address I
think..

On Mon, Aug 27, 2018 at 4:55 PM Kun Yi <kun.yi.731@gmail.com> wrote:

> Obvious another thing we would need to consider is performance. A host
> booting session could produce dozens or hundreds of POST codes depending on
> how verbose the BIOS is, and we should be careful not to design something
> that creates too much DBus traffic. These embedded processors are not
> performance beasts by any means.
>
> Kun
>
>
> On Mon, Aug 27, 2018 at 4:52 PM Kun Yi <kun.yi.731@gmail.com> wrote:
>
>> I think the choice of *where* to put such buffering warrants some
>> thoughts and design. Going through what I have thought:
>>
>> 1. It's possible to implement host state detection and host POST code
>> buffering all in a client daemon, which is a long-lived process that
>> - keeps listening to POST codes published
>> - keeps polling host state
>> - when host power state toggled, write the POST codes received to a file
>> on disk
>>
>> Pros of this approach is that server daemons are kept simple. POST code
>> server doesn't need to talk to host state daemon or even assume its
>> existence.
>> Pros of buffering on server side: potentially there will be more than one
>> identities needing the list of POST codes. IPMI? Logging? It would really
>> help if we can identify some concrete use cases.
>>
>> On Mon, Aug 27, 2018 at 8:47 AM Tanous, Ed <ed.tanous@intel.com> wrote:
>>
>>> > Could you confirm if the "/xyz/openbmc_project/host/post/1" that we
>>> talked here contains a list of post code for one cycle?
>>>
>>> Correct.  Each one would contain a list of POST codes for that boot.
>>>
>>> -Ed
>>>
>>

--000000000000a15caa05747383d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Duh previous messages were filtered because of dots in my =
email address I think..<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Aug 27, 2018 at 4:55 PM Kun Yi &lt;<a href=3D"mailto:kun.yi.731@gma=
il.com" target=3D"_blank">kun.yi.731@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr">Obvious another thing we would =
need to consider is performance. A host booting session could produce dozen=
s or hundreds of POST codes depending on how verbose the BIOS is, and we sh=
ould be careful not to design something that creates too much DBus traffic.=
 These embedded processors are not performance beasts by any means.<div><br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"m_-4046786451767381855m_50684=
28442101448562gmail_signature" data-smartmail=3D"gmail_signature">Kun</div>=
</div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mo=
n, Aug 27, 2018 at 4:52 PM Kun Yi &lt;<a href=3D"mailto:kun.yi.731@gmail.co=
m" target=3D"_blank">kun.yi.731@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr">I think the choice of *where* to put=
 such buffering warrants some thoughts and design. Going through what I hav=
e thought:<div><br></div><div>1. It&#39;s possible to implement host state =
detection and host POST code buffering all in a client daemon, which is a l=
ong-lived process that</div><div>- keeps listening to POST codes published<=
/div><div>- keeps polling host state</div><div>- when host power state togg=
led, write the POST codes received to a file on disk</div><div><br></div><d=
iv>Pros of this approach is that server daemons are kept simple. POST code =
server doesn&#39;t need to talk to host state daemon or even assume its exi=
stence.</div><div>Pros of buffering on server side: potentially there will =
be more than one identities needing the list of POST codes. IPMI? Logging? =
It would really help if we can identify some concrete use cases.</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 27, 2018 at 8:4=
7 AM Tanous, Ed &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank=
">ed.tanous@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">&gt; Could you confirm if the &quot;/xyz/openbmc_project/host/post/1&quot=
; that we talked here contains a list of post code for one cycle?=C2=A0<br>
<br>
Correct.=C2=A0 Each one would contain a list of POST codes for that boot.<b=
r>
<br>
-Ed<br>
</blockquote></div></div></div>
</blockquote></div>
</blockquote></div></div>

--000000000000a15caa05747383d2--
