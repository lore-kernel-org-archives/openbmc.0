Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8qBB3pfJzDq99
 for <openbmc@lists.ozlabs.org>; Sat, 22 Apr 2017 07:48:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="0ezP6CqL";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0SzrBByfGQVTFLoG877+8p1TAu/GNgGqItXwYD/Mx2M=; b=0ezP6CqLSQcxv4nRzJ92hrphuU
 Df4C5eGUH0WTEgyUtGtTNJ5iUM4YT4DEAJPJw/BIc6cFKrRU7vqVYC9npEm33akQmMNMro7dWdkPr
 /gpASa+0Yc1wI4oDCnFE2VLtZCF+zo05Yv0MsOM03o4VuA2THt1T1/aotZfPHgjC13VbTi803+8Ww
 Ahlb8AO/6pP6TgAPMQaQWDvz3Kvs95iUzMmfmetehAQmlPtABOD/VQOr7WW4is61a6ouZMY90hvVK
 Lura6jVlpdxr57QvS6utZAQKlucXWWjc3f3aqJ6e6Dvlxy/3RtK3RdLM/5372aQYHFbS8yv0EaAyc
 OJOOh/TA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:36230 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.87) (envelope-from <linux@roeck-us.net>)
 id 1d1gQ2-0017TI-1q; Fri, 21 Apr 2017 21:48:46 +0000
Date: Fri, 21 Apr 2017 14:48:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-hwmon@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
Message-ID: <20170421214845.GA29008@roeck-us.net>
References: <20170421042505.20403-1-sam@mendozajonas.com>
 <20170421205523.5jqqroooeqmfzl36@asimov>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170421205523.5jqqroooeqmfzl36@asimov>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Fri, 21 Apr 2017 21:48:51 -0000

On Fri, Apr 21, 2017 at 03:55:23PM -0500, Patrick Williams wrote:
> Sam,
> 
> On Fri, Apr 21, 2017 at 02:25:05PM +1000, Samuel Mendoza-Jonas wrote:
> > IR35221 is a Digital DC-DC Multiphase Converter
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > - Tested on a ppc64 system which includes several of these devices.
> > - This patch re-implements the linear reg2data/data2reg functions from
> >   pmbus-core like some other drivers in order to scale some results. Is
> >   this something that would be better off being made generic for pmbus
> >   drivers to call?
> > - The resolution of iout0 is apparently configurable between two values,
> >   however the documentation I have access to does not specify how this is
> >   actually configured - currently it is left at the default resolution in
> >   the driver.
> > 
> >  Documentation/hwmon/ir35221   |  87 ++++++++++++
> >  drivers/hwmon/pmbus/Kconfig   |  11 ++
> >  drivers/hwmon/pmbus/Makefile  |   1 +
> >  drivers/hwmon/pmbus/ir35221.c | 322 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 421 insertions(+)
> >  create mode 100644 Documentation/hwmon/ir35221
> >  create mode 100644 drivers/hwmon/pmbus/ir35221.c
> 
> Thanks for working on this.
> 
> Would it be possible to enhance it in a follow up to support an
> 'inN_target' also?  I see this is not documented by the sysfs-interface
> for hwmon but we likely need support for this.  There are voltage
> slewing operations we do in system manufacturing.  Without an hwmon
> interface for programming the target voltage we're going to have to
> unbind the device and manually do the i2c operations.
> 
> 
> Guenter,
> 
> I mention 'inN_target' to match 'fanN_target'.  Do you have
> any opposition to either formally adding that as an option for voltage
> readings or adding it to this specific driver?
> 

Please keep in mind that this is a hardware monitoring driver.
Are you looking for regulator functionality ? If so, it might make sense
to improve regulator support (ie support more than enable/disable
when registering with the regulator subsystem) in the pmbus infrastructure.

[ You don't have to unbind the driver to access the i2c interface directly.
  If this is for manufacturing only, you can also access the i2c interface
  directly using I2C_SLAVE_FORCE. ]

Thanks,
Guenter
