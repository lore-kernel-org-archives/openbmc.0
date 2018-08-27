Return-Path: <kun.yi.731@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=kun.yi.731@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KStRLO+Q"; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zpcP3LYyzDqwt
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:53:22 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id m84-v6so566750lje.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 16:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AGafR+EpFHuvHyZCIuGO0zt49MXWO5j81bXLM7hXdb4=;
 b=KStRLO+Q/YUVejH+656mNbFS9O44rB/AhZzCehp/EHujtS8COBp6CNxlaZJQXqi4xA
 IoVk1VIHRw6bZqNo2x46TWro7B6LsC6uFTPxtmwsN7c7sLQr0ouSV+tI3OVBIVdLld+T
 JuTRil5gH529bKxC7/3UEQKVzuFf469FLOtc40nMeTZXhez/LbRGQ55B/BrlSItV+gyC
 nNhx5RjhQE3J6qhnJfBYH+KySf6zaeBVCtq6tkFk9j07+BPa5YoT8PiXo04j86PzaD4B
 HLgOMNfpHHgfBzAGPaH8nW9dtCUvxFScskLrTayn1Qd+3fMQwGT5EL0/Wq7QrU7w41rx
 CQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AGafR+EpFHuvHyZCIuGO0zt49MXWO5j81bXLM7hXdb4=;
 b=Yj5h2SdsKraGUox77Te1jffD3NXzFRYC69bJltHnbQyqmOM64myO7obItej6T9vI8N
 vdH7Aup+90JVhBYCkWXgBgAyPmK2OGGmLHQn8fXgWSLDg3kGGDP489Y9I1F71u3xT+wJ
 yzjIW9inLvX1ce6d3eqejOcE/NMaHmEbN+toqSSjbvEEgFDYuaVplLF/VEJKzgn0Vj+Z
 rSyluFZp1WCfjuqgpmroTzg6lkzk26JAdegvIidjlzQcDoN11om6fplrwlUSreKccnTm
 EosM8E7ccwRoJILeyLKDIyEslrCPb8Ma4VGCleJhOCg2PylQSXLu1HT28x9eje4SwJtO
 EEEA==
X-Gm-Message-State: APzg51ByTmIFDqcc6laWli45GSOpscqlxWa3Zt+w1l8pC3kaubLF5mxs
 GMAPbj4WkyeCZmgUXWnZkySd8OWBCeyHsdcPuPY=
X-Google-Smtp-Source: ANB0VdZE6xZ59fh1uXQ2GeIdxizo5Pl3G1I8asKa6MQx53IcaqOT3xevj66RrADlm+5IqbKh2L6GeHvCj9gUaQ2ta9I=
X-Received: by 2002:a2e:982:: with SMTP id 124-v6mr9574332ljj.24.1535413998295; 
 Mon, 27 Aug 2018 16:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
From: Kun Yi <kun.yi.731@gmail.com>
Date: Mon, 27 Aug 2018 16:52:41 -0700
Message-ID: <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
Subject: Re: RE: Proposal for caching/buffering POST codes list for one boot
 process.
To: ed.tanous@intel.com
Cc: chunhui.jia@linux.intel.com, venture@google.com, kuiying.wang@intel.com, 
 james.mihm@intel.com, hai.v.nguyen@intel.com, james.feist@intel.com, 
 chunhui.jia@intel.com, openbmc@lists.ozlabs.org, yong.b.li@intel.com, 
 cheng.c.yang@intel.com, bradleyb@fuzziesquirrel.com, qiang.xu@intel.com, 
 geissonator@yahoo.com, Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="000000000000f3a4b10574736d9e"
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
X-List-Received-Date: Mon, 27 Aug 2018 23:53:26 -0000

--000000000000f3a4b10574736d9e
Content-Type: text/plain; charset="UTF-8"

I think the choice of *where* to put such buffering warrants some thoughts
and design. Going through what I have thought:

1. It's possible to implement host state detection and host POST code
buffering all in a client daemon, which is a long-lived process that
- keeps listening to POST codes published
- keeps polling host state
- when host power state toggled, write the POST codes received to a file on
disk

Pros of this approach is that server daemons are kept simple. POST code
server doesn't need to talk to host state daemon or even assume its
existence.
Pros of buffering on server side: potentially there will be more than one
identities needing the list of POST codes. IPMI? Logging? It would really
help if we can identify some concrete use cases.

On Mon, Aug 27, 2018 at 8:47 AM Tanous, Ed <ed.tanous@intel.com> wrote:

> > Could you confirm if the "/xyz/openbmc_project/host/post/1" that we
> talked here contains a list of post code for one cycle?
>
> Correct.  Each one would contain a list of POST codes for that boot.
>
> -Ed
>

--000000000000f3a4b10574736d9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think the choice of *where* to put such buffering warran=
ts some thoughts and design. Going through what I have thought:<div><br></d=
iv><div>1. It&#39;s possible to implement host state detection and host POS=
T code buffering all in a client daemon, which is a long-lived process that=
</div><div>- keeps listening to POST codes published</div><div>- keeps poll=
ing host state</div><div>- when host power state toggled, write the POST co=
des received to a file on disk</div><div><br></div><div>Pros of this approa=
ch is that server daemons are kept simple. POST code server doesn&#39;t nee=
d to talk to host state daemon or even assume its existence.</div><div>Pros=
 of buffering on server side: potentially there will be more than one ident=
ities needing the list of POST codes. IPMI? Logging? It would really help i=
f we can identify some concrete use cases.</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Mon, Aug 27, 2018 at 8:47 AM Tanous, Ed &lt;<a=
 href=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">&gt; Could you confirm if the &quot;/x=
yz/openbmc_project/host/post/1&quot; that we talked here contains a list of=
 post code for one cycle?=C2=A0<br>
<br>
Correct.=C2=A0 Each one would contain a list of POST codes for that boot.<b=
r>
<br>
-Ed<br>
</blockquote></div></div></div>

--000000000000f3a4b10574736d9e--
