Return-Path: <jayashankarpadath@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22f; helo=mail-qk0-x22f.google.com;
 envelope-from=jayashankarpadath@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ozDtHjqr"; 
 dkim-atps=neutral
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411v0K298czF34v
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 04:17:36 +1000 (AEST)
Received: by mail-qk0-x22f.google.com with SMTP id g14-v6so7165074qkm.6
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jun 2018 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DoQf4ViyHzNruyYHKsc2NR5G3mQcYE2FRUn1F/DphOY=;
 b=ozDtHjqrBD+EsUmsf4OwFibfw81A5skKYyhREJWcegoJBRUwZ1DzctrhcioNalZ13t
 lTjJh74EdEhp2DahvLbn1NoMfndjoLw2CvcpiRu65/itBuOJ9jSd/gar30/VEej6zAU9
 /H2ZA8Gj4BaKbKGZBtLTyABLNoqL6vpGwPYlOLN3FPBOit+HsFo5XZWZwXKaLTNh+bIO
 mv1r+BA0uys1PrFElHBR2eufzO6q/3Q8Gv8IZobr3ExWqY6Ze+jf5tbCxp7XIOM75/uU
 2Y+qTMdelPHLK8hwCEltJZNhk2Lc6Gewqxf+mO0BaGILZ7dvJz/ZDSlL7etSeK2sZPkl
 S4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DoQf4ViyHzNruyYHKsc2NR5G3mQcYE2FRUn1F/DphOY=;
 b=cj4RV8AQiMelRArFVYbnElhaZbYINqZkFKn3pobHjnadDQQYmBDtDw9GmMKGIFMD6Q
 aiBGT9xmEc3EF4JAZYaVo6FPiBalqwF1T959vBr8R43R1BhiDtvXae8ckoWZYvNljnNm
 hNA/ASMlvnHohh+S9mMswV2cv7mo8HyBTWH/Va0QGBVjr5/ILq2aeS8q5RJeQY+9DGYI
 fPbZBu64gTIy9VCnk7PATn1f9Y7ciSgklK1P3yOY93uHlt/viOaWy0oONtf9faib4t8N
 xXuwcSFfzHherMwzANf0hASAPTjF3157tBj3x24IWDaHMbMXAO7LeLYo6qcqFSkwLZqD
 BHgw==
X-Gm-Message-State: APt69E3BpKdb4WLZbV+vGUOU3eZzJLZoghn11uSyi+tPZeT9Cvv/JwKE
 cQFX4JWB1jo787xys+H3FJ4yT0ZhZL6GWXyYdII=
X-Google-Smtp-Source: ADUXVKJncN5Er1psPJ5BD+YyLtjcprvwOXrT2s5U2cC7CU2X2SEieq3QliExYXgWEdP45tZE1hYFmo9m8wbiA246+Jo=
X-Received: by 2002:a37:b684:: with SMTP id
 g126-v6mr2570231qkf.39.1528395453682; 
 Thu, 07 Jun 2018 11:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAH3CpToDn9eaKJpyg73VvEPj0Dxe9d9uxVXBEfHBQkCX_Rx4iQ@mail.gmail.com>
 <CADfYTpEGFx0D5DvtQgkqrvPZbXi9QSq7OYNAu8hySWXrJXGFVA@mail.gmail.com>
In-Reply-To: <CADfYTpEGFx0D5DvtQgkqrvPZbXi9QSq7OYNAu8hySWXrJXGFVA@mail.gmail.com>
From: Jayashankar Padath <jayashankarpadath@gmail.com>
Date: Thu, 7 Jun 2018 23:47:21 +0530
Message-ID: <CAH3CpTosmLue1Ov0v2SjPdir18zDe4EG3TjvXue=htLapY_rnw@mail.gmail.com>
Subject: Re: OpenBMC Fix-It
To: yuenn@google.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000017dade056e114c96"
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
X-List-Received-Date: Thu, 07 Jun 2018 18:17:38 -0000

--00000000000017dade056e114c96
Content-Type: text/plain; charset="UTF-8"

Sure thanks Nancy.

Best Regards,
jay

On Thu, Jun 7, 2018 at 11:24 PM Nancy Yuen <yuenn@google.com> wrote:

> Hi Jayashankar,
>
> That's great!  Check out fix it ideas on this spreadsheet
> <https://drive.google.com/open?id=1S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA>.
> Feel free to add other ideas there.  See the guidelines I posted here
> <https://lists.ozlabs.org/pipermail/openbmc/2018-June/011963.html>.
>
> ----------
> Nancy
>
> On Thu, Jun 7, 2018 at 9:22 AM, Jayashankar Padath <
> jayashankarpadath@gmail.com> wrote:
>
>> Hi Nancy,
>>
>> Please count me in.
>>
>> Thanks and Best Regards,
>> Jayashankar
>>
>> From:   Nancy Yuen <yuenn at google.com>
>> To:     OpenBMC Maillist <openbmc at lists.ozlabs.org>
>> Date:   05/09/2018 01:00 AM
>> Subject:        OpenBMC Fix-It
>> Sent by:        "openbmc"
>> <openbmc-bounces+ngorugan=in.ibm.com at lists.ozlabs.org>
>>
>>
>>
>> Please join my team for an OpenBMC  community "fix-it" event in June!
>>
>> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
>> part of a larger fix-it initiative. OpenBMC is a large part of our
>> project
>> so I'd like to spend part of the week on a fix-it on OpenBMC.
>>
>> I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set
>> up
>> an IRC channel for the fix it where everyone participating would hang out
>> for the day.  We could pick one or two areas to focus on for those days,
>> put together a list of things to "fix" in those areas ahead of time.  On
>> the day, we all tackle things on the list (or something not on the list),
>> discuss over IRC and do code reviews.  Inevitably, people have meetings
>> or
>> things they can't get out of, but if you can be available for most of the
>> day, that would be enough!
>>
>> Anyone interested in participating?
>>
>> ----------
>> Nancy
>>
>
>

--00000000000017dade056e114c96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure thanks Nancy.<div><br></div><div>Best Regards,</div><=
div>jay</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, =
Jun 7, 2018 at 11:24 PM Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com">=
yuenn@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr"><font size=3D"4">Hi Jayashankar,<br></font><div><font size=3D=
"4"><br></font></div><div><font size=3D"4">That&#39;s great!=C2=A0 Check ou=
t fix it ideas on this=C2=A0<a href=3D"https://drive.google.com/open?id=3D1=
S8h68UPVTh3Fc79P6Az-95JEFiGesTce3M--y0IDLaA" style=3D"color:rgb(17,85,204);=
background-color:rgb(255,255,255)" target=3D"_blank">spreadsheet</a>.=C2=A0=
 Feel free to add other ideas there.=C2=A0 See the guidelines I posted <a h=
ref=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-June/011963.html" ta=
rget=3D"_blank">here</a>.</font></div></div><div class=3D"gmail_extra"><br =
clear=3D"all"><div><div class=3D"m_2369236297489567692gmail_signature" data=
-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Thu, Jun 7, 2018 at 9:22 AM, Jayashankar =
Padath <span dir=3D"ltr">&lt;<a href=3D"mailto:jayashankarpadath@gmail.com"=
 target=3D"_blank">jayashankarpadath@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Nancy,</div><div><br><=
/div><div>Please count me in.</div><div><br></div><div>Thanks and Best Rega=
rds,</div><div>Jayashankar</div><div><br></div><div>From:=C2=A0 =C2=A0Nancy=
 Yuen &lt;yuenn at <a href=3D"http://google.com" target=3D"_blank">google.c=
om</a>&gt;</div><div>To:=C2=A0 =C2=A0 =C2=A0OpenBMC Maillist &lt;openbmc at=
 <a href=3D"http://lists.ozlabs.org" target=3D"_blank">lists.ozlabs.org</a>=
&gt;</div><div>Date:=C2=A0 =C2=A005/09/2018 01:00 AM</div><div>Subject:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 OpenBMC Fix-It</div><div>Sent by:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;openbmc&quot;=C2=A0</div><div>&lt;openbmc-bounces+ngorugan=
=3D<a href=3D"http://in.ibm.com" target=3D"_blank">in.ibm.com</a> at <a hre=
f=3D"http://lists.ozlabs.org" target=3D"_blank">lists.ozlabs.org</a>&gt;</d=
iv><div><br></div><div><br></div><div><br></div><div>Please join my team fo=
r an OpenBMC=C2=A0 community &quot;fix-it&quot; event in June!</div><div><b=
r></div><div>My team is devoting the week of 6/11/-15 to a Google OpenBMC &=
quot;fix it&quot; as=C2=A0</div><div>part of a larger fix-it initiative. Op=
enBMC is a large part of our project=C2=A0</div><div>so I&#39;d like to spe=
nd part of the week on a fix-it on OpenBMC.</div><div><br></div><div>I prop=
ose to have the fix it on Tues and Wed 6/12 &amp; 6/13.=C2=A0 We could set =
up=C2=A0</div><div>an IRC channel for the fix it where everyone participati=
ng would hang out=C2=A0</div><div>for the day.=C2=A0 We could pick one or t=
wo areas to focus on for those days,=C2=A0</div><div>put together a list of=
 things to &quot;fix&quot; in those areas ahead of time.=C2=A0 On=C2=A0</di=
v><div>the day, we all tackle things on the list (or something not on the l=
ist),=C2=A0</div><div>discuss over IRC and do code reviews.=C2=A0 Inevitabl=
y, people have meetings or=C2=A0</div><div>things they can&#39;t get out of=
, but if you can be available for most of the=C2=A0</div><div>day, that wou=
ld be enough!</div><div><br></div><div>Anyone interested in participating?<=
/div><div><br></div><div>----------</div><div>Nancy</div></div>
</blockquote></div><br></div>
</blockquote></div>

--00000000000017dade056e114c96--
