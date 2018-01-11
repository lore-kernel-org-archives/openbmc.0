Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzlE2J/q"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHfSR6pH7zF0cp
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 08:40:39 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id d23so2710453pfe.9
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KyME317qjV6SL6RYobFbaXMwaKjUKK8TfPbh0nOOavY=;
 b=dzlE2J/quuHoGUgLK8ikgnGKiMGiAFAizz5NXrXN4IMZTuZtPamQTAqqg97IHygNXX
 H4jSnDoL6zSKTLMEcCwSDHWdYAXIhmbEuIN9nbmHR7eCMgHyGWt9XXyE6rILLDm1DQGg
 jRCGfo//hO27N8tsouKbmkwRFCmVWUld34qKxKQXUIbIxlDIAkgE+eKxUCOxHKNTr8v+
 ftta8fQRqSTtMJepweGap4BSTaYIj/W56LKV37MJxDDebppTvcZ7EjqFxqK0hpoppAmS
 +JQL0oXQaplevoIIBlQFtyS3ShnvuTL3kk6tfrAVdwKEstC5Kh4GAxkJBpkdvSxzromE
 zqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KyME317qjV6SL6RYobFbaXMwaKjUKK8TfPbh0nOOavY=;
 b=EqwuSmCmWWcFqP+8GkBhsv7kWeXDna9gL20yTOfevTSCXVscgVNMwkbdIM5JMAyOhH
 LTKRFCrR+O+t2cE5QdUg6/0ziPTzwbt6HhNLT7zq6daza+QnOPx2Cd5J3NL2Hjpeevfu
 r3RWB0oHZ2R7Zo7/DWJh6GRaBp8XGuYhHBuITHesgmlhX27Tq3qeqUUxNp7q8pjM+79q
 17/V/VJZZP4bGt2Qi0XStWIgWjjO0Ydyf4vAycxnd8W4eseF2th1oAxm/zxYW1WPOoYs
 4MC94WFkv6c4EVPBUNml7ZGgdrVVb+Ndi35Z0b2JH0nMaiyREEdiMuO+dpNP4D/yRanO
 Iq9g==
X-Gm-Message-State: AKGB3mKFKRb/SK7TdAdYXHtcYXhkvNKxcSQqcE2MvQWWd9WRmiocC0Vo
 +fbZOzKUJ5unJA6M3tNs4Fc=
X-Google-Smtp-Source: ACJfBouNCljgsjwhyH24uOQPraqq+nthTJCml4aFTVyLzuiLo3Bd10WSIPEWBdERg3xAQzuHZBEWag==
X-Received: by 10.84.244.1 with SMTP id g1mr17816767pll.267.1515706837199;
 Thu, 11 Jan 2018 13:40:37 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id t75sm45068820pfi.146.2018.01.11.13.40.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jan 2018 13:40:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Jan 2018 13:40:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [linux, dev-4.10, 6/6] drivers/hwmon: Add a driver for a generic
 PECI hwmon
Message-ID: <20180111214035.GA14748@roeck-us.net>
References: <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <20180110214747.GA25248@roeck-us.net>
 <261ac28e-813c-a058-c81f-ad4e718d0233@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <261ac28e-813c-a058-c81f-ad4e718d0233@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 11 Jan 2018 21:40:40 -0000

On Thu, Jan 11, 2018 at 11:47:01AM -0800, Jae Hyun Yoo wrote:
> On 1/10/2018 1:47 PM, Guenter Roeck wrote:
> >On Tue, Jan 09, 2018 at 02:31:26PM -0800, Jae Hyun Yoo wrote:
> >>This commit adds driver implementation for a generic PECI hwmon.
> >>
> >>Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

[ ... ]

> >>+
> >>+	if (priv->temp.tcontrol.valid &&
> >>+	    time_before(jiffies, priv->temp.tcontrol.last_updated +
> >>+				 UPDATE_INTERVAL_MIN))
> >>+		return 0;
> >>+
> >
> >Is the delay necessary ? Otherwise I would suggest to drop it.
> >It adds a lot of complexity to the driver. Also, if the user polls
> >values more often, that is presumably on purpose.
> >
> 
> I was intended to reduce traffic on PECI bus because it's low speed single
> wired bus, and temperature values don't change frequently because the value
> is sampled and averaged in CPU itself. I'll keep this.
> 
Then please try to move the common code into a single function.

[ ... ]

> >>+
> >>+	rc = of_property_read_u32(np, "cpu-id", &priv->cpu_id);
> >
> >What entity determines cpu-id ?
> >
> 
> CPU ID numbering is determined by hardware SOCKET_ID strap pins. In this
> driver implementation, cpu-id is being used as CPU client indexing.
> 
Seems to me the necessary information to identify a given CPU should
be provided by the PECI core. Also, there are already "cpu" nodes
in devicetree which, if I recall correctly, may include information
such as CPU Ids.

> >>+	if (rc || priv->cpu_id >= CPU_ID_MAX) {
> >>+		dev_err(dev, "Invalid cpu-id configuration\n");
> >>+		return rc;
> >>+	}
> >>+
> >>+	rc = of_property_read_u32(np, "dimm-nums", &priv->dimm_nums);
> >
> >This is an odd devicetree attribute. Normally the number of DIMMs
> >is dynamic. Isn't there a means to get all that information dynamically
> >instead of having to set it through devicetree ? What if someone adds
> >or removes a DIMM ? Who updates the devicetree ?
> >
> 
> It means the number of DIMM slots each CPU has, doesn't mean the number of
> currently installed DIMM components. If a DIMM is inserted a slot, CPU
> reports its actual temperature but on empty slot, CPU reports 0 instead of
> reporting an error so it is the reason why this driver enumerates all DIMM
> slots' attribute.
> 
And there is no other means to get the number of DIMM slots per CPU ?
It just seems to be that this is the wrong location to provide such
information.

[ ... ]

> >>+
> >>+static const struct of_device_id peci_of_table[] = {
> >>+	{ .compatible = "peci-hwmon", },
> >
> >This does not look like a reference to some piece of hardware.
> >
> 
> This driver provides generic PECI hwmon function to which controller has
> PECI HW such as Aspeed or Nuvoton BMC chip so it's not dependant on a
> specific hardware. Should I remove this or any suggestion?
> 

I don't really know enough about the system to make a recommendation.
It seems to me that the PECI core should identify which functionality
it supports and instantiate the necessary driver(s). Maybe there should
be sub-nodes to the peci node with relevant information. Those sub-nodes
should specify the supported functionality in more detail, though -
such as indicating the supported CPU and/or DIMM sensors.

Guenter
