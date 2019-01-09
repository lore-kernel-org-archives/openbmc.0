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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Zjrv1LH1zDqbY
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 09:06:38 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [IPv6:::1] (kronos.fuzziesquirrel.com [192.168.252.1])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BD7BD433
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 17:06:34 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: 2.6.0.rc1 tag
Message-Id: <578A7632-10A8-444B-90A3-96077507B424@fuzziesquirrel.com>
Date: Wed, 9 Jan 2019 17:06:33 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3445.102.3)
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
X-List-Received-Date: Wed, 09 Jan 2019 22:06:39 -0000

Hi everyone

The first release candidate tag for 2.6 has been pushed.

I don=E2=80=99t plan on tagging any meta subtrees until release next =
month.  However; if
anyone can think of a reason why that would be useful please let me =
know.

Please find problems and then fix them.  Happy testing!

-brad=
