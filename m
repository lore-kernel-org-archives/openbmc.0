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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xQ4F4F5CzDqj4
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 12:20:44 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id DA4AA15288
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 22:20:40 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: openbmc repository restructuring
Message-Id: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
Date: Thu, 23 Aug 2018 22:20:40 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 24 Aug 2018 02:20:46 -0000

There is a pretty significant refactor of the openbmc repository going
through the pipe right now.

This has been discussed here:
https://gerrit.openbmc-project.xyz/#/q/topic:subtrees

and here:
https://lists.ozlabs.org/pipermail/openbmc/2018-August/012707.html

and here:
https://lists.ozlabs.org/pipermail/openbmc/2018-July/012558.html

You will likely have some impact to your bitbake development workflow;
you may have to rebase or resubmit your unmerged bitbake changes; and,
you might see odd Jenkins CI failures periodically.

Please bear with it for the next couple of days while this transition is
completed.  Feel free to find me on IRC if there are any questions.

I will follow up with another note when the transition is complete with
additional instructions.

thx - brad
