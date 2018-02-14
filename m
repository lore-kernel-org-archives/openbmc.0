Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zh59G2YVlzF1Fn
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 14:53:21 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1518580396.11149.41.camel@fuzziesquirrel.com>
Subject: Upcoming project ownership changes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 13 Feb 2018 22:53:16 -0500
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 14 Feb 2018 03:53:22 -0000

OpenBMC community

During your travels you may have noticed that the OpenBMC brand is
somewhat fragmented.  There are several BMC firmware ecosystems out
there today, of which this project is just one.

For the past year, the leaders of these ecosystems have been hard at
work to bring all the projects together and move forward with a single
industry-wide OpenBMC.

I'm happy to report that these industry leaders have rallied around
your community as the meeting point.  Very soon it will get a lot more
busy around here.  

To this end, IBM will be ceding stewardship of this project to the
Linux Foundation in the very near future.  You can find the project
charter here:

https://docs.google.com/document/d/1uBbi5rDhWqj8Al-eoNLxERZ9OK8KVMZThOu
S08-cYto

In the longer term I'm optimistic all this means change, growth and
success for all of us.  In the shorter term, I don't anticipate any
major changes in the day to day of what we all do, with one exception. 
Under the new charter, contributors will be required to sign a
contributor license agreement.  There will be corporate (your company
signs once for all future contributions originating from your company)
and individual agreements available:

https://docs.google.com/document/d/1veiAjszrhgabA8XrJWjYCs7lyXIhs5rcXWg
aeuW-bT8
https://docs.google.com/document/d/1m61YH8GSzQpYVt5YG95fb2QNy1Gs--1-oLD
3znqPNQw

Please work with your legal team (if using the corporate CLA) or sign
the individual CLA now and send them to me to avoid any delays in your
development work flow when the transfer occurs.

-brad
