Return-Path: <sam@mendozajonas.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xht5j39P3zDqHj
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:37:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="lQXnGbAD"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lF6jDvHy"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 26AFC217C3;
 Wed, 30 Aug 2017 00:37:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 30 Aug 2017 00:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=vxQM5DxBBGpLzSwpva4DQ6u1C1pHngTflkwdxMnOjtw=; b=lQXnGbAD
 qajWvHD6QbsTSywAD7PVRsAO7hebauypt93d0jX/ToerI5ikfLsROSo9KfUIOe6C
 38g4UU437Ukcoc0xt5VTCtaqD8d/VyHLFfmx0CASPMCLP5PoWv3nscafGEFBSrOn
 KRGzuibtpXfli7zPgwQchKoMAODAsw6tMitSTDiqK9EjLiyCSd8paZeiKd+K3yyy
 wP1ud3HeRdMnela9+vxqXsSneYTbokjpd0VKQ/wCFDdFEkwOgvA2Ldqam2SfMOFH
 s0ppLq8A2eHENwACHZ8TO6jtHq6X7XM87vYnwQfFPp1UlZtG4VBfschgL6hRur0o
 I2J1N9zaemu1hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=vxQM5DxBBGpLzSwpva4DQ6u1C1pHngTflkwdxMnOjtw=; b=lF6jDvHy
 Fge8Nk+bM1AbCWXNi4ZRzqdoAHPgnsx5gX4WC0DrSjlBLzqH6YhH1pSFd4wizne8
 nAJqTcFKzAv2AHoNVBjYmk79lAiiN3aPaaFU+tDFGW0vSLNYLHdToiCe2v8zY3Wn
 W1h0Itwtc1YR8jGGO007kIS1UyyR4KqchI/uPNsYMM0TlPG5K/Ewlo7UZPYJIWXX
 sXFWfSmAil+GiOus+kmatO4RUx4txcD3yqay9cT/TEW2UlUHdKlzZT2fL2XQZqd4
 HRNBptXxcv4UeedipcQe96v/f34PaR+c8DiEJJnAWEU2X2XMTU5bxJ3T3Mfs3m90
 KgkNvf1B+8iE4Q==
X-ME-Sender: <xms:B0GmWaPuzRDkB9WT6ypn0VTZJVk-V33KcnC5plhmNjOrUYye_h4HTw>
X-Sasl-enc: ii2zTRc3+8XareQowwHjFgkeukWeJnbFbPcvjARjpelo 1504067846
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 901512492F;
 Wed, 30 Aug 2017 00:37:24 -0400 (EDT)
Message-ID: <1504067841.1361.11.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v3 0/3] NCSI VLAN Filtering Support
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org, 
 gwshan@linux.vnet.ibm.com, ratagupt@in.ibm.com
Date: Wed, 30 Aug 2017 14:37:21 +1000
In-Reply-To: <20170828.165001.1442421762159241248.davem@davemloft.net>
References: <20170828061843.24349-1-sam@mendozajonas.com>
 <20170828.165001.1442421762159241248.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 30 Aug 2017 04:37:31 -0000

On Mon, 2017-08-28 at 16:50 -0700, David Miller wrote:
> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Date: Mon, 28 Aug 2017 16:18:40 +1000
> 
> > This series (mainly patch 2) adds VLAN filtering to the NCSI implementation.
> > A fair amount of code already exists in the NCSI stack for VLAN filtering but
> > none of it is actually hooked up. This goes the final mile and fixes a few
> > bugs in the existing code found along the way (patch 1).
> > 
> > Patch 3 adds the appropriate flag and callbacks to the ftgmac100 driver to
> > enable filtering as it's a large consumer of NCSI (and what I've been
> > testing on).
> > 
> > v3:   - Add comment describing change to ncsi_find_filter()
> >       - Catch NULL in clear_one_vid() from ncsi_get_filter()
> >       - Simplify state changes when kicking updated channel
> 
> Series applied.

Thanks David,

The kbuild bot caught a build error where the add/kill callbacks aren't
defined without CONFIG_NET_NCSI:

>> ERROR: "ncsi_vlan_rx_kill_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
>> ERROR: "ncsi_vlan_rx_add_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!

It's a quick fixup to patch 3 as below, would you like me to send it as a v4?


diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index 1f96af46df49..2b13b6b91a4d 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -36,6 +36,14 @@ int ncsi_start_dev(struct ncsi_dev *nd);
 void ncsi_stop_dev(struct ncsi_dev *nd);
 void ncsi_unregister_dev(struct ncsi_dev *nd);
 #else /* !CONFIG_NET_NCSI */
+int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+       return -ENOTTY;
+}
+int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+       return -ENOTTY;
+}
 static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
                                        void (*notifier)(struct ncsi_dev *nd))
 {
