Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="mw8rMbPI"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lwZooHHW"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VxvK2z5nzF35P;
 Thu, 11 Oct 2018 14:55:24 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E1A621E32;
 Wed, 10 Oct 2018 23:55:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 10 Oct 2018 23:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=PXWVq5wCxBq2IJFYd3NH78OoPK
 i2CmsM7NJolVnKtKc=; b=mw8rMbPInpEwr2WSeCjBI7fUVYBZykATPmvlcQTnnT
 LSECibxdYvfI3aIeohRFNH1URTrbJG14BQp7PDz3b8H53NUSq9nhvlD0MG8eowFr
 Wx9W7zCcSgCGdClXzhaA0TGihedF3lR/6MgW/oK95JHITQRBimg9XkApkWYPfhQg
 rZlCiJ/ymO81WecrwYPGNwZs3eIzqdfPLneM7DL4Tt/IoqCdt0+IyxEUpyRaU7xO
 3BDkO7WUT7SWyl1u+/8ppJTXVjmgjfNPbbrdYcDznHf8uaQx7ZvuUbhM6uYbC9aD
 UDbhVdO9gtFc5SaVvbtXnAY0xE8JwMAgDxyy+gg/mHUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=PXWVq5wCxBq2IJFYd3NH78OoPKi2CmsM7NJolVnKt
 Kc=; b=lwZooHHWTxSw2zq8lbkIq7w7RC9yFRMEW4Ltt9p+vZWu4H+9W8ZvHwOvx
 fSRETK3S2S4po+jjWSE7mmJ35sPhbpR0+oa/XWVs20IyozAaH5i141EUV5+BftGU
 thGheqtBBbYy0Q/KbGEXaGQ+i9jaTg1eRWMM1gVBZbGAvdp+izqrVPisnZHM0fGT
 +2jnkMAdcPJzGuz57MS2/uXjifPyYD3aDzILOuiNoVslFgEO1/dpwepbXffflyab
 gaeb3Qjnel4gN0NVAVLpM7ucvTtHeycTfqeWPb4PMhaDxNmlYLEF3uDsGtwvnwXa
 KkM8jchmLAq3s53jhvKatE2zS6xIQ==
X-ME-Sender: <xms:psm-WyviJv_JuhiLr_Q_WapWgtYCNXii49tREKb2erFJVVuJOpFMZA>
X-ME-Proxy: <xmx:psm-W6ZHuWi3aX2C6C6OgjRii6szIQlygdVOPSy_90qiiLte54kOCw>
 <xmx:psm-W9vTJ0mD1z4iKaZRgMdXQoX9LD4gnzFSqJeSZGXQVbYy9Ld-rw>
 <xmx:psm-W8nZuiNWDES_DwIZzT_-uvYIIRxiEcRPVaU8vpMPAcbynBQqoA>
 <xmx:psm-W3QCt_Pbjx9Ol5NDXMeLx1hVmOZ_EJR-uPnX2lCro3Wff6lgeg>
 <xmx:psm-W-PYqNx89GbYpBiMeNDscMgZBXAQpZMqFfEZLB3GaksJWxgRzQ>
 <xmx:psm-Wxp66su9TExCFAaAeBNKWWxxY7faRfOvpKPEEg2doV2gNDUw5g>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44C11E44DC;
 Wed, 10 Oct 2018 23:55:15 -0400 (EDT)
Message-ID: <e26c7aa664a2dad4f5bcf4efaa1b3eb655548b01.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v5] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Justin.Lee1@Dell.com, joel@jms.id.au
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, 
 openbmc@lists.ozlabs.org, amithash@fb.com, christian@cmd.nu,
 vijaykhemka@fb.com
Date: Thu, 11 Oct 2018 14:55:08 +1100
In-Reply-To: <245b32d9a3dd463f9334b9704b639ec4@AUSX13MPS302.AMER.DELL.COM>
References: <245b32d9a3dd463f9334b9704b639ec4@AUSX13MPS302.AMER.DELL.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 11 Oct 2018 03:55:30 -0000

On Wed, 2018-10-10 at 18:11 +0000, Justin.Lee1@Dell.com wrote:
<snip>
> +
> +	len = nla_len(info->attrs[NCSI_ATTR_DATA]);
> +	if (len < sizeof(struct ncsi_pkt_hdr)) {
> +		netdev_info(ndp->ndev.dev, "NCSI: no command to send %u\n",
> +			    package_id);
> +		ret = -EINVAL;
> +		goto out_netlink;
> +	} else {
> +		data = (unsigned char *)nla_data(info->attrs[NCSI_ATTR_DATA]);
> +	}

I only just noticed this, the call to nla_len() can cause a null-dereference if
the NCSI_ATTR_DATA attribute isn't present; we need to make sure it exists
before accessing it in info->attrs.

eg:

root@ozrom2-bmc:~# ./ncsi-netlink -l 2 -p 0 -c 0 --cmd
[   81.399837] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[   81.409092] pgd = ddaa9fa6
[   81.413084] [00000000] *pgd=9702c831, *pte=00000000, *ppte=00000000
[   81.420729] Internal error: Oops: 17 [#1] ARM
[   81.426447] CPU: 0 PID: 1028 Comm: ncsi-netlink Not tainted 4.18.8-sammj-00144-gbc129f31bfa5 #12
...
[   81.874434] Kernel panic - not syncing: Fatal exception

Cheers,
Sam
