Return-Path: <venture@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6KRh4MtMzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 06:21:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I4RuAFHk"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id g2so76598338pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y0YSUj8dFNhQ//gQIPyiYzHE5LjssoAhXj5UL5DgOcU=;
 b=I4RuAFHkYT0wORy4vW/kjxrcTZw1/iMfVoc+VOqBQ1eI0+6XbjbryTSqSpuEMIoufF
 Z2fJleHRJM4kqsGgvuXt2AIH63SC8qOyOtRrygdSSDYMmjdoih/I+ZDdBe0VSUD5v/Ua
 3My80eA69DEkAPRWKwBjJ21gaQ/qfJnY9lM/XyUkqp6l0z+uO+nGJswVNxkgGG4E3VXM
 8AT2DYDlxt8aRX3iwYGaJWCVGYwe58uSTVNAd6fM0C4gV8c9sD1InSK5XBvUNVt8Put+
 UKf1vmxamqS4hPJ5B6kI5ivrChT9bLBSRsMwNhcXpEfNSKRgEv4uMTII/xjR9jQBrmrP
 2GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y0YSUj8dFNhQ//gQIPyiYzHE5LjssoAhXj5UL5DgOcU=;
 b=XkYxl4Lu0qucoRsGvT/hpAWJgKAmpj4+cHt39cAxEKjfoMHp/pF6k/hdbb9Qq2Y9QE
 LEuh89xHeydW1kk83mzac8+DVmPQbAjkmgqAstut1MG3ug54lHc0g5SsUrkCVFR1AlJJ
 JbRVgpF474c7wEcrnMtTPuXqJlgXSazgDdeAMYEpaFl68Q5259JE/CwoPXmBwlpguRst
 U6V0+R3XTsYyhKt78zOUK+N8Xmt2AqhphKHKZuZFNsbFXyyihkkDrouEr+ClbI/Ngw7K
 Wh0XLqVYJ/lVv+Jmi4vUrk9R4zIPi0G4kMqtLp/7K2tzdigIQr1GSPTyU3sdnlIJZ8Tj
 aALg==
X-Gm-Message-State: AN3rC/47Bk8oRMxYtlgGRIvixr6z8s9tGoq85793IV/6DDhXYSfCmLZ3
 LPzLFvJ7m3crYFrEOrIW2OhiqU2m3zJP6mk=
X-Received: by 10.98.72.88 with SMTP id v85mr13973439pfa.8.1492460509915; Mon,
 17 Apr 2017 13:21:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Mon, 17 Apr 2017 13:21:29 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Apr 2017 13:21:29 -0700
Message-ID: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
Subject: thermald for OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1149a7b0896013054d628a09
X-Mailman-Approved-At: Tue, 18 Apr 2017 07:49:40 +1000
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
X-List-Received-Date: Mon, 17 Apr 2017 20:21:53 -0000

--001a1149a7b0896013054d628a09
Content-Type: text/plain; charset=UTF-8

I'm working on a thermal control loop that'll operate within the openbmc
framework(s) and wanted to provide a somewhat high level overview for
thoughts.

The general design is to have a daemon that reads fans and temperatures
from dbus (reaching out to phosphor-hwmon) as well as being able to receive
temperatures and other sensor information over an OEM IPMI command.

The system will support zones defined (yes, probably in YAML).  A zone will
have at least one exclusion fan, and at least one thermal sensor.  The
thermal sensor can be shared.  There will be defaults provided in this
configuration to act as fallbacks.

The thermal loop will be margin based and attempt to drive the fans to
maintain the temperature within operating temperature of the zones.  Each
zone will be independently managed.

Because not all thermal sensors can necessarily be ready by the BMC, we
need a method of getting that information from the host.  From a previous
project, we have the notion of sending thermal margins for slow and quick
(heat change) devices to a controller.

Regards,
Patrick

--001a1149a7b0896013054d628a09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m working on a thermal control loop that&#39;ll oper=
ate within the openbmc framework(s) and wanted to provide a somewhat high l=
evel overview for thoughts.<div><br></div><div>The general design is to hav=
e a daemon that reads fans and temperatures from dbus (reaching out to phos=
phor-hwmon) as well as being able to receive temperatures and other sensor =
information over an OEM IPMI command.<br></div><div><br></div><div>The syst=
em will support zones defined (yes, probably in YAML).=C2=A0 A zone will ha=
ve at least one exclusion fan, and at least one thermal sensor.=C2=A0 The t=
hermal sensor can be shared.=C2=A0 There will be defaults provided in this =
configuration to act as fallbacks.</div><div><br></div><div>The thermal loo=
p will be margin based and attempt to drive the fans to maintain the temper=
ature within operating temperature of the zones.=C2=A0 Each zone will be in=
dependently managed.</div><div><br></div><div>Because not all thermal senso=
rs can necessarily be ready by the BMC, we need a method of getting that in=
formation from the host.=C2=A0 From a previous project, we have the notion =
of sending thermal margins for slow and quick (heat change) devices to a co=
ntroller.</div><div><br></div><div>Regards,</div><div>Patrick</div></div>

--001a1149a7b0896013054d628a09--
