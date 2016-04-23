Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qsGt96VFGzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2016 12:40:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=Xv9lVmVg; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 8772923484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461379198;
 bh=yjwJy10dpzdhf1OhVNZKgKY9e1vvvtatErI+Im+0W9A=;
 h=From:Subject:Date:References:To:From;
 b=Xv9lVmVgKSuhP4LBr1JMZ3OM3mnJ1+OtEf0ogG6qL7jogUu08UO07hgZVsEXdzOcj
 caRTxM1z6VojjgpwR7QIwyERib7GpI00iu8WGJPYTVcAYMXS4ToV5D6ihQp0xRorGS
 YLjUhx93XOeUxMP+9rAi8f8UgL1LU0EhZ+S2kuHc=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id AE6FD2345F
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 22:39:57 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Fwd: help getting ast2400 i2c busses 7-13 to work
Date: Fri, 22 Apr 2016 22:39:57 -0400
References: <743F4413-5504-4274-A4F6-E32333DA8D89@fuzziesquirrel.com>
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
Message-Id: <28037416-9A0B-4299-B77D-46B4F40500CB@fuzziesquirrel.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Apr 2016 02:40:03 -0000

fyi - it was the multifunction pins not being configured.

> Begin forwarded message:
>=20
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Subject: help getting ast2400 i2c busses 7-13 to work
> Date: April 22, 2016 at 7:40:51 PM EDT
> To: OpenBMC Patches <openbmc@lists.ozlabs.org>
>=20
> I=E2=80=99m on kernel bba98b65c8 (4.4-dev) - Mostly wondering if =
anyone is aware of this already (Joel)?
>=20
> Not sure if its coincidence but this is right where the =E2=80=9Cbuffer =
pool=E2=80=9D space lands.  My system has busses 8-13 and I did enable =
them in ast2400.dtsi=E2=80=A6
>=20
> -brad
