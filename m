Return-Path: <sacnaik@gmail.com>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com
 [IPv6:2607:f8b0:400c:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcTdT1zr4zDrJQ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 11:01:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eCetAEBz"; 
 dkim-atps=neutral
Received: by mail-vk0-x232.google.com with SMTP id s199so1021491vke.1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ojNULfQrvUcSNLIiYHZr0w02+vs07oxXroprfNyE6B4=;
 b=eCetAEBz7vH3Wj760E7Tdkol+QLpvoOT+bT+u/lKwXoBCSHMP8xIFkecQmDKghi10F
 z6TFVX2VGumg1mPL4oi2LmXH287ZpgWCdynjPmtOs5hZVa61AonMiVxlGhSHigbDT0n0
 dfgkX6s+qQNFUJs0WRsfzsaoBPTozTjCo1YwO3dF+ylDcUjPUyV0A1QMPfsfIoN1x4iI
 9q4lJw9Z9D4JwHjOxhwyIJW8Re8RHAEJ+Eq9IfI+VPRTTRmGjFBJgu0xpMARyJdcuWmc
 wWp2GEGSBDSvlwLmHSgMlnfQoaSOysG2VHR33anrHEaPlkl4RC37WN9LWtsBHEJhArH9
 Z3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ojNULfQrvUcSNLIiYHZr0w02+vs07oxXroprfNyE6B4=;
 b=ZsU3gX6TPrUhfoik1Jim+SWgdtWOwupbxdKKFmO8Ddz5tzZD3W1URNYiJEiGiBJh9v
 3bmM0DoD7Wj1YeAKDSwfOqnwE8HOlo1FpyxxlEeBNLXoBfE84PN7ftD3HXy4o6UIQoGm
 myWgmd0b/zmLzZam7/asCBU/CkiK+yokWriAp2nKiy2Cit+4PzcUipTWk39me4i0SPE5
 Xr4oOX1n7HWobax5kasW9Nk+82rMkJWl86KM92GiLkYqYVtlPiT8hrwKR0SbAPwvvyfz
 e+wLljP7i9hzEhlynNNlqTNUXrl9LtgvpcSQxNTrkNWkQc22Tvp62hvpjnd2zLEcnCIk
 quxA==
X-Gm-Message-State: AHYfb5j0Ra58DiU+/OrOPi5Dr7AYq6Dps+EsB9kwzBUUzSlETTPSYUiN
 p6xB4Yr4SftqCX2+/j6bYze4+QOQZs1ayp8=
X-Received: by 10.31.171.21 with SMTP id u21mr609212vke.153.1503450074686;
 Tue, 22 Aug 2017 18:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.28.30 with HTTP; Tue, 22 Aug 2017 18:01:14 -0700 (PDT)
From: sachin naik <sacnaik@gmail.com>
Date: Tue, 22 Aug 2017 18:01:14 -0700
Message-ID: <CALFfRJNnOwgdKt9GixopVhk_6nMZQJB==_RjwosyUcoYNg8K-g@mail.gmail.com>
Subject: Regarding oe-core2.4
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a11438934a3ade60557613f71"
X-Mailman-Approved-At: Wed, 23 Aug 2017 20:59:14 +1000
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
X-List-Received-Date: Wed, 23 Aug 2017 01:01:18 -0000

--001a11438934a3ade60557613f71
Content-Type: text/plain; charset="UTF-8"

I see that oe-core 2.4 is coming on 2017 October.


Is there anything planned taking openBMC to oe-core 2.4. If Yes I would be
more interested to know the dates?

Thanks and regards
Sachin

--001a11438934a3ade60557613f71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(51,51,51);font-family:Verdana,San=
s,sans-serif;font-size:medium">I see that oe-core 2.4 is coming on 2017=C2=
=A0</span><font color=3D"#333333" face=3D"Verdana, Sans, sans-serif" size=
=3D"3">October.=C2=A0</font><div><font color=3D"#333333" face=3D"Verdana, S=
ans, sans-serif" size=3D"3"><br></font><div><br></div><div><font color=3D"#=
333333" face=3D"Verdana, Sans, sans-serif" size=3D"3">Is there anything pla=
nned taking openBMC to oe-core 2.4. If Yes I would be more interested to kn=
ow the dates?</font></div><div><font color=3D"#333333" face=3D"Verdana, San=
s, sans-serif" size=3D"3"><br></font></div><div><font color=3D"#333333" fac=
e=3D"Verdana, Sans, sans-serif" size=3D"3">Thanks and regards</font></div><=
div><font color=3D"#333333" face=3D"Verdana, Sans, sans-serif" size=3D"3">S=
achin</font></div></div></div>

--001a11438934a3ade60557613f71--
