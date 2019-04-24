Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="DY3zWe4J"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="z8n6nZAY"; dkim-atps=neutral
X-Greylist: delayed 529 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Apr 2019 13:58:19 AEST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pmkg6s85zDqTV
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 13:58:19 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 824E1205B8;
 Tue, 23 Apr 2019 23:49:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 23 Apr 2019 23:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:date:in-reply-to
 :references:content-type:mime-version:content-transfer-encoding;
 s=fm2; bh=TMK4saVMes0u+ASfn2Ds/1ITfBfjKM5mlrv8N7Sg0M8=; b=DY3zW
 e4JAoM2pHOihbCulxIzmOizA6AV6drKcrS6XRFVT8ps+cahyw4vPdiGCW+DXu1y8
 jQ5jeC6pPVFX+AB3E+uYDXOp758r5Lf7ScQkT1tdowwdb7m6gwLU5nKbfBGkc2VA
 N1JH4O3OJEPuZl+RjCU30ihWJ/4pFs/Si8mUgjIcyBC98T5LsflIaaSJk4dY5hpO
 v+cguuCb/4oXnTFWlxIWxfSXUNMc71WzRbfSPx9ezX7Wqmd5cMEbNHdrQWiT4bgZ
 Az8I3yxV5xgdQRIPz1ZFKk7XJle9yXLm64iIiZOHpZlnM/v/77k8r8VqqPk831yh
 vxDwN5SmYnFeX6IxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TMK4saVMes0u+ASfn2Ds/1ITfBfjKM5mlrv8N7Sg0
 M8=; b=z8n6nZAYEUUvQxCg9RtP3SU80RiE6IY2DsjeenGNz4xEJfUTByaSe3quh
 F4gkgR27hV+WhbOJeVj59jEKfIIqVvSdBVCzK7+Armv9mNgHuohRpACIHjt8bt3/
 2vyQpb/yEIpiVEDccDUbGPS6U6tpz4E/3RBYZsuuCSFMzjHQcxYL1nLZbTm8ZL6w
 oM3KkuQIJuf70o2r1Tc5dFZt3qs38qcf4Gbf9QyqFlJJMMSeZ2MK5Z6xDF4x7Niu
 woOiXdaaWMmaX5l14sXnNAqCEhmFecYmM3jKtUtnpsNDB9zIL2gZllE0INkn+P8i
 AEvLdR80mkojrdHyHgHcjfpGaye5w==
X-ME-Sender: <xms:xty_XJ_-LQyt29nJxYbb1VWVFEiaGjH6JHBC56BAiaOH8eGCeFmDSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrgeelgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefurghmuhgv
 lhcuofgvnhguohiirgdqlfhonhgrshcuoehsrghmsehmvghnughoiigrjhhonhgrshdrtg
 homheqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhho
 mhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:xty_XIJRhei6WxZhlzk4O03KyjdHNyboRN_acJQir7PR2DeLCmpHOw>
 <xmx:xty_XOj-QPp2pljpjbyxfEGdduZHl2Y0-LmWlDaSXFKXhel0Ily9zA>
 <xmx:xty_XE8agZ2fYNszyxmobeWvPpQQsnoHDOqgx-oOY-0T-KNTlx9suQ>
 <xmx:x9y_XDHTCyWOaGmr9Mgcmlhd7OfH9B_4K6oYHz_qT_63Ix4tzBYWkA>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03182E424F;
 Tue, 23 Apr 2019 23:49:21 -0400 (EDT)
Message-ID: <a0cc05541859e96dad21ebda67cd468aedfb893c.camel@mendozajonas.com>
Subject: Re: [PATCH net v4] net/ncsi: handle overflow when incrementing mac
 address
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Tao Ren <taoren@fb.com>, "David S . Miller" <davem@davemloft.net>, Maxim
 Mikityanskiy <maximmi@mellanox.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Jakub Kicinski <jakub.kicinski@netronome.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Wed, 24 Apr 2019 13:49:17 +1000
In-Reply-To: <20190424014310.24253-1-taoren@fb.com>
References: <20190424014310.24253-1-taoren@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 24 Apr 2019 03:58:20 -0000

On Wed, 2019-04-24 at 01:43 +0000, Tao Ren wrote:
> Previously BMC's MAC address is calculated by simply adding 1 to the
> last byte of network controller's MAC address, and it produces incorrect
> result when network controller's MAC address ends with 0xFF.
> 
> The problem can be fixed by calling eth_addr_inc() function to increment
> MAC address; besides, the MAC address is also validated before assigning
> to BMC.
> 
> Fixes: cb10c7c0dfd9 ("net/ncsi: Add NCSI Broadcom OEM command")
> Signed-off-by: Tao Ren <taoren@fb.com>

Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> ---
>  include/linux/etherdevice.h | 12 ++++++++++++
>  net/ncsi/ncsi-rsp.c         |  6 +++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> Changes in v4:
>  - revert the changes in eth_addr_dec() function comment.
> Changes in v3:
>  - squash changes in "etherdevice.h" into this patch.
>  - fix format issue in function comment.
> Changes in v2:
>  - increment MAC address by calling eth_addr_inc() function.
>  - validate MAC address before assigning to BMC.
> 
> diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> index e2f3b21cd72a..aa8bfd6f738c 100644
> --- a/include/linux/etherdevice.h
> +++ b/include/linux/etherdevice.h
> @@ -448,6 +448,18 @@ static inline void eth_addr_dec(u8 *addr)
>  	u64_to_ether_addr(u, addr);
>  }
>  
> +/**
> + * eth_addr_inc() - Increment the given MAC address.
> + * @addr: Pointer to a six-byte array containing Ethernet address to increment.
> + */
> +static inline void eth_addr_inc(u8 *addr)
> +{
> +	u64 u = ether_addr_to_u64(addr);
> +
> +	u++;
> +	u64_to_ether_addr(u, addr);
> +}
> +
>  /**
>   * is_etherdev_addr - Tell if given Ethernet address belongs to the device.
>   * @dev: Pointer to a device structure
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index dc07fcc7938e..802db01e3075 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/netdevice.h>
> +#include <linux/etherdevice.h>
>  #include <linux/skbuff.h>
>  
>  #include <net/ncsi.h>
> @@ -667,7 +668,10 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
>  	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
>  	/* Increase mac address by 1 for BMC's address */
> -	saddr.sa_data[ETH_ALEN - 1]++;
> +	eth_addr_inc((u8 *)saddr.sa_data);
> +	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
> +		return -ENXIO;
> +
>  	ret = ops->ndo_set_mac_address(ndev, &saddr);
>  	if (ret < 0)
>  		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
> -- 
> 2.17.1
> 
