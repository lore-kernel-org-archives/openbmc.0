Return-Path: <marc.zyngier@arm.com>
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wjRGX0w8DzDqKY
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 21:31:47 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A342C2B;
 Wed,  7 Jun 2017 04:31:41 -0700 (PDT)
Received: from [10.1.207.16] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 08D943F587; Wed,  7 Jun 2017 04:31:38 -0700 (PDT)
Subject: Re: [PATCH v10 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru,
 clg@kaod.org, benh@kernel.crashing.org, ryan_chen@aspeedtech.com
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-2-brendanhiggins@google.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <0862f162-646c-a9a3-a79e-313abf86b339@arm.com>
Date: Wed, 7 Jun 2017 12:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170603012952.2192-2-brendanhiggins@google.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Wed, 07 Jun 2017 11:31:48 -0000

On 03/06/17 02:29, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C Interrupt
> Controller.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Acked-by: Rob Herring <robh@kernel.org>

I've queued this (and the next patch) for 4.13.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
