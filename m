Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VSQHghU+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Xboivxsy"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jyBT0mXzzDqG1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 17:47:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F2EF22274;
 Tue, 16 Apr 2019 03:47:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 16 Apr 2019 03:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=NKWQm3bDRTHIW2X39dsty5DIjqcSRku
 6Mv95uQyy42o=; b=VSQHghU+7sB4puKZuIbROMm/krosDau5bU8hj4+Lk3vJGeq
 ozKEZgDRhbqci3tau8jT7TFUnzYBx6cZtMshW2mQ9w+Om8e7eMFfMrgst70QvHy8
 9TTGExUmc6X7v6XlwMDPoAfqV/LGVx1yCwkDZ/oA2ZMYcO+RYz7LBzbsBpL+hv8R
 hJ6CLPVOal7MedZYQmYhq1GfzTxgUk5dOCH59n2VYRbIuiQQX7AhWhYvECIZbx9K
 uRmHdLWLr45by6fdbQXLz5Cf3y27W4KUGoBYo1U95Koe56S5alOH66Iq+t+MtMJ1
 w0H6NNWtSTGnPEHWpguDk+0hSHpc69x9f29oZmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NKWQm3
 bDRTHIW2X39dsty5DIjqcSRku6Mv95uQyy42o=; b=XboivxsyYGSFDqgD0J+LRS
 U9Z+niZW4sZme85wu4AcfCzXKAo9oNoBsqckYdU9PO+B7DtF+vNX4lLIQ3Ldv3l/
 9tFf2xV9vFCnCbx9Uxs48tUh6Hi9f0N9hFJ4WdnPARm2h0WkbUXizEXha20sORaA
 L5qwSxZ4LpcIWbPHrR9gpcY6HLhLcY3FBUGBTMKuoQtp4ItP9G5HNkqmosT2t+7N
 8jbW19csGizV/wQLJrt1LIqRsvO6tHemtYD8qEd0Ao7rooiNUmzUbTo2sECVfK1k
 oAuwKFZ85OPrT1U8AmKD9zNDljPLK+TDVcfhTmwwp7qdPX8+Nxqq5KubLS/xKe+Q
 ==
X-ME-Sender: <xms:eoi1XIIc1zcFPnDQI0kSA1RiVtalyOUTPREE8zz23T3E9VmTjtD0iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedtgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:eoi1XIsV_V1TgjVPNLdvIPaD7Uov6KNwsUm8SExDZ97AvyB9ewP4Hg>
 <xmx:eoi1XBk94ySQ8X9eIdKJw42EKyZGddd0zsRohfzZldoA912n4pDDRQ>
 <xmx:eoi1XPnF-wbVVeeiwC5x2NrezA3CLLbH5vysck9DTw9w5b4wt0Y-2g>
 <xmx:fIi1XI75G1HI0NYzTj2SPw4xkzdMQgg2g-HlFh4YzsaPshh0mepXVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 882B87C199; Tue, 16 Apr 2019 03:47:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <5a729232-7f93-4234-98d1-c89a266e3c5c@www.fastmail.com>
In-Reply-To: <20190416002045.GA4442@roeck-us.net>
References: <1555324640-152061-1-git-send-email-mine260309@gmail.com>
 <20190416002045.GA4442@roeck-us.net>
Date: Tue, 16 Apr 2019 03:47:05 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: Mine <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Cc: "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] hwmon (occ): Fix extended status bits
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
X-List-Received-Date: Tue, 16 Apr 2019 07:47:16 -0000



On Tue, 16 Apr 2019, at 09:50, Guenter Roeck wrote:
> On Mon, Apr 15, 2019 at 06:37:20PM +0800, Lei YU wrote:
> > The occ's extended status is checked and shown as sysfs attributes. But
> > the code was incorrectly checking the "status" bits.
> > Fix it by checking the "ext_status" bits.
> > 
> > Signed-off-by: Lei YU <mine260309@gmail.com>
> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 
> Applied.

I've also applied this to dev-5.0.

Cheers,

Andrew

> 
> Thanks,
> Guenter
> 
> > ---
> >  drivers/hwmon/occ/sysfs.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
> > index fe3d15e..a71ca94 100644
> > --- a/drivers/hwmon/occ/sysfs.c
> > +++ b/drivers/hwmon/occ/sysfs.c
> > @@ -42,16 +42,16 @@ static ssize_t occ_sysfs_show(struct device *dev,
> >  		val = !!(header->status & OCC_STAT_ACTIVE);
> >  		break;
> >  	case 2:
> > -		val = !!(header->status & OCC_EXT_STAT_DVFS_OT);
> > +		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_OT);
> >  		break;
> >  	case 3:
> > -		val = !!(header->status & OCC_EXT_STAT_DVFS_POWER);
> > +		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_POWER);
> >  		break;
> >  	case 4:
> > -		val = !!(header->status & OCC_EXT_STAT_MEM_THROTTLE);
> > +		val = !!(header->ext_status & OCC_EXT_STAT_MEM_THROTTLE);
> >  		break;
> >  	case 5:
> > -		val = !!(header->status & OCC_EXT_STAT_QUICK_DROP);
> > +		val = !!(header->ext_status & OCC_EXT_STAT_QUICK_DROP);
> >  		break;
> >  	case 6:
> >  		val = header->occ_state;
>
