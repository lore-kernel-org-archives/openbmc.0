Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whsjv0jxzzDqRd
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 23:20:02 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v56DJnuL025994
 for <openbmc@lists.ozlabs.org>; Tue, 6 Jun 2017 08:19:53 -0500
Message-ID: <1496755188.31588.21.camel@kernel.crashing.org>
Subject: [RFC] USB gadget driver for AST2x00 vHub
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Date: Tue, 06 Jun 2017 23:19:48 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jun 2017 13:20:03 -0000

Hi !

So I've been writing a new UDC gadget driver for the vHub from scratch.

It's still a work in progress as I haven't yet implement the "hub"
functionality yet, so it's a single device UDC driver at the moment.

There are also various improvements that need to be done, but overall
it's functional enough to give me about 200Mbit/sec off hdparm -tf of a
mass storage fed off a tmpfs file.

I'll be working on it more sporadically during the next few weeks, I
plan to have the virtual hub functionality going at some point and
might look into further performance improvements, but it's in a state
where some reviews/feedback could come in handy if anybody feels like
having a look.

So for the curious, look here:

  https://github.com/ozbenh/linux-ast/commits/bmc

This is also to make sure nobody else is duplicating the work.

(This contains *no* code from any of the existing implementations I've
seen floating around, which have some serious issues anyway, and not
just coding style related :-) This was written from scratch from a
blank slate, using other upstream UDC drivers as guides).

Cheers,
Ben.
