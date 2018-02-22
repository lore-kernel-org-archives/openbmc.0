Return-Path: <andrew@lunn.ch>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="zLjSbd+e"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmwSL5KdtzF0d1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 11:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=kiMGOIPGWWr68BNAvR7Mq34VCt2OkZo3EsFWRY27ocs=; 
 b=zLjSbd+ezg0+KiBcXvolyc7RlUbcvKPLk0eOiTk+hbLZjfpCY2xYId/Af7UZxs8iuhj9bk2W2/p6vxe9VqzEoVva/U8fQ8lebceQ/rd+Fbv5WkfMYxHzU4b6EXQ2UCbujfPh7crnu9gwJX/dKRH7/QsjwTcEa7Nc4b+OphlvXTw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1eoesy-0003g7-7l; Thu, 22 Feb 2018 01:37:20 +0100
Date: Thu, 22 Feb 2018 01:37:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, joel@jms.id.au, andrew@aj.id.au,
 arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
Message-ID: <20180222003720.GA25250@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 22 Feb 2018 00:38:11 -0000

> But even with this change, it still needs to use delayed creation
> because BMC side kernel doesn't know how many DIMMs are populated on
> a remote server before the remote server completes its memory
> training and testing in BIOS, but it needs to check the remote
> server's CPU temperature as immediate as possible to make
> appropriate thermal control based on the remote CPU's temperature to
> avoid any critical thermal issue. What would be a better solution in
> this case?

You could change this driver so that it supports one DIMM.  Move the
'hotplug' part into another driver which creates and destroys
instances of the hwmon DIMM device as the DIMMS come and go.

Also, do you need to handle CPU hotplug? You could split the CPU
temperature part into a separate hwmon driver? And again create and
destroy devices as CPUs come and go?

	Andrew
