Return-Path: <andriy.shevchenko@intel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y7md6GGmzDqjp
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 07:28:32 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 12:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="245423821"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2019 12:28:20 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1if8ao-0005om-8s; Wed, 11 Dec 2019 22:28:18 +0200
Date: Wed, 11 Dec 2019 22:28:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 Robin Murphy <robin.murphy@arm.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v11 06/14] peci: Add Aspeed PECI adapter driver
Message-ID: <20191211202818.GD32742@smile.fi.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-7-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-7-jae.hyun.yoo@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:05 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2019 20:28:34 -0000

On Wed, Dec 11, 2019 at 11:46:16AM -0800, Jae Hyun Yoo wrote:
> This commit adds Aspeed PECI adapter driver for Aspeed
> AST24xx/25xx/26xx SoCs.

...

> +#define   ASPEED_PECI_CMD_IDLE_MASK		(ASPEED_PECI_CMD_STS_MASK | \
> +						 ASPEED_PECI_CMD_PIN_MON)

Better looking when the value completely occupies second line without touching
the first.

...

> +static int aspeed_peci_check_idle(struct aspeed_peci *priv)
> +{
> +	ulong timeout = jiffies + usecs_to_jiffies(ASPEED_PECI_IDLE_CHECK_TIMEOUT_USEC);
> +	u32 cmd_sts;

Like in the previous patch this one has hard to read timeout loops with inefficient code.

> +	for (;;) {
> +		cmd_sts = readl(priv->base + ASPEED_PECI_CMD);
> +		if (!(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK))
> +			break;

> +		if (time_after(jiffies, timeout)) {

This is actually main exit condition (vs. infinite loop).

> +			cmd_sts = readl(priv->base + ASPEED_PECI_CMD);

This make no sense. If you would like to have one more iteration, just spell it
explicitly.

> +			break;
> +		}

> +		usleep_range((ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC >> 2) + 1,
> +			     ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC);
> +	}
> +

> +	return !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK) ? 0 : -ETIMEDOUT;

Ditto.

> +}

Now look at the other variant:

	do {
		...do something...
		if (success)
			return 0;
		usleep(...);
	} while (time_before(...));

	return -ETIMEDOUT;

* Easy
* less LOCs
* guaranteed always to be at least one iteration
* has explicitly spelled exit condition

BUT!

In this very case you may do even better if you read iopoll.h, i.e
readl_poll_timeout() has this functionality embedded in the macro.

-- 
With Best Regards,
Andy Shevchenko
