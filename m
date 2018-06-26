Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qhWOUKZ7"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FXVg2gPdzF1Gj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 03:05:40 +1000 (AEST)
Received: by mail-it0-x232.google.com with SMTP id 76-v6so3400818itx.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1xgYlRAz29cRyHkKVfzKQdDDGPKVGr/cwnPgHdfyGk=;
 b=qhWOUKZ7aHSh9G+HFlUlBLFkHn3Rwz6DoFgM/5AgKJ4OJqiu1lreCmgih5C1qR2fqS
 KVAmLoOb1donN1G9Wl23fZH0ylm6pQvT4T0q+jH2vc5vVvpxWsRqO8ZQUyKeaAU1PZzM
 acGaew2jRgYYbTqxamAOAQHz8rmnxS53gam1MuvR5/rU7K6lGLCo03l7KQ2SyaljZL/m
 mYnPoVMfw2X6d0Azu8DIKX0P9xeS+UbLJQGpuqlfUMjA98cceA7q6hIuV0MPdlfQKeIx
 NddvnETOAe4mZki294Jc9IN/fDbxeMXxCCDAzJVn76gnHxvC66woWiDS0QHEPqpFcplS
 ausA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1xgYlRAz29cRyHkKVfzKQdDDGPKVGr/cwnPgHdfyGk=;
 b=tHnlZprrO6UqafiMLQW23JcMMZZ7Iu1KnZJzlcmojXQ/Pmnk6zm1Zlp9iPQVsNPbSP
 qPZtbm3fy425Dw92c68L2Zlmzfao7EugqY9vdbeuPwFpnoaEE3teeQpD3GT4tORIYzCp
 VwJ69XcQxFy0Jv0Bj700kQyCAixfOoAi3dc6PgQvUmcAfg3Ip9s7o0ugVhJcEmayx+xA
 7uRx81LVdR+N/uXoU/+Mje29kNi9Qs2ZtOV4AcJFymSWW2KA1ehAHeJNsVXjMWeFkFXf
 JLPnkDtGYmV+gWT9O8G5u51cAQ687+avuHOaMA4+3sHm7L2TlHe8E80BefBgxf+k/3wM
 VwKA==
X-Gm-Message-State: APt69E1Q4MzBROT0Wtl1olVyt4DWQUI8X3wqwDCa7e3qxQHOqGNnHMeM
 LHBHdls3DVxTGnCSsShYydtnmYVsHRZmAHJo3qPsTg==
X-Google-Smtp-Source: ADUXVKLgJxfmPgrHfzRZr2rSQonqasoYAYqLelrHWyeafRFsuUOGzQGhhh1/dYEsr/KOJAoqajjVCT8D5gmCIbJFeIg=
X-Received: by 2002:a24:f007:: with SMTP id s7-v6mr2250903ith.15.1530032738153; 
 Tue, 26 Jun 2018 10:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
 <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
 <CAO=notwRGurPdnvSX_A+DVNudS8V0aSRwsiSqpECTes4FjFMUQ@mail.gmail.com>
 <CAG5OiwjErYOg6g=-L+N0V0d-je9jsDMedZdW40Ej-9vamkNA8A@mail.gmail.com>
In-Reply-To: <CAG5OiwjErYOg6g=-L+N0V0d-je9jsDMedZdW40Ej-9vamkNA8A@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 26 Jun 2018 10:05:11 -0700
Message-ID: <CAGMNF6V2UmW2MWLX_NUtz--gSYZtPeOkFW1fEOgeLYUBN32mQg@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: kurt.r.taylor@gmail.com
Cc: Patrick Venture <venture@google.com>, james.mihm@intel.com,
 gkeishin@in.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org, alirhas@microsoft.com, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000db276c056f8e8105"
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
X-List-Received-Date: Tue, 26 Jun 2018 17:05:48 -0000

--000000000000db276c056f8e8105
Content-Type: text/plain; charset="UTF-8"

I would like to attend on behalf of Google as well. My preference would be:

Thurs 3pm > Tues 2pm > Thurs 8am, but I can make them all.

Thanks,
Kun


On Tue, Jun 26, 2018 at 9:38 AM Kurt Taylor <kurt.r.taylor@gmail.com> wrote:

> On Mon, Jun 25, 2018 at 2:06 PM, Patrick Venture <venture@google.com>
> wrote:
>
>> So, lots of voting, I heard the first one is tomorrow.  Tomorrow at 2pm?
>>
>
> No, these were proposed times - the idea was to pick one that worked best
> for you.
>
>
>>
>> Patrick
>>
>>
> Kurt Taylor (krtaylor)
>

--000000000000db276c056f8e8105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would like to attend on behalf of Google as well. My pre=
ference would be:<div><br></div><div><span style=3D"background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">Thurs 3pm &gt; <span style=3D"text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">Tues 2pm &=
gt;=C2=A0</span>Thurs 8am, but I can make them all.</span></div><div><br></=
div><div>Thanks,</div><div>Kun<br style=3D"background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial"><br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Jun 26, 2018 at 9:38 =
AM Kurt Taylor &lt;<a href=3D"mailto:kurt.r.taylor@gmail.com">kurt.r.taylor=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">On Mon, Jun 25, 2018 at 2:06 PM, Patrick Venture <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@google=
.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">So, lots of voting, I heard the fir=
st one is tomorrow.=C2=A0 Tomorrow at 2pm?<br></blockquote><div><br></div><=
div>No, these were proposed times - the idea was to pick one that worked be=
st for you.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"m_-2108635844227468397HOEnZb"><font color=3D"#888888"><br>
Patrick<br>
</font></span><div class=3D"m_-2108635844227468397HOEnZb"><div class=3D"m_-=
2108635844227468397h5"><br></div></div></blockquote><div><br></div><div>Kur=
t Taylor (krtaylor)=C2=A0</div></div></div></div></blockquote></div></div>

--000000000000db276c056f8e8105--
