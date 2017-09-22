Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e0FcPN3x"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzHx246RMzDqjC
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 01:49:57 +1000 (AEST)
Received: by mail-qt0-x229.google.com with SMTP id o13so1478470qtf.1
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RNF8TDSFZCOtr5w0Wk1acW8D86XGQIbkSpet7yomyAk=;
 b=e0FcPN3x598iP8Rlp58ziO9bhU9lMfitU34uhLMcOeEGraceqi8lPQwN706R03Eamj
 cU5TafVKy4k4kTwRRgYCciuzuPidWijL1QrAMFmq5qlBl6tIQGT43dBWqEnVcx+vgb3J
 hh6+VuTzO8QKs8AAumOsTZ0D/ceFj0y6a4LA3awDBsEuG9ydhgWDIo7fi3mgXV8Musdn
 iuYm/3MBlzpld4rpBWuCf1Qv+h8SIy8Wzyp1okht6WlDYqcmZTcvSO3ZGt1JBAcBM3fE
 WEWy/VNtig7Xh+UBJ46e0Z1nbwsYrLlyGMhGU+363PpHX8aOwwF1+NoagWAQ7CAXSs3s
 8oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RNF8TDSFZCOtr5w0Wk1acW8D86XGQIbkSpet7yomyAk=;
 b=B9ue7dU7j1XT8XQUA/tCMGR2BAWuja5w5dejNXl/fjNqaoj32G3fIcrGMUT6TkZz9v
 gkO01kIv5mZndhqLszEEmqjwQuP3pQ+KEr52wGBu6oUlLBm99AL3b8w1AcmP9gUGhLik
 6R178yO7+uXMgk1sJ/GfqWMxpxN0eezlTVXZsVJ5dpGjrdNMzQL17OTgCV+WqZ57UPDt
 vXBVhjMk9bgk040ilHFP04JR0TwyffCbDO7EVb8ev2ipGqWt5spAMioj6SulQ1vd2XFI
 6Urgl1BQY23YKlz6x7jlcexFuVFLk00sWwyV3EndKFpLaS3sTRoOQCrBPWlfbJAvD4xM
 kGfg==
X-Gm-Message-State: AHPjjUj++2r7/vQVD8ljQg2Xm2asXbe8sFxfEzDqi7H1Hu+r4ivnKXNX
 UvvOJ1epzkQdvaZAHij4gqOiJDeZPqd/DhMIqztlKA==
X-Google-Smtp-Source: AOwi7QCcMwFd8zOuSwk4y6mBRd76kmoJOJQ0aIKXtTE3nAw/fA4qZxeFV8+9HI9DAKQUu/SCjlGgjxXv+HeERj6mc8A=
X-Received: by 10.200.42.251 with SMTP id c56mr9159176qta.152.1506095394735;
 Fri, 22 Sep 2017 08:49:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.178.89 with HTTP; Fri, 22 Sep 2017 08:49:54 -0700 (PDT)
From: Javier Romero <xavinux@gmail.com>
Date: Fri, 22 Sep 2017 12:49:54 -0300
Message-ID: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
Subject: Porting OpenBMC to Raspberry PI 3.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a114102fc004b620559c9293d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 15:49:59 -0000

--001a114102fc004b620559c9293d
Content-Type: text/plain; charset="UTF-8"

Hello,

Have a Raspberry PI 3 and seems that could be useful to port OpenBMC to
this device.

Suggestions on how to start working with this will be welcome.

Best Regards,





*Javier Romero*

*E-mail: xavinux@gmail.com <xavinux@gmail.com>*

*Skype: xavinux*

--001a114102fc004b620559c9293d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello,<br><br></div>Have a Raspberry PI 3 a=
nd seems that could be useful to port OpenBMC to this device.<br><br></div>=
Suggestions on how to start working with this will be welcome.<br><br></div=
>Best Regards,<br><br>=C2=A0<br><div><br><br clear=3D"all"><div><div><div><=
div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div style=3D"text-align:left"><i><b>Javier Romero<br></b></i><=
/div><div style=3D"text-align:left"><span style=3D"color:rgb(19,79,92)"><i>=
<b><span style=3D"color:rgb(0,0,0)">E-mail:<span style=3D"color:rgb(0,0,255=
)"> </span></span><span style=3D"color:rgb(0,0,255)"><a href=3D"mailto:xavi=
nux@gmail.com" target=3D"_blank">xavinux@gmail.com</a></span><br></b></i></=
span></div><div style=3D"text-align:left"><i><b><span style=3D"color:rgb(19=
,79,92)"><span style=3D"color:rgb(0,0,0)">Skype:</span> <span style=3D"colo=
r:rgb(11,83,148)"><u><span style=3D"color:rgb(0,0,255)">xavinux</span><br><=
/u></span></span></b></i></div><div style=3D"text-align:left"><br></div> </=
div></div></div>
</div></div></div></div></div>

--001a114102fc004b620559c9293d--
