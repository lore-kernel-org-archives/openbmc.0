Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lMFsWwcl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Iy32mErH"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7zc5PMBzDqSC
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:11:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55D4F21321;
 Thu, 18 Apr 2019 02:11:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=4EU3bB1ya0dZR7cNopgb3xobIUdItzC
 aphchwZdogZw=; b=lMFsWwclAZYKv5ikq2Oa4K+YZzhk1HwOBJ3huNn440l9uGa
 i9RNe4r+E1F5Ol9TdKs+oz9WBbgs42mRVOH56uM65feQFZ6vQJpfr6Mtq71FThCk
 3hxFP9Pdh5nOdpCSogrVjgPokkC9BafGzIGEhyVyMj4Oke9qobW72YS416Ere6xi
 OcrqceTku7VKXeQ+2hgA601+IriryV/K1fedQxvejWwOc+lshu1LSReiNbmr5PE9
 c91OCIx0yK/67x3ALp/+GTMoxT64b12eAH271Gv9rvfbSp0vxH8mSXfaSTMSf6pC
 huovhiR9UJee4Ib4llhVTXWuErwoX/vdBDsmZnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4EU3bB
 1ya0dZR7cNopgb3xobIUdItzCaphchwZdogZw=; b=Iy32mErHFmCDXlOnECLGXN
 OZf7oWwWEesz4y918k9bLWYi706Sh/useRUWZdun/+WIw0ogR0xlVBWgCCn05L8E
 pY/DyDePu5th5pu5Kcm+q01gO3jfD4MzXpJqdSE+1FhXFZzUBR8MggKZnOeUFMm6
 N4K8FMTm7RzIC2avyPsbBxx5fsxoQ9+uiPPaGZxxIJXhWmITtD+WWUp+1kslncoF
 aH/vYdsRl4xEhEE2HCxr0OGSlYBF+YRTkcHRdwrkmOcQvpoMps0wFb/ycPK3Ctbz
 M3wBEefFM2KhjfE8cIEz9IVGdH4N8Bbuq1pqHQ/3GPXIbnVPD7NiG9epnEqj06Rg
 ==
X-ME-Sender: <xms:KhW4XK-qGzaVSTTguRav3NfDg5ZrPe3dutkC6m_4RWpjtJyODF42kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpegrthhtrhdrnhgrmhgvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KhW4XEAY0_HhPl2XCoyPNz7emnNHWrYFiNbfngduBahXIx-wX1YcyA>
 <xmx:KhW4XIA8fMPzgTNyLwVFGu0CAxH-XCQ6ZUFjFT4BGjUXXyhUyCebnw>
 <xmx:KhW4XMIhUOSW4Vay0iPRepL8iBLffBnHiEy67VI-3FGYPfkjNcYRmQ>
 <xmx:KhW4XOkDUOzJZ5GuHAZkrQh9U9lGYk3p_afGS1Z7cI_d9z_2xw61Cg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 06B8B7C50A; Thu, 18 Apr 2019 02:11:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <83b1aecf-e279-4840-903e-a8df56286820@www.fastmail.com>
In-Reply-To: <1555429864-23291-2-git-send-email-eajames@linux.ibm.com>
References: <1555429864-23291-1-git-send-email-eajames@linux.ibm.com>
 <1555429864-23291-2-git-send-email-eajames@linux.ibm.com>
Date: Thu, 18 Apr 2019 02:11:53 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_v2_2/2]_hwmon_(occ):_Prevent_sysfs_error_at?=
 =?UTF-8?Q?tribute_from_returning_error?=
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
X-List-Received-Date: Thu, 18 Apr 2019 06:11:57 -0000



On Wed, 17 Apr 2019, at 01:22, Eddie James wrote:
> The error sysfs attribute returns the stored error state of the OCC and
> doesn't depend on the OCC poll response. Therefore, split the error
> attribute into it's own function to avoid failing out of the function if
> the poll response fails.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1 (to match what went upstream):
>  - renamed occ_sysfs_error to occ_error_show
>  - switched to DEVICE_ATTR_RO for occ_error
> 
>  drivers/hwmon/occ/sysfs.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
> index f04f502..1b599f4 100644
> --- a/drivers/hwmon/occ/sysfs.c
> +++ b/drivers/hwmon/occ/sysfs.c
> @@ -71,9 +71,6 @@ static ssize_t occ_sysfs_show(struct device *dev,
>  		else
>  			val = 1;
>  		break;
> -	case 8:
> -		val = occ->error;
> -		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -81,6 +78,16 @@ static ssize_t occ_sysfs_show(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
>  }
>  
> +static ssize_t occ_error_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct occ *occ = dev_get_drvdata(dev);
> +
> +	occ_update_response(occ);
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
> +}
> +
>  static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_sysfs_show, NULL, 0);
>  static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_sysfs_show, NULL, 1);
>  static SENSOR_DEVICE_ATTR(occ_dvfs_overtemp, 0444, occ_sysfs_show, 
> NULL, 2);
> @@ -89,7 +96,7 @@ static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, 
> occ_sysfs_show, NULL, 4);
>  static SENSOR_DEVICE_ATTR(occ_quick_pwr_drop, 0444, occ_sysfs_show, 
> NULL, 5);
>  static SENSOR_DEVICE_ATTR(occ_state, 0444, occ_sysfs_show, NULL, 6);
>  static SENSOR_DEVICE_ATTR(occs_present, 0444, occ_sysfs_show, NULL, 7);
> -static SENSOR_DEVICE_ATTR(occ_error, 0444, occ_sysfs_show, NULL, 8);
> +static DEVICE_ATTR_RO(occ_error);
>  
>  static struct attribute *occ_attributes[] = {
>  	&sensor_dev_attr_occ_master.dev_attr.attr,
> @@ -100,7 +107,7 @@ static struct attribute *occ_attributes[] = {
>  	&sensor_dev_attr_occ_quick_pwr_drop.dev_attr.attr,
>  	&sensor_dev_attr_occ_state.dev_attr.attr,
>  	&sensor_dev_attr_occs_present.dev_attr.attr,
> -	&sensor_dev_attr_occ_error.dev_attr.attr,
> +	&dev_attr_occ_error.attr,
>  	NULL
>  };
>  
> @@ -164,7 +171,7 @@ void occ_sysfs_poll_done(struct occ *occ)
>  	}
>  
>  	if (occ->error && occ->error != occ->prev_error) {
> -		name = sensor_dev_attr_occ_error.dev_attr.attr.name;
> +		name = dev_attr_occ_error.attr.name;
>  		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
>  	}
>  
> -- 
> 2.7.4
> 
>

Applied to dev-5.0.

Cheers,

Andrew
