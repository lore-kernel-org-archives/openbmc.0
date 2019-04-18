Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BEl5FBuG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Lo77qv7z"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l81T5HsQzDqQN
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:13:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 014FF21FBA;
 Thu, 18 Apr 2019 02:13:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=CSBkmiFbkIg7HsMq+/E9ZsRsqSlF4QG
 BZJx4FtPSDeM=; b=BEl5FBuGKgkJltPdnKXRf92X4poQwG0NlmiYj3n1B12cxFO
 +7WguAOiJfZ94GrLSuqlFEW/h1C4Yb4L1iycuNOkbGaoe+Pckx9Zojc5+5NtMFkA
 1toZVd2b+q/19aT1zWmlZTI8dlIZ/gnHCz+k84N+QvKs2HQUV2mojwihHAQZlGGd
 FLslhm9ii5IccnauGcuLaCPq3WOHo95na2gBJjpmmiiK24W2UBNJu0o75fOGU9Bl
 x9CRMECrHJXFFYvTvH4KPIrzBmkpwQyezsvwBBlkrEfT+F4Jooyd4mhZlmmIQQhD
 v0Y8mzbuRyu5ufNIncDAJscvc5c2bKoGqAdHvuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CSBkmi
 FbkIg7HsMq+/E9ZsRsqSlF4QGBZJx4FtPSDeM=; b=Lo77qv7zFdDKybpDMkZow+
 FqcCrS/v+L37mSsfQwtPt+gMLdrfhCPDaAeqBydcgiWDuQKgmd2qUz8LS8xdRxx4
 1bfA3vPNDZr+EFyx5iD0rJum3JZ7Z7N9j8ahu9XLdT5lQTo/sR5pmfhA9A1EgUId
 RdDfLc+ZGEkQpEPx+rJ6jYX5BBodC1SUMfgZlQGO8bMrskzatHuulivXBaVkXw51
 HBTmm31VXvXkdaK7DhZN+SgqjrtVcZwvBiDAlQEEmU8nQKbSy4bbT8dEzV/W2svM
 sWzDE63RqOv7EsvrRX59VleqO6mQ1ba9+4bMYV96pLkNrgeazsrQfATu747jCb2Q
 ==
X-ME-Sender: <xms:iRW4XK3m1KAnkyHl192Fh6oWVe2pvrR1psfJQIXjdPHfFRXjyD0G0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ihW4XJaSDDFLC8ECRjpcoK-KAG6-GvcZJjFcHGl4_8z7onn8mKR2eQ>
 <xmx:ihW4XFo3VHOhrhb_u4N-kPN6l26Si9OqLWhtod_d34ZNwUGlMidYxw>
 <xmx:ihW4XNoMIrDvLAvc82bozyyAJFX245kwXlmsGXs61JRwKyCyyLrEWA>
 <xmx:ihW4XMkUzJK-EEjLEiKcAJAF0Jh1qTZt-UN4UvlQuzy_OXJBfoKPhQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C96557C50A; Thu, 18 Apr 2019 02:13:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <ad65dfe7-ef82-4a71-8c3f-3fceb13e0789@www.fastmail.com>
In-Reply-To: <20190417193614.GB23825@roeck-us.net>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
 <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
 <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
 <20190417193614.GB23825@roeck-us.net>
Date: Thu, 18 Apr 2019 02:13:29 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>,
 "Alexander Amelkin" <a.amelkin@yadro.com>,
 "Alexander Soldatov" <a.soldatov@yadro.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
Content-Type: text/plain
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
X-List-Received-Date: Thu, 18 Apr 2019 06:13:34 -0000



On Thu, 18 Apr 2019, at 05:07, Guenter Roeck wrote:
> On Wed, Apr 17, 2019 at 01:35:41PM -0500, Eddie James wrote:
> > 
> > On 4/17/19 1:03 PM, Alexander Amelkin wrote:
> > >From: Alexander Soldatov <a.soldatov@yadro.com>
> > >
> > >The occ driver supports two formats for the temp sensor value.
> > >
> > >The OCC firmware for P8 supports only the first format, for which
> > >no range checking or error processing is performed in the driver.
> > >Inspecting the OCC sources for P8 reveals that OCC may send
> > >a special value 0xFFFF to indicate that a sensor read timeout
> > >has occurred, see
> > >
> > >https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395
> > >
> > >That situation wasn't handled in the driver. This patch adds invalid
> > >temp value check for the sensor data format 1 and handles it the same
> > >way as it is done for the format 2, where EREMOTEIO is reported for
> > >this case.
> > 
> > 
> > Thanks Alexander and Guenter.
> > 
> > 
> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> > 
> 
> Applied.

I've backported and applied this to dev-5.0.

Cheers,

Andrew

> 
> Thanks,
> Guenter
> 
> > 
> > >
> > >Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> > >Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> > >Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
> > >Cc: Edward A. James <eajames@us.ibm.com>
> > >Cc: Joel Stanley <joel@jms.id.au>
> > >---
> > >  drivers/hwmon/occ/common.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > >diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> > >index 4679acb..825631c 100644
> > >--- a/drivers/hwmon/occ/common.c
> > >+++ b/drivers/hwmon/occ/common.c
> > >@@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
> > >  		val = get_unaligned_be16(&temp->sensor_id);
> > >  		break;
> > >  	case 1:
> > >+		/*
> > >+		 * If a sensor reading has expired and couldn't be refreshed,
> > >+		 * OCC returns 0xFFFF for that sensor.
> > >+		 */
> > >+		if (temp->value == 0xFFFF)
> > >+			return -EREMOTEIO;
> > >  		val = get_unaligned_be16(&temp->value) * 1000;
> > >  		break;
> > >  	default:
> > 
>
