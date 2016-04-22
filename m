Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qsBvW6tBpzDq5k
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2016 09:40:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=hLcodKnN; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 38818236BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461368452;
 bh=IqrGKDA73tyF05j63CferLfPPUsR8WWzNAJ0U3O0xz4=;
 h=From:Subject:Date:To:From;
 b=hLcodKnNkOBFf1nA6LAiVsWU0PplXXnGOryDuYu8W5RJntp/r4wv41yDTVtyryh6W
 DjxLzHQ1H8z10KOkgHgJBuSb58gR2n5VRQkeQas749307i1htXwIocG8TQ1MB3MUcy
 ueTnuMkQlLB2CFNw0Pv22YhlHmpCcP61p9q8h0Qg=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 6003F23695
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 19:40:51 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: help getting ast2400 i2c busses 7-13 to work
Message-Id: <743F4413-5504-4274-A4F6-E32333DA8D89@fuzziesquirrel.com>
Date: Fri, 22 Apr 2016 19:40:51 -0400
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 22 Apr 2016 23:40:56 -0000

I=E2=80=99m on kernel bba98b65c8 (4.4-dev) - Mostly wondering if anyone =
is aware of this already (Joel)?

Not sure if its coincidence but this is right where the =E2=80=9Cbuffer =
pool=E2=80=9D space lands.  My system has busses 8-13 and I did enable =
them in ast2400.dtsi=E2=80=A6

-brad=
