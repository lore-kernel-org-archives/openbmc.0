Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vFT9f4XQjzDqBm
 for <openbmc@lists.ozlabs.org>; Sat,  4 Feb 2017 07:34:14 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v13KXkSp008424;
 Fri, 3 Feb 2017 14:33:49 -0600
Message-ID: <1486154026.4850.58.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 1/3] drivers/fsi: Add slave interrupt polling
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: eajames <eajames@linux.vnet.ibm.com>, Alistair Popple
 <alistair@popple.id.au>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>, Eddie James <eajames@us.ibm.com>
Date: Sat, 04 Feb 2017 07:33:46 +1100
In-Reply-To: <0c659ead9fa7a83478ae3c1c9648838a@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486077964-11346-7-git-send-email-eajames@linux.vnet.ibm.com>
 <2483723.1jBtLvfriP@new-mexico>
 <0c659ead9fa7a83478ae3c1c9648838a@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 03 Feb 2017 20:34:15 -0000

On Fri, 2017-02-03 at 10:18 -0600, eajames wrote:
> The problem here is that there is no hardware irq. FSI is using GPIO 
> lines to access slave registers. The only indication that we have an 
> interrupt is a bit set in the "slave interrupt status register". So
> we 
> have to poll that register and handle the results. I'm not aware of
> any 
> way to turn that into a kernel irq and use the existing kernel 
> framework. But if it can be done, agreed, we should implement that!

The existing kernel i2c framework doesn't require IRQs.

You can poll, which sucks, but you can. With delays of course.

Also, if you know your i2c bit freq, you can always use a timer.

Cheers,
Ben.
