Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QU6PgPgU"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PqD16nbfzDrRS
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 14:36:49 +1000 (AEST)
Received: by mail-qk0-x22b.google.com with SMTP id d22-v6so10895366qkc.8
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jul 2018 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YAnl6w5d4cwpnAhxEw9UfBeYJ1KPG/5XdVvw7zE4QKU=;
 b=QU6PgPgUIg5AdlA0zEwREolTMbkBqJ+dYW9CiCmWjTdiPKqAa8m3PytOYnvB/WT7YE
 X7zW6OSHczSCUAC7oXIbzGOaZrT8J6pzSbG5jNuSBbACcZm81sE4IhcuIf3twMUZNucV
 bZUTG5K77WsfQxBUYRWLB6NMHCD/JhTEY1uL7NXuZ0TDPYU0ZRAkggPwETjqQ0fJylDQ
 yatVYS9ya3IR93RvjcdJWS1DxLZaaGKekYK6kLAeY+w+k1L/r8fRgTmNj2P4d1Av7H+y
 L47Gr21wqbhCyXETWr2qQ0s1erqSABvbfcRD+STZI8BmZAyG8SK3ZmyFbuVpFkiDMdkX
 ULvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YAnl6w5d4cwpnAhxEw9UfBeYJ1KPG/5XdVvw7zE4QKU=;
 b=W/M2T3J0GJMGmMD5NjydViTDdxj6nVBNgN/m0Ks7nxHUE1DNo944unDkdeWnP1Nsl4
 LqN7Tng1ClFBTRBRoSy7SDD+g3qsGSFqel/daEFo4qS0gUi5MDRMEHXzOF9Ie5tjuodq
 m9kA0DEmN53LqV/Ck2axAOhXC1c7mFHGhuzayuz/FDj1675IzI2k8wUQ1GWs9WzVUtEj
 79OWkkUm2lDq8YZ5Zay/k1/txJI0aYnM8pzKtCMSURnUPIXKNulvQKumDKlTukAhpYRn
 3cHLCVP60bqiDbrw+gt919i+/itMRD5TnbMWMJPkp0dHJOwWUNM3OOAcFZNOAJaZ3Qeg
 R6uQ==
X-Gm-Message-State: APt69E3hqgbn+9hfMyOiyYdwNyB43GR7z+mzMtVz6on2T1FTUedFgJ8T
 mDLx5L6Rw96KvlBO7wwINqsWXsArp1P/x8RTUtUguA==
X-Google-Smtp-Source: AAOMgpdgYEmsT+APxxQXpXYyyXgOvi+6JAc/7FiZFuZKU6eNtdPjwaLzFSSZMpzIaHPyHX2BZuI1r3bHUiSUOuWf1Sg=
X-Received: by 2002:a37:ba02:: with SMTP id
 k2-v6mr20684098qkf.134.1531197406725; 
 Mon, 09 Jul 2018 21:36:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Mon, 9 Jul 2018 21:36:46 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 10 Jul 2018 12:36:46 +0800
Message-ID: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
Subject: Re: IPMI and Redfish support in openbmc Linux
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@ntel.com
Content-Type: multipart/alternative; boundary="000000000000824a5805709dadd9"
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
X-List-Received-Date: Tue, 10 Jul 2018 04:36:51 -0000

--000000000000824a5805709dadd9
Content-Type: text/plain; charset="UTF-8"

H Ed,
I built bmcweb into my machine, and check the 'bmcweb' daemon was started
up.

ps aux | grep bmcweb
  919 root       0:00 /usr/bin/bmcweb
 8662 root       0:00 grep bmcweb

But I couldn't access Redfish API through the below command.
curl -b cjar -k https://10.99.241.79/redvish/v1/

Could you help provide the suggestion?

Thanks.
-Henbin.

There are several servers that support Redfish, and we have a working group
> that meets weekly to talk through technical issues each week, which you're
> welcome to attend. The only one checked into the upstream project is
> bmcweb. If you need help getting it started, I'm happy to help.
> https://github.com/openbmc/bmcweb

--000000000000824a5805709dadd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">H Ed,<div>I built bmcweb into my machine, and check the &#=
39;bmcweb&#39; daemon was started up.</div><div><br></div><div><div>ps aux =
| grep bmcweb</div><div>=C2=A0 919 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 /usr=
/bin/bmcweb</div><div>=C2=A08662 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 grep b=
mcweb</div></div><div><br></div><div>But I couldn&#39;t access Redfish API =
through the below command.</div><div>curl -b cjar -k <a href=3D"https://10.=
99.241.79/redvish/v1/">https://10.99.241.79/redvish/v1/</a><br></div><div><=
br></div><div>Could you help provide the suggestion?</div><div><br></div><d=
iv>Thanks.</div><div>-Henbin.</div><div><div><br></div><div>

<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote">There are several servers=
 that support Redfish, and we have a working group that meets weekly to tal=
k through technical issues each week, which you&#39;re welcome to attend.  =
The only one checked into the upstream project is bmcweb.  If you need help=
 getting it started, I&#39;m happy to help.<br><a href=3D"https://github.co=
m/openbmc/bmcweb">https://github.com/openbmc/bmcweb</a></blockquote>

<br></div></div></div>

--000000000000824a5805709dadd9--
