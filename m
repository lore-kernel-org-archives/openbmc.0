Return-Path: <jayashankarpadath@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22a; helo=mail-qk0-x22a.google.com;
 envelope-from=jayashankarpadath@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrqEB8TF"; 
 dkim-atps=neutral
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411rRN4gMxzDrYb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 02:22:21 +1000 (AEST)
Received: by mail-qk0-x22a.google.com with SMTP id j80-v6so6907561qke.9
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jun 2018 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gQ7gUT4GelK05Tx+1GEuT+OQBbXxg683iIKXBtNXWks=;
 b=FrqEB8TFAoq64VCpUaW0rgcuVwadB6VBja1AVOUX9Vzi7A2eftvUieVvNVleJfRxB4
 qYuTCPEizy9EyxrWzyKyokD0nPXtNMdZARCcEqgGk0M0I9o5zPYIANluY/mS08R9MUiO
 g8fKeFJqj0gjUp7kh70HO4o3NkXIO0oBpjCxYaqJeZyz0cG5QPKTGP7pTS8BWdTT8xAR
 +IuTEjBVWU64cEQcP9Xn+vwtWd1jvzs4+5zr4FHh58B/pYhRSgwCx5h1gwWy7k5/QQ7D
 CEw3ox9Lq6BOYR+7Fur558FSv+7tDP3h2BQ/KhxHFiftD9+nejwliXrNZjjZLjgS6StY
 DbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gQ7gUT4GelK05Tx+1GEuT+OQBbXxg683iIKXBtNXWks=;
 b=r3bKAFAzE7q2SYuOVOwN7rdQXTOjLSEWIJcw0xEZr1ejI685iSzGJhsDs4uwszkZOE
 u+2IbtSbzHq+QPyPRr0nt5nxB2ggl/WEFIixXIXUo0sVeXUDrOmxppX0ZAgAVbM0Nm93
 7dr7kWxi5AB5+JXstgLX7YX1qNv7UP/Tj1lQ7WjJjcU4zxOfWHRs+RKVLF56Mg1Djqzu
 8y9texgGksIp6paydw+acwrqP/Kqvxy9t0yeG/q55h4NZhFGXzjhfENZzLiW9T0R4VKf
 rgvQr4QCdPwp3t9GQWXjZud3PM0Or09eBSixBcebRNpm7kM7fz1R5g37yk7E+zsn3ExA
 R/ug==
X-Gm-Message-State: APt69E2xMsifvQhk5EMeCphDNFvqCZWVU6mM/WFC7gWAPngPPtnAT0Aa
 FdyG1k7jNxfNwE9mP8YKi21AybZZg/qU4B6Ml1c=
X-Google-Smtp-Source: ADUXVKJsjN4Mb96CHf+ZmhXsSyhWQIoCOoEfgYQ/ukWnmk+3h2VQeIvtFz2vJRHtrXKgsRvhMlKiPiWajsELV6MP69w=
X-Received: by 2002:a37:bf06:: with SMTP id
 p6-v6mr2002296qkf.143.1528388538823; 
 Thu, 07 Jun 2018 09:22:18 -0700 (PDT)
MIME-Version: 1.0
From: Jayashankar Padath <jayashankarpadath@gmail.com>
Date: Thu, 7 Jun 2018 21:52:07 +0530
Message-ID: <CAH3CpToDn9eaKJpyg73VvEPj0Dxe9d9uxVXBEfHBQkCX_Rx4iQ@mail.gmail.com>
Subject: OpenBMC Fix-It
To: yuenn@google.com, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ef77d8056e0faf1c"
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
X-List-Received-Date: Thu, 07 Jun 2018 16:22:25 -0000

--000000000000ef77d8056e0faf1c
Content-Type: text/plain; charset="UTF-8"

Hi Nancy,

Please count me in.

Thanks and Best Regards,
Jayashankar

From:   Nancy Yuen <yuenn at google.com>
To:     OpenBMC Maillist <openbmc at lists.ozlabs.org>
Date:   05/09/2018 01:00 AM
Subject:        OpenBMC Fix-It
Sent by:        "openbmc"
<openbmc-bounces+ngorugan=in.ibm.com at lists.ozlabs.org>



Please join my team for an OpenBMC  community "fix-it" event in June!

My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
part of a larger fix-it initiative. OpenBMC is a large part of our project
so I'd like to spend part of the week on a fix-it on OpenBMC.

I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up
an IRC channel for the fix it where everyone participating would hang out
for the day.  We could pick one or two areas to focus on for those days,
put together a list of things to "fix" in those areas ahead of time.  On
the day, we all tackle things on the list (or something not on the list),
discuss over IRC and do code reviews.  Inevitably, people have meetings or
things they can't get out of, but if you can be available for most of the
day, that would be enough!

Anyone interested in participating?

----------
Nancy

--000000000000ef77d8056e0faf1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Nancy,</div><div><br></div><div>Please count me in=
.</div><div><br></div><div>Thanks and Best Regards,</div><div>Jayashankar</=
div><div><br></div><div>From:=C2=A0 =C2=A0Nancy Yuen &lt;yuenn at <a href=
=3D"http://google.com">google.com</a>&gt;</div><div>To:=C2=A0 =C2=A0 =C2=A0=
OpenBMC Maillist &lt;openbmc at <a href=3D"http://lists.ozlabs.org">lists.o=
zlabs.org</a>&gt;</div><div>Date:=C2=A0 =C2=A005/09/2018 01:00 AM</div><div=
>Subject:=C2=A0 =C2=A0 =C2=A0 =C2=A0 OpenBMC Fix-It</div><div>Sent by:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;openbmc&quot;=C2=A0</div><div>&lt;openbmc-bo=
unces+ngorugan=3D<a href=3D"http://in.ibm.com">in.ibm.com</a> at <a href=3D=
"http://lists.ozlabs.org">lists.ozlabs.org</a>&gt;</div><div><br></div><div=
><br></div><div><br></div><div>Please join my team for an OpenBMC=C2=A0 com=
munity &quot;fix-it&quot; event in June!</div><div><br></div><div>My team i=
s devoting the week of 6/11/-15 to a Google OpenBMC &quot;fix it&quot; as=
=C2=A0</div><div>part of a larger fix-it initiative. OpenBMC is a large par=
t of our project=C2=A0</div><div>so I&#39;d like to spend part of the week =
on a fix-it on OpenBMC.</div><div><br></div><div>I propose to have the fix =
it on Tues and Wed 6/12 &amp; 6/13.=C2=A0 We could set up=C2=A0</div><div>a=
n IRC channel for the fix it where everyone participating would hang out=C2=
=A0</div><div>for the day.=C2=A0 We could pick one or two areas to focus on=
 for those days,=C2=A0</div><div>put together a list of things to &quot;fix=
&quot; in those areas ahead of time.=C2=A0 On=C2=A0</div><div>the day, we a=
ll tackle things on the list (or something not on the list),=C2=A0</div><di=
v>discuss over IRC and do code reviews.=C2=A0 Inevitably, people have meeti=
ngs or=C2=A0</div><div>things they can&#39;t get out of, but if you can be =
available for most of the=C2=A0</div><div>day, that would be enough!</div><=
div><br></div><div>Anyone interested in participating?</div><div><br></div>=
<div>----------</div><div>Nancy</div></div>

--000000000000ef77d8056e0faf1c--
