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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40GbK30z0FzF1pC
 for <openbmc@lists.ozlabs.org>; Thu,  5 Apr 2018 05:15:50 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5E97C1527D;
 Wed,  4 Apr 2018 15:15:45 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Maintainers and the CLA
Message-Id: <C664861D-B057-42CD-ADF1-B493E5324C79@fuzziesquirrel.com>
Date: Wed, 4 Apr 2018 15:15:45 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
To: geissonator@yahoo.com, gkeishin@in.ibm.com, joel@jms.id.au,
 swanman@us.ibm.com, ed.tanous@intel.com, vernon.mauery@linux.intel.com,
 jk@ozlabs.org, andrew@aj.id.au, gmills@us.ibm.com, spinler@us.ibm.com,
 emilyshaffer@google.com, tomjoseph@in.ibm.com, anoo@linux.vnet.ibm.com,
 dkodihal@in.ibm.com, msbarth@linux.ibm.com, venture@google.com,
 "guptam.qdt" <guptam.qdt@qualcommdatacenter.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2018 19:15:51 -0000

If you are in the to: list you have code-review +2 authority
on one or more OpenBMC project repositories (i.e. you are a
project maintainer).

If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t know =
what
projects you maintain, please reply and we will get that fixed
up.

As you probably all know by now, the OpenBMC project has moved
to The Linux Foundation and under the new project charter
contributors must execute one of the OpenBMC CLAs.

I=E2=80=99ve put together a guide:

https://gerrit.openbmc-project.xyz/#/c/9933/

(please review it and provide feedback like anything else)
to help you ensure you are complying to the conditions
outlined in the charter, until such a time that we can have
a more automated verification process.

-brad=
