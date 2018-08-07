Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lDV55CZszDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 22:34:20 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BCD1313AFB4;
 Tue,  7 Aug 2018 08:34:09 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Need create a repo for chassis implementation.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249DE8512@SHSMSX101.ccr.corp.intel.com>
Date: Tue, 7 Aug 2018 08:34:09 -0400
Cc: "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>,
 "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yong.b.li@linux.intel.com" <yong.b.li@linux.intel.com>,
 "Li, Yong B" <yong.b.li@intel.com>,
 "openbmc-ci-admin@ozlabs.org" <openbmc-ci-admin@ozlabs.org>,
 "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>, 
 "Mihm, James" <james.mihm@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84A1C7CA-5072-4D0A-BC25-9EB8717E5AC5@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
 <1532513696.11932.8.camel@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
 <9F1ED42F-FCC2-4536-8019-15019BD8D01D@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DE8512@SHSMSX101.ccr.corp.intel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Tue, 07 Aug 2018 12:34:22 -0000


> On Aug 6, 2018, at 9:41 PM, Wang, Kuiying <kuiying.wang@intel.com> =
wrote:
>=20
> Hi Brad,
> Thanks a lot for your support.
> 1. I have already written this program on OpenBMC and verified it on =
X86 platform WFP.=20
> 2. No need for specify Dbus API for x86-power-control, all the APIs =
are common.
>=20
> BTW:
> Can you add me or other Intel member into the maintainer list for =
these two repos?

Please add a MAINTAINERS file in one of your patches and I=E2=80=99ll
add those individuals to the necessary groups.

>=20
>=20
> Thanks,
> Kuiying.
