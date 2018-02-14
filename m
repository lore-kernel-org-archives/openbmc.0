Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhMQY4lgxzF1Hg
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 01:35:48 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1518618944.11149.57.camel@fuzziesquirrel.com>
Subject: Re: contributor license agreement (CLA) (was: Upcoming project
 ownership changes)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: openbmc@lists.ozlabs.org
Date: Wed, 14 Feb 2018 09:35:44 -0500
In-Reply-To: <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
References: <1518580396.11149.41.camel@fuzziesquirrel.com>
 <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
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
X-List-Received-Date: Wed, 14 Feb 2018 14:35:50 -0000

On Wed, 2018-02-14 at 07:54 +0100, Paul Menzel wrote:
> Am 14.02.2018 um 04:53 schrieb Brad Bishop:
> 
> > Under the new charter, contributors will be required to sign a
> > contributor license agreement.  There will be corporate (your
> > company
> > signs once for all future contributions originating from your
> > company)
> > and individual agreements available:
> > 
> > https://docs.google.com/document/d/1veiAjszrhgabA8XrJWjYCs7lyXIhs5r
> > cXWgaeuW-bT8
> > https://docs.google.com/document/d/1m61YH8GSzQpYVt5YG95fb2QNy1Gs--1
> > -oLD3znqPNQw
> > 
> > Please work with your legal team (if using the corporate CLA) or
> > sign
> > the individual CLA now and send them to me to avoid any delays in
> > your
> > development work flow when the transfer occurs.
> 
> Could you please elaborate, why CLAs are needed? 

I am not a lawyer but my understanding is that it protects the users of
OpenBMC from a contribution to the project by a contributor that did
not have the necessary grants to make the submission in the first
place.  I found this page to provide a good layman's overview of the
benefits: http://oss-watch.ac.uk/resources/cla

> The Linux Kernel is 
> under the umbrella of the Linux Foundation, and no CLAs are needed 
> there. CLAs are a great burden, as the legal department gets
> involved, 

There are successful Linux Foundation projects that do have CLAs. 
While I can't argue that signing doesn't add any delays, use of the
corporate CLA will minimize this effort to a one-time-only cost and
lower the risk associated with using the project for our users.

> and should be avoided at all costs, as contributors want to advance 
> OpenBMC and not do paperwork.



> 
> 
> Kind regards,
> 
> Paul
