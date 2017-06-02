Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfNMV1V4YzDqLC
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 22:10:29 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v52C4oES023555;
 Fri, 2 Jun 2017 07:04:51 -0500
Message-ID: <1496405090.2842.5.camel@kernel.crashing.org>
Subject: Re: [PATCH v9 5/5] i2c: aspeed: added slave support for Aspeed I2C
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Fri, 02 Jun 2017 22:04:50 +1000
In-Reply-To: <20170602084603.30811-6-brendanhiggins@google.com>
References: <20170602084603.30811-1-brendanhiggins@google.com>
 <20170602084603.30811-6-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 02 Jun 2017 12:10:30 -0000

On Fri, 2017-06-02 at 01:46 -0700, Brendan Higgins wrote:
> Added slave support for Aspeed I2C controller. Supports fourteen busses
> present in AST24XX and AST25XX BMC SoCs by Aspeed.

(Not an issue for merging)

Have you looked at a "mode" by which you implement just enough of the
slave support to decode smbus notifications ?

This looks like it could be useful when using pmbus devices, as some of
them use smbus notifications fairly often.

Today only one driver calls i2c_handle_smbus_host_notify() (the Intel
one of course).

Cheers,
Ben.
