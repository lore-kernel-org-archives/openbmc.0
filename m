Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40V3FZ3GgSzF1xc
 for <openbmc@lists.ozlabs.org>; Mon, 23 Apr 2018 20:52:33 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 51072C7D;
 Mon, 23 Apr 2018 10:52:30 +0000 (UTC)
Date: Mon, 23 Apr 2018 12:52:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
Message-ID: <20180423105224.GA1444@kroah.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
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
X-List-Received-Date: Mon, 23 Apr 2018 10:52:34 -0000

On Tue, Apr 10, 2018 at 11:32:05AM -0700, Jae Hyun Yoo wrote:
> +static void peci_adapter_dev_release(struct device *dev)
> +{
> +	/* do nothing */
> +}

As per the in-kernel documentation, I am now allowed to make fun of you.

You are trying to "out smart" the kernel by getting rid of a warning
message that was explicitly put there for you to do something.  To think
that by just providing an "empty" function you are somehow fulfilling
the API requirement is quite bold, don't you think?

This has to be fixed.  I didn't put that warning in there for no good
reason.  Please go read the documentation again...

greg k-h
