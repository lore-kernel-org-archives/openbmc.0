Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgWSr4vN1zF0rP
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 16:34:51 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9F81E6E229;
 Tue, 13 Feb 2018 00:28:00 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: New user validation
Message-Id: <6C861EF8-E980-4874-9C84-9B9EEE6B475E@fuzziesquirrel.com>
Date: Tue, 13 Feb 2018 00:28:00 -0500
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Feb 2018 05:34:53 -0000

Consider a DBus service for a moment that provides a user and group
management database (in the form of DBus objects).  Things like
usernames, group membership, etc.

Now consider an application using that service to create a new user.

Finally, consider a number of _other_ user facing applications
that need to abort the user creation process if some local validation
criteria fails.

Does anyone have any ideas on how a framework for doing such
validation might look?

For context: https://gerrit.openbmc-project.xyz/#/c/8440/

(Thank you Richard for pulling this together!)

thx - brad
