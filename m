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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mqw16xd8zDqrN
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 13:13:52 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E4CD3129926;
 Thu,  9 Aug 2018 23:13:47 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: cmake support on gerrit.openbmc-project.xyz 
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <000201d4304e$fb11ff30$f135fd90$@linux.intel.com>
Date: Thu, 9 Aug 2018 23:13:47 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Jia, Chunhui" <chunhui.jia@intel.com>,
 "Wang, Kuiying" <kuiying.wang@intel.com>,
 "Mihm, James" <james.mihm@intel.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "Li, Yong B" <yong.b.li@intel.com>, james.feist@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <49DDAE6E-BEE6-4BC8-81B3-2DF2B2CD1032@fuzziesquirrel.com>
References: <000201d4304e$fb11ff30$f135fd90$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
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
X-List-Received-Date: Fri, 10 Aug 2018 03:13:54 -0000


> On Aug 9, 2018, at 10:08 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> Hi Brad,
> =20
> There are more and more projects are using cmake. I would like to know =
if we can enable the cmake support on the gerrit server?

I think James F. added cmake support already:

=
https://github.com/openbmc/openbmc-build-scripts/commit/878df5c3ff419cc662=
0eafde0263482d0424d803

> =20
> I am happy to provide support/help If there is anything needed
> Thanks,
> Yong
