Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="gEL8ZD5r"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42q9hD5F2NzF2Hd
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 00:42:04 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E74D741860;
 Tue,  6 Nov 2018 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:user-agent:date:date
 :message-id:subject:subject:from:from:received:received
 :received; s=mta-01; t=1541511718; x=1543326119; bh=9iPGbbmi3pI2
 nl8PXeygAPuK3s7WIQF0rrDjz/vEv/4=; b=gEL8ZD5r/nQJHtGSIR+Tywm5uX4I
 7zg+GJ/reL5j5MQAzJevsiRzm2cHwhFdHsgiL7F0k70zEdoMwUMeZ3rUCKIYNFsG
 gGkuoEMI2S7kdizV495MfF7DRSA4/R1meWAIht8GyCMw4xcA+x5VmuHUA8F7/3Cn
 65ji46PJHoVg79Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4_V7zQXlgZb; Tue,  6 Nov 2018 16:41:58 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 89B9E41258;
 Tue,  6 Nov 2018 16:41:58 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 6 Nov
 2018 16:41:58 +0300
To: <openbmc@lists.ozlabs.org>
CC: Alexander Soldatov <a.soldatov@yadro.com>, Vishwanatha Subbanna
 <vishwa@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: LED colors in d-bus
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <db6eb8d5-5677-1356-1744-12cabf3911ed@yadro.com>
Date: Tue, 6 Nov 2018 16:41:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BP0VYrqgWnpz3IiTTvyX3V4sgJ6IkWeVB"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2018 13:42:05 -0000

--BP0VYrqgWnpz3IiTTvyX3V4sgJ6IkWeVB
Content-Type: multipart/mixed; boundary="gVYzW2B5bTCjSigae0jlpwPk2Xdu0cB61";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Cc: Alexander Soldatov <a.soldatov@yadro.com>,
 Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Message-ID: <db6eb8d5-5677-1356-1744-12cabf3911ed@yadro.com>
Subject: LED colors in d-bus

--gVYzW2B5bTCjSigae0jlpwPk2Xdu0cB61
Content-Type: multipart/alternative;
 boundary="------------C4457018BC90DF5557DD5903"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C4457018BC90DF5557DD5903
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all!

Since commit a1e70a7af by Vishwanatha Subbanna to phosphor-dbus-interface=
s (see https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-inter=
faces/+/1136/ ), there is a property 'Color' for leds.

However, it looks like nothing is setting that property for any of the su=
pported platforms. So any led always has it in d-bus set to Unknown.

It is unclear to us what was the intention for adding that property. It h=
as not been explained in the commit log for the commit. It is also unclea=
r what could be the correct way to set that property. phosphor-led-manage=
r operates on groups. A single led can be a part of multiple groups, so '=
led.yaml' in phosphor-led-manager looks like a wrong place to attach a co=
lor property to leds. Each leds used in led.yaml is called by the name ta=
ken from Linux devicetree. However, the bindings for leds in Linux device=
tree do not imply color information as well.

Are there any hints on how to set that property the right way? Can you im=
agine any real use cases for the color property? Maybe we should just dit=
ch it completely? It's been 2 years since it has been introduced and nobo=
dy seems to have cared...

Thanks.

Alexander.


--------------C4457018BC90DF5557DD5903
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi all!<br>
    </p>
    <p>Since commit a1e70a7af by <span><span role=3D"listitem"
          data-id=3D"1000014" title=3D"vishwa@linux.vnet.ibm.com Votable:=

          Code-Review, Verified, Ok-To-Test"
class=3D"com-google-gerrit-client-change-ChangeScreen_BinderImpl_GenCss_s=
tyle-label_user">Vishwanatha
          Subbanna</span></span> to phosphor-dbus-interfaces (see
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project=
=2Exyz/#/c/openbmc/phosphor-dbus-interfaces/+/1136/">https://gerrit.openb=
mc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/1136/</a>
      ), there is a property 'Color' for leds.</p>
    <p>However, it looks like nothing is setting that property for any
      of the supported platforms. So any led always has it in d-bus set
      to Unknown.</p>
    <p>It is unclear to us what was the intention for adding that
      property. It has not been explained in the commit log for the
      commit. It is also unclear what could be the correct way to set
      that property. phosphor-led-manager operates on groups. A single
      led can be a part of multiple groups, so 'led.yaml' in
      phosphor-led-manager looks like a wrong place to attach a color
      property to leds. Each leds used in led.yaml is called by the name
      taken from Linux devicetree. However, the bindings for leds in
      Linux devicetree do not imply color information as well.</p>
    <p>Are there any hints on how to set that property the right way?
      Can you imagine any real use cases for the color property? Maybe
      we should just ditch it completely? It's been 2 years since it has
      been introduced and nobody seems to have cared...<br>
    </p>
    <p>Thanks.</p>
    <p>Alexander.<br>
    </p>
  </body>
</html>

--------------C4457018BC90DF5557DD5903--

--gVYzW2B5bTCjSigae0jlpwPk2Xdu0cB61--

--BP0VYrqgWnpz3IiTTvyX3V4sgJ6IkWeVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb4ZolAAoJEOiTWHtbdBeNFo4P/1J+G8qYjyYsir2DujWriFUn
CKtb8dCGnH+KRJ6AMFF+oOGnbIiIBGhRFCzcpColq3TeMKJYgJgvEQ25fobR+L0Q
LNByFCu0BLPixD3IECg2NzJGv2z5f8idaDjNrpLljtZX2SKq4jD1zhjRdwFOzekz
QHhwa8yTJVoDVIJvNGbuHIhllNMqMOY6KIp4I22rKgDLeoS29KQPTPDETzkrljUc
ziHzklk4FdL5kufsnbi5ogjVbOCcG0VENRLV/SxGypWHw0Y5xAvFhW7qqSvCIriq
IN7hAkklBMw+t3TXx8K2CO+Q08m5daWyZOpAJVbxVEH0a46wcdd4oQHvByrLhe8Q
46x/Y5mqkhy8Z3034UBrXb6c4I06UOIOF5Sa4FWfEJTlPeQEHh8pu10mcJrh6Jsb
y6aky0pjfInnW8U4GPfB0121QiS4K9t29PGQDD0SllGlEmxlrAHHW9+tY44unwt3
QOVAMwlk8wrHRqBzT1WA69G/iSOTMorFy8/pyFpoSm/mKAfAztlUYcSNLJz1EhuM
7aXLzKbq0dJoiyTqrLAgd/v8Tvom/fkkaIpiVPPPLtbHD8uVpdUN2bVLLBrd7SAZ
nTaQSaoIiq9YoZRf3SwnUJj0BboMaxR0MZGqfjwBz5wIrnm+OKFuljLS4QwfAomC
r6oKyYWLaM6e2bfg2YfB
=t6j6
-----END PGP SIGNATURE-----

--BP0VYrqgWnpz3IiTTvyX3V4sgJ6IkWeVB--
