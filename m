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
 by lists.ozlabs.org (Postfix) with ESMTPS id 439F9y4TTczDr3T
 for <openbmc@lists.ozlabs.org>; Thu,  6 Dec 2018 10:21:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <a9d87a51c3cc1d098ba8700a1310396503f155cc.camel@fuzziesquirrel.com>
Subject: [RFC] new repository for obmcutil chassiskill functionality
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 05 Dec 2018 18:22:03 -0500
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 05 Dec 2018 23:21:59 -0000

Hello everyone

You may have stumbled on the obmcutil script during your OpenBMC
travels.  If you care about it, read on.  If you are really short on
time, jump to the last sentence.

The script was originally written in python and if you've ever used it
you can attest to how slowly it starts up on a real BMC.  There is some
work happening to rewrite it in shell to speed things up some:

https://gerrit.openbmc-project.xyz/#/q/status:open+owner:%22Anthony+P.+Wilson+%253Cwilsonan%2540us.ibm.com%253E%22

Most of the function is quite simply convenience wrappers around
busctl.  That part of the port was straightforward.  However; for one
function - chassiskill, c or c++ makes a bit more sense.

The question is where to put this application?  OpenBMC now has both
openpower-power-control and x86-power-control repositories but this
function seems usable anywhere, so I hesitate to put it in one or the
other.  

So, I'm proposing a new repository - phosphor-power-control for arch
agnostic power control functions, starting with the chassiskill
function.

thx - brad
