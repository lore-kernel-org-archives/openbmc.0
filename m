Return-Path: <SRS0=hwRE=NO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F9DC4338F
	for <openbmc@archiver.kernel.org>; Mon, 23 Aug 2021 00:26:20 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87EEB61107
	for <openbmc@archiver.kernel.org>; Mon, 23 Aug 2021 00:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87EEB61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtChn5m3qz30FP
	for <openbmc@archiver.kernel.org>; Mon, 23 Aug 2021 10:26:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gHp+PZxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=fr0st61te@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gHp+PZxn; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grh0b2Klyz3clt
 for <openbmc@lists.ozlabs.org>; Fri, 20 Aug 2021 22:34:39 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id s3so17016303ljp.11
 for <openbmc@lists.ozlabs.org>; Fri, 20 Aug 2021 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOmWkoC+gAVe/BeQYe8N8pWzsizYYXPCg0Wr0Rqh/4w=;
 b=gHp+PZxn5XsxisB5D4g0NSllOyywYlWQ6elppwcsdObIoKEvQd0DS4YsG7Uc/MwKBj
 CV5k5vbaI5Lp37IOekiYHNyRxLD66ehDmbqoIdYC4j6mlVvVKydGrRR54O2gvi04WTDN
 hLOp3j6A7zZjJFixW/KbhICDc8ZnYc0H+J/K+hBOqQ0nk+icYclPVLT4q54PJhkqh732
 k3V+omgH7reaKFCEuONKRSd/9I3fZeTgUTApN9kqq056n+c1wtlLCSkHpw1aH83//rJT
 nmu6ONGhVtiV2UphmgQ+wNhqHftwUkQOADTDi5OCHZAUvow+41RCSTW879VjYDSuk3Xj
 eMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOmWkoC+gAVe/BeQYe8N8pWzsizYYXPCg0Wr0Rqh/4w=;
 b=qafo8xWelJ1ZoARAj88/2SWrxPAuxsnf7/cYE2XzurYceoWnEXmxtZiedZoSVapU0M
 xzSkN3DJzctkDaYD6BnHogOg/6UE5WD9AjYjsu1daHGTlF6NHW52nNMoL0Sop1bqMmxa
 ShbbQj25SQLVP6oeHli2oTZluRYo4Gw+vHgKMQfgDPxgLArjdETSxYeKLwvlZQpB3Qpg
 L3Io6j5+33CXZ7sGwLTdH1Azza+2kMo9D0gR7s17xcdz67BZYZZpY3ymTJL9/Rih43hy
 b9l0PaYSJMWmKcwVnte3cy5ImNuWuYAs/usT/G6m2WOZ/Gj8xaEyean+drzk1XgUvcDJ
 rKtA==
X-Gm-Message-State: AOAM5327qOQJOKw4R8jeyxBCFhMBrjENVpvme/N7EYVBy0yq4OBDxDAE
 tvmi+5ssLdz0NK4q7WTYeCk=
X-Google-Smtp-Source: ABdhPJzG6lqXuj0LLqVAK//R94kjPZHgS8vSVZ0e4cz5cfyiye6YExcU6LdypXVaYg3neGOnHgKAfA==
X-Received: by 2002:a05:651c:1190:: with SMTP id
 w16mr15793493ljo.327.1629462872397; 
 Fri, 20 Aug 2021 05:34:32 -0700 (PDT)
Received: from localhost.localdomain ([87.249.198.171])
 by smtp.gmail.com with ESMTPSA id u18sm680722lfo.280.2021.08.20.05.34.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Aug 2021 05:34:31 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: fercerpav@gmail.com
Subject: Re: [PATCH 1/2] rtc: pch-rtc: add RTC driver for Intel Series PCH
Date: Fri, 20 Aug 2021 15:34:10 +0300
Message-Id: <20210820123410.46539-1-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20210814225242.GY15173@home.paul.comp>
References: <20210814225242.GY15173@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Aug 2021 10:25:40 +1000
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
Cc: i.mikhaylov@yadro.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Aug 15, 2021 at 01:52:42PM +0300, Paul Fertser wrote:
> On Tue, Aug 10, 2021 at 06:44:35PM +0300, Ivan Mikhaylov wrote:
> > +config RTC_DRV_PCH
> > +	tristate "PCH RTC driver"
> > +	help
> > +	  If you say yes here you get support for the Intel Series PCH
>
> I'm afraid this is really lacking some specification of devices that
> are supported. Is it really everything that Intel currently calls PCH?

Yes, from infromation that I know.

> > +static int pch_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct pch *pch = i2c_get_clientdata(client);
> > +	unsigned char rtc_data[NUM_TIME_REGS] = {0};
> > +	int rc;
> > +
> > +	rc = regmap_bulk_read(pch->regmap, PCH_REG_SC, rtc_data, NUM_TIME_REGS);
> > +	if (rc < 0) {
> > +		dev_err(dev, "fail to read time reg(%d)\n", rc);
> > +		return rc;
> > +	}
>
> Citing 26.7.2.3 from C620 (Lewisburg/Purley) datasheet:
> 
> "The PCH SMBus slave interface only supports Byte Read operation. The
> external SMBus master will read the RTC time bytes one after
> another. It is software’s responsibility to check and manage the
> possible time rollover when subsequent time bytes are read.
> 
> For example, assuming the RTC time is 11 hours: 59 minutes: 59
> seconds. When the external SMBus master reads the hour as 11, then
> proceeds to read the minute, it is possible that the rollover happens
> between the reads and the minute is read as 0. This results in 11
> hours: 0 minutes instead of the correct time of 12 hours: 0 minutes.
> Unless it is certain that rollover will not occur, software is
> required to detect the possible time rollover by reading multiple
> times such that the read time bytes can be adjusted accordingly if
> needed."
> 
> Should this be taken additional care of somehow?

1. .use_single_read in regmap_config.
2. Maybe that is the right place for rollover check.

> > +static ssize_t force_off_store(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       const char *buf, size_t count)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct pch *pch = i2c_get_clientdata(client);
> > +	unsigned long val;
> > +	int rc;
> > +
> > +	if (kstrtoul(buf, 10, &val))
> > +		return -EINVAL;
> > +
> > +	if (val) {
> > +		/* 0x02 host force off */
> 
> I wonder why you write "host force off" while the C620 datasheet calls
> it "Unconditional Power Down", does your PCH manual use different
> naming?

It just a synonym, does the same. I can change it but first it's need to
be decided if attribute would go or not.

Thanks.
