Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418J983dnvzDrcd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 14:32:28 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5I4W8f3011014;
 Sun, 17 Jun 2018 23:32:09 -0500
Message-ID: <d9a3bd9cf5ebad8633ee9f29db97d34e73fbbb89.camel@kernel.crashing.org>
Subject: Re: [PATCH 0/5] FSI warning fixes
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Eddie James
 <eajames@linux.vnet.ibm.com>
Date: Mon, 18 Jun 2018 14:32:08 +1000
In-Reply-To: <20180618034335.9732-1-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
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
X-List-Received-Date: Mon, 18 Jun 2018 04:32:29 -0000

On Mon, 2018-06-18 at 13:13 +0930, Joel Stanley wrote:
> Hi Eddie and Ben,
> 
> I've fixed a bunch of printf warnings (that only occur when the kernel
> is being built for a 64 bit machine) and sparse warnings.
> 
> Where appropraite please fold these fixes into your work in progress
> code.
> 
> (This is with the work in progress 4.17 tree, which contains all of the
> posted fixes, plus a mega-patch that I created with all of the OCC HWMON
> work).

So those:

>   fsi: sbefifo: Fix sparse warnings
>   fsi: master-hub: Fix sparse warnings
>   fsi: core: Fix sparse warnings

Fix stuff that is either already upstream or already in a tagged pull
request. I'll add those 3 fixes on top of them in k.org for my next
pull request to Greg.

Cheers,
Ben.
