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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hymH4n2RzF2DY
 for <openbmc@lists.ozlabs.org>; Sat,  4 Aug 2018 06:08:47 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 862A415662;
 Fri,  3 Aug 2018 16:08:12 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Need create a repo for chassis implementation.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
Date: Fri, 3 Aug 2018 16:08:12 -0400
Cc: "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>,
 "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yong.b.li@linux.intel.com" <yong.b.li@linux.intel.com>,
 "Li, Yong B" <yong.b.li@intel.com>,
 "openbmc-ci-admin@ozlabs.org" <openbmc-ci-admin@ozlabs.org>,
 "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F1ED42F-FCC2-4536-8019-15019BD8D01D@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
 <1532513696.11932.8.camel@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249DD8381@SHSMSX101.ccr.corp.intel.com>
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
X-List-Received-Date: Fri, 03 Aug 2018 20:08:48 -0000


> On Jul 25, 2018, at 10:33 PM, Wang, Kuiying <kuiying.wang@intel.com> =
wrote:
>=20
> Hi Andrew,
> I agree w/ you on " smaller, more specific repositories", to create " =
phosphor-buttons" for handling buttons and create different repo for =
power control for specific machine/company/hardware like =
"openpower-power-control" and " x86-power-control".
>=20
> In a word, we need create 3 repos as following:
> phosphor-buttons

created.

> openpower-power-control

I don=E2=80=99t know enough about the design to create this repository =
yet.
I=E2=80=99m assuming that is OK with Intel?

> x86-power-control =20

created.  I apologize for the delay, but there is a general lack of
information here that makes me uncomfortable, and thus the delay.

For instance - is there a DBus API associated with this program?
If so - what is it?  Have you already written this program and
now you just want to host it on OpenBMC?  Or is it a new program?

>=20
> Brad,
> I will not send pictures and attachments to the mail list in the =
future.

thanks!

>=20
> Thanks,
> Kuiying.
