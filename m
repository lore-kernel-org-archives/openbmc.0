Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6wG2WB7zDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 22:50:52 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 293AA1542A;
 Wed, 21 Aug 2019 08:50:47 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: witherspoon-pfault-analysis repository rename to phosphor-power
Message-Id: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
Date: Wed, 21 Aug 2019 08:50:46 -0400
Cc: Matt Spinler <mspinler@gmail.com>, Brandon Wyman <bjwyman@gmail.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 21 Aug 2019 12:50:55 -0000

Today the witherspoon-pfault-analysis repo has =E2=80=9Cwitherspoon centr=
ic=E2=80=9D =20
support for some power (as in power supply, not power processor) function=
s.

Going forward, IBM is planning on porting this code to several more of ou=
r =20
systems.  We also intend to add new features to it.  Some of our partners=
 =20
have expressed interest in working in this code base as well.

There is nothing inherently power processor arch specific or even server =
=20
specific about dealing with power.  So we=E2=80=99d welcome contributions=
 from any =20
collaborators from anywhere in the openbmc community.

Given the above and barring any objections, we=E2=80=99d like to rename t=
his repo =20
to phosphor-power and have it be a place to collaborate on any power =20
related functions.

thoughts/questions/concerns?

thx - brad
