Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLR3x65ynzDqfh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 06:17:16 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BCCB96DC96;
 Mon, 23 Oct 2017 15:17:12 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: PECI API?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
Date: Mon, 23 Oct 2017 15:17:12 -0400
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1867030-9315-44DA-9F91-2FFD8369C8BC@fuzziesquirrel.com>
References: <2971e0b7-6339-35f6-b0e3-1901020ed46a@elsoft.ch>
To: =?utf-8?B?IkRhdmlkIE3DvGxsZXIgKEVMU09GVCBBRyki?= <d.mueller@elsoft.ch>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Mon, 23 Oct 2017 19:17:18 -0000


> On Oct 21, 2017, at 4:57 AM, David M=C3=BCller (ELSOFT AG) =
<d.mueller@elsoft.ch> wrote:
>=20
> Hello
>=20
> Is anyone working on an API definition for PECI?
>=20
>=20
> Dave

Full disclosure - the Wikipedia article is the extent of my
background on PECI.

Rather than a PECI API, would it make any sense to define a
an abstract concept API, where one implementation of it has a
PECI backend?

My cursory glance at the Wikipedia article suggests PECI provides
temperature readings (I=E2=80=99m sure it does much more) but the basic
thought process I=E2=80=99ve outlined would allow control applications
or metric gathering applications, etc to be re-used irrespective
of where the data is coming from.

-brad=
