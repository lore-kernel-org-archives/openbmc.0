Return-Path: <benh@kernel.crashing.org>
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHKks6sx1zF0Tw
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 20:07:01 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w0B96Nqp024878;
 Thu, 11 Jan 2018 03:06:25 -0600
Message-ID: <1515661583.31850.34.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
 andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Date: Thu, 11 Jan 2018 20:06:23 +1100
In-Reply-To: <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.3 (3.26.3-1.fc27) 
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
X-List-Received-Date: Thu, 11 Jan 2018 09:07:02 -0000

On Tue, 2018-01-09 at 14:31 -0800, Jae Hyun Yoo wrote:
> +struct peci_rd_ia_msr_msg {
> +       unsigned char target;
> +       unsigned char thread_id;
> +       unsigned short address;
> +       unsigned long value;
> +};

Those types are representing messages on the wire ?

In that case those types aren't suitable. For example "long" will have
a different size and alignment for 32 and 64-bit userspace. There are
size-explicit userspace types available.

Also I didn't see any endianness annotations in there. Is that expected
? IE are those wire format packets ?

Cheers,
Ben.
