Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d5uUlfsG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oAjSLMk1"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r5j42VPfzF3KV;
 Thu,  8 Nov 2018 12:46:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8879821ABB;
 Wed,  7 Nov 2018 20:45:57 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 07 Nov 2018 20:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:subject:references; s=fm1; bh=wEC
 o5wnN9Tjso2x0IKjlK+tfyYSccAXdAOo6CfpVURE=; b=d5uUlfsGTuO/lofkMnn
 dgKxq7Tuh8mSrfDaMX3SMqQkrDnqZUb/5jRC31zPz0SR1WStn0HyDd42+yev4KpB
 Q8FsBvFHOCjeIw3bsJ2kFpPj7lz+ba0ymdS6739q26WIvuWW5WxvzhIWXnpHjA9f
 yjM+9IjXOKd45tchVhRzoRgzwLjm8Jq85K8WgShnYoIvZofFQHKHhVa/uNS3ddFk
 j3bh9OQn7KHmXSKP8Vtw2q1Q+6TeKaPiTYOA5GfzAqkylZoHRtuZpCHyDtmefByJ
 ps/R0kmk0xC6qR8/1RHvzXIRez9OLq8rBu+OZupXNZAVZMVsOjfAPII93YT6Bt/h
 UBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=wECo5wnN9Tjso2x0IKjlK+tfyYSccAXdAOo6CfpVU
 RE=; b=oAjSLMk1tiCab1Usw3B73o9/f1jxlqqCiAP6uu4YneWNvBgXNCaOgC7NQ
 cX0VbO4rSXcCYTf6fs3rTOF6m+g0pX9GcGySJx7/rIluO3qQ0JLxKh5smqRUi2do
 UrZOpIwQwEcEedzyW5ngS8hl8iO1HmbD0tTqg1GXqt/GrJCgUCcWbaVM9AmBBvCe
 4o3OKAB/mPLwptnzHtENCyadO+Oby8oZ/sHzAB2rzNYdWmHuXCL5Bf6H++fuWWFj
 SFwFY9wF3tRBqj+PaOU9dgURt/v1pz3I+/CQT0TMgwy246Fo7loDLGB5fPeIpYlN
 BSJAa1aFLZgnKwu9ctPBDpL2mf2aA==
X-ME-Sender: <xms:VJXjW4VNQITL69OK9CaQxugKvzCw8FaenAY7bBAq1oGumEwD4hrlfw>
X-ME-Proxy: <xmx:VJXjW5mwbAnJ3EQVExQDIDEdoswoE7mZBK5cKyuB3buNTTy9KYnsGg>
 <xmx:VJXjW_FZvDGDZVdfNlmgeGE9LrRHx5fMeiJ63ZszT_R2j8OKjFbITA>
 <xmx:VJXjW1FtVesI5EGoHIar443_p2ifOvU6Lt3MyQNg1j4ZTRMz5ZT8wA>
 <xmx:VJXjW_1w4UJcCzrNy5AFXjnBZspDXk8ATDBv_ciTHlBRJiJZDGYjbQ>
 <xmx:VJXjW_cA1_bNFBT0rXYGKYagv6ofMCodndLK7_hEZyBJVJDD1jb-JQ>
 <xmx:VZXjW0zt6igWMV6ZNQrfKror-IHMYC0FrLwbOcPIylLyvYyUVNfbYw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 2E28F9E4F3; Wed,  7 Nov 2018 20:45:56 -0500 (EST)
Message-Id: <1541641556.1495362.1569509568.7BE039CA@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
Date: Thu, 08 Nov 2018 12:15:56 +1030
In-Reply-To: <c5e56fc4-397f-a38b-6378-99eecce1180b@fb.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
References: <20181106042829.2771226-1-taoren@fb.com>
 <1541635320.1462459.1569430616.0F5E4C4D@webmail.messagingengine.com>
 <c5e56fc4-397f-a38b-6378-99eecce1180b@fb.com>
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
X-List-Received-Date: Thu, 08 Nov 2018 01:46:02 -0000

On Thu, 8 Nov 2018, at 10:48, Tao Ren wrote:
> On 11/7/18 4:02 PM, Andrew Jeffery wrote:
> >> +partitions {
> >> +	compatible = "fixed-partitions";
> >> +	#address-cells = <1>;
> >> +	#size-cells = <1>;
> >> +
> >> +	u-boot@0 {
> >> +		reg = <0x0 0x60000>;
> >> +		label = "u-boot";
> >> +	};
> >> +
> >> +	u-boot-env@60000 {
> >> +		reg = <0x60000 0x20000>;
> >> +		label = "env";
> >> +	};
> >> +
> >> +	fit@80000 {
> >> +		reg = <0x80000 0x1b80000>;
> >> +		label = "fit";
> >> +	};
> >> +
> >> +	data0@1c00000 {
> >> +		reg = <0x1c00000 0x400000>;
> >> +		label = "data0";
> >> +	};
> >> +
> >> +	flash0@0 {
> >> +		reg = <0x0 0x2000000>;
> >> +		label = "flash0";
> >> +	};
> > 
> > Is this necessary? Isn't the same thing achieved with the /dev/mtd0 device?
> 
> Hi Andrew,
> 
> Thank you for the review! The new layout file is needed mainly because 
> of "data0" partition: several facebook platforms use the partition as 
> "persistent" storage.
> 
> As for "flash0", technically it's not needed (as you pointed out, /dev/
> mtd0 covers the entire flash if master_partition is enabled). It's still 
> here to avoid breaking some legacy applications.

This is what I expected. I think it might be worth adding a comment, given
you are respinning the series to address my comments on the board
devicetree patch.

Anyway, thanks for the clarification.

Andrew
