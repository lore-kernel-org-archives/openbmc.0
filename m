Return-Path: <SRS0=YqHN=OP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EA3C433F5
	for <openbmc@archiver.kernel.org>; Sat, 25 Sep 2021 22:32:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D876261051
	for <openbmc@archiver.kernel.org>; Sat, 25 Sep 2021 22:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D876261051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HH3Yp1h13z2yP7
	for <openbmc@archiver.kernel.org>; Sun, 26 Sep 2021 08:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 461 seconds by postgrey-1.36 at boromir;
 Sun, 26 Sep 2021 08:32:03 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HH3YH5mYFz2yHX
 for <openbmc@lists.ozlabs.org>; Sun, 26 Sep 2021 08:32:02 +1000 (AEST)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 761BAC795D
 for <openbmc@lists.ozlabs.org>; Sat, 25 Sep 2021 22:24:43 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6CA23200003;
 Sat, 25 Sep 2021 22:24:13 +0000 (UTC)
Date: Sun, 26 Sep 2021 00:24:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: Re: [PATCH 1/2] rtc: pch-rtc: add RTC driver for Intel Series PCH
Message-ID: <YU+hjdO880BPJanO@piout.net>
References: <20210814225242.GY15173@home.paul.comp>
 <20210820123410.46539-1-fr0st61te@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210820123410.46539-1-fr0st61te@gmail.com>
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
Cc: fercerpav@gmail.com, a.zummo@towertech.it, openbmc@lists.ozlabs.org,
 i.mikhaylov@yadro.com, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 20/08/2021 15:34:10+0300, Ivan Mikhaylov wrote:
> On Tue, Aug 15, 2021 at 01:52:42PM +0300, Paul Fertser wrote:
> > On Tue, Aug 10, 2021 at 06:44:35PM +0300, Ivan Mikhaylov wrote:
> > > +config RTC_DRV_PCH
> > > +	tristate "PCH RTC driver"
> > > +	help
> > > +	  If you say yes here you get support for the Intel Series PCH
> >
> > I'm afraid this is really lacking some specification of devices that
> > are supported. Is it really everything that Intel currently calls PCH?
> 
> Yes, from infromation that I know.
> 
> > > +static int pch_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct pch *pch = i2c_get_clientdata(client);
> > > +	unsigned char rtc_data[NUM_TIME_REGS] = {0};
> > > +	int rc;
> > > +
> > > +	rc = regmap_bulk_read(pch->regmap, PCH_REG_SC, rtc_data, NUM_TIME_REGS);
> > > +	if (rc < 0) {
> > > +		dev_err(dev, "fail to read time reg(%d)\n", rc);
> > > +		return rc;
> > > +	}
> >
> > Citing 26.7.2.3 from C620 (Lewisburg/Purley) datasheet:
> > 
> > "The PCH SMBus slave interface only supports Byte Read operation. The
> > external SMBus master will read the RTC time bytes one after
> > another. It is software’s responsibility to check and manage the
> > possible time rollover when subsequent time bytes are read.
> > 
> > For example, assuming the RTC time is 11 hours: 59 minutes: 59
> > seconds. When the external SMBus master reads the hour as 11, then
> > proceeds to read the minute, it is possible that the rollover happens
> > between the reads and the minute is read as 0. This results in 11
> > hours: 0 minutes instead of the correct time of 12 hours: 0 minutes.
> > Unless it is certain that rollover will not occur, software is
> > required to detect the possible time rollover by reading multiple
> > times such that the read time bytes can be adjusted accordingly if
> > needed."
> > 
> > Should this be taken additional care of somehow?
> 
> 1. .use_single_read in regmap_config.
> 2. Maybe that is the right place for rollover check.
> 
> > > +static ssize_t force_off_store(struct device *dev,
> > > +			       struct device_attribute *attr,
> > > +			       const char *buf, size_t count)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct pch *pch = i2c_get_clientdata(client);
> > > +	unsigned long val;
> > > +	int rc;
> > > +
> > > +	if (kstrtoul(buf, 10, &val))
> > > +		return -EINVAL;
> > > +
> > > +	if (val) {
> > > +		/* 0x02 host force off */
> > 
> > I wonder why you write "host force off" while the C620 datasheet calls
> > it "Unconditional Power Down", does your PCH manual use different
> > naming?
> 
> It just a synonym, does the same. I can change it but first it's need to
> be decided if attribute would go or not.
> 

I would prefer if this was added later on in a later patch, with the
proper ABI documentation so that the ABI can be discussed.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
