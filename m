Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym01F1TKHzDrTw
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 08:14:40 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1511817272.13581.27.camel@fuzziesquirrel.com>
Subject: RFC: multiple system configurations in a single image
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 27 Nov 2017 16:14:32 -0500
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 21:14:41 -0000

A new use-case for OpenBMC I'm excited to support is multiple system
configurations in a single image.

First, a recap of the current state of affairs.

No support exists in-tree for this use case today.  At the moment  
OpenBMC applications are data-driven using in-memory structures (via
generated source code).  This is the yaml->python->mako pattern you
might be familiar with.

Obviously this pattern alone does not enable multiple configurations to
be supported in a single image so a fundamental change is required.

One proposal that has been made (out in Gerrit) is to replace the YAML
with JSON and parse it on the BMC.

I'll outline what I think the good/not-so-good of this approach are, as
compared to some other yet-to-be-invented idea for achieving the same
thing.

good:
  - low complexity
  - removal of python dependency from application build

not-so-good:
  - complexity shift from build to runtime (parsing, validation)
  - loss of implementation freedom of choice (adopting the proposed
solution _requires_ json parsing on _all_ platforms using reference
applications, even platforms using single configuration images)

I'd like to hear about any of the following:

- alternative ways to support multiple configurations in a single image
- items missing from the pro/con list above
- thoughts on whether or not the cons listed have any meaningful impact

thx - brad
