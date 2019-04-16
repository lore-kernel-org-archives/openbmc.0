Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pw7kMRkV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Tn0GQFGK"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jnbh2cypzDqDb
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 11:20:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5E89F657;
 Mon, 15 Apr 2019 21:19:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 15 Apr 2019 21:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=+cp0C2VJiUPTWO4+0D6SkzDfyvaVY60
 z0FNrUm8gb+Q=; b=pw7kMRkVULgUr/juhpKeaZWkNyhzhNayqzkKfJ9wUUjoWzD
 u86Op5ogQBKMI7quRoKtGn7Uc7Ol5qnkk+E3vd8fcwLragI21a4vho3OczKscuvY
 lu6pUHLylirViEIaRoMNYrWs0ti2BKzT+ZxrvOhRt8NGlWY9ZXOb1IV9lg9/sIsp
 YKA1yaDMP9Oq8Wcq6CTBqMZtrYIkc+mkRQI3ae8oPuH9lAYzOSc/WzGuK780tgT3
 1DzzN9MCmAMzygr7koRSy6VUGJMP2VB/HOh3edRGI8zaumauNLK7iGAp3ADRClKd
 OqMXduJmTY173t0Z6qdEPOaJv6BV6uk59/e6joQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+cp0C2
 VJiUPTWO4+0D6SkzDfyvaVY60z0FNrUm8gb+Q=; b=Tn0GQFGKLFziugGqW06QL5
 M1KHOR3nj/y1K56Z1PMt0ywv9kQIcXRWaUaDuVaqf9VXdf0wyZE/SxGWH9Gfs6x/
 M5FeBD9FNlSsDaX0r9GjE+17FWU4Me8LrPGFcs4OD35khqC7ofIq63XdlcKB+6CP
 CoovxzyW3GdxrTOrR5d9NamgHF4nhaa+TJZxlk2AbGma3dSx1Ebximln4SngkymK
 Mp2oMUMcrortiUI8f99IjarQFWubWeQdnctHLFKDBdpZOJrfFOO0w20wSNR5qth8
 NnbKL44nBMwDXr0etzta7UIAjQ0qN0i3Su/Y2AA6hvAJlTFjhAxD/eugtDTXKdiQ
 ==
X-ME-Sender: <xms:ui21XO2iop2HXwfUwwhTCwOqsefVmV9Z-Fa-NzdarpRivvIWzDLrKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinheprghtthhrrdhnrghmvgenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ui21XMyaH4q0UTUrT71tVjvPQJAmVhPnzn-3X0MEoD_cHDW9eV_nTg>
 <xmx:ui21XKjO04qv45f-CBihPO0PX9-WCu1KCqYYo2xRXOrAi7TZ79obSg>
 <xmx:ui21XAG8u4c9-XyZs_q_Db1uMtLoMcKUB2ELrqeqgYC-l68iyzZh-w>
 <xmx:uy21XKJ0_ZohRzivl_hgWVZOWApq11eyJ7jBwo4jz5AclD8WYAVRfg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D7FF27C199; Mon, 15 Apr 2019 21:19:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <04deb130-7ee8-4cb0-9fb3-b37c9b62350c@www.fastmail.com>
In-Reply-To: <1555367261-4299-2-git-send-email-eajames@linux.ibm.com>
References: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
 <1555367261-4299-2-git-send-email-eajames@linux.ibm.com>
Date: Mon, 15 Apr 2019 21:19:54 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_2/2]_hwmon_(occ):_Prevent_sysfs_error_attri?=
 =?UTF-8?Q?bute_from_returning_error?=
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
X-List-Received-Date: Tue, 16 Apr 2019 01:20:01 -0000



On Tue, 16 Apr 2019, at 07:58, Eddie James wrote:
> The error sysfs attribute returns the stored error state of the OCC and
> doesn't depend on the OCC poll response. Therefore, split the error
> attribute into it's own function to avoid failing out of the function if
> the poll response fails.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Should this be sent upstream?

> ---
>  drivers/hwmon/occ/sysfs.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
> index 743b26ec..9bf1526 100644
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
> +static ssize_t occ_sysfs_error(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
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
> +static DEVICE_ATTR(occ_error, 0444, occ_sysfs_error, NULL);
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
