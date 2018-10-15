Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="xaZgY2QD"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="unMpdg70"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YMLf73hfzF1Pp;
 Mon, 15 Oct 2018 13:08:57 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 37C7321F16;
 Sun, 14 Oct 2018 22:08:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 14 Oct 2018 22:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=sSLSi9K9Fj5PV5eH7SmuDNab5+
 W2ZA70HJWB8BjqOhc=; b=xaZgY2QDF1rzuUogqFJgpMQoS8bCxqs31ytAb8dYgq
 Fr/I6fpLndOXlCVbRMi6HumiUAc/9aQDfbVphqYG8c60zH8fzU6RODujNfVt+Z1/
 /7AmgUPAGcSbLy8g8QV1uuS2Rh4ST0OEEcrtJ8Zodjn8AOytjy2DQ9wj1Xnw5jPq
 013rqbp311Rjzvng/prpzhZN9bCGQh2lYfj2rK9RUnLfGOGxAyVfD9dvaopdnaK3
 gnHjZ1z3leoWn7IP79L++c90/dVfhZfQeJ2goycuqednBW/Su94mWW6uevDmvEaJ
 r9WVkmLa/q3U6lBmEpgMRqhMrSnJW6wwtJ/CywJXsnaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=sSLSi9K9Fj5PV5eH7SmuDNab5+W2ZA70HJWB8BjqO
 hc=; b=unMpdg70YeRQkFyrl2eUm78WXUyBtdK+2wc6SrFYEy7Kw2AvhpxrQNqcY
 DfH6fQ2alZ4TS7b4vGdqg69/SFoLzdN7WJOxRoPCTUljQV1lS3s+djjjhYpNVipG
 WV5nykx2Zmbee3ZLpMMa1F6jvmln2Gg++4DAcUPbk/u+kCOnHC6heuO5+Edb/L2D
 bna47vDNgX+6PQBdGiduzkBfnmJvKaKrqF/NS/cob5zt+OIPGux3oAdNwMJHR2Gn
 vLsHvypH6DtM5xpIzDtctOUDT8hmjWUzB3LpP3TpvQRI+BQEDTITVwCglxOZ7kfu
 man5w7WlJlX59S9HlcEzHXNwmngeQ==
X-ME-Sender: <xms:tPbDWwKVWxnjl1MfGIi8u1Yukk4GOWS3wrPHand-Y1CojtTyvhvfFw>
X-ME-Proxy: <xmx:tPbDW4aCmN4-BSSINTobOaPYShuuF0baYH_DIAXbC0qmty2aMLCvlw>
 <xmx:tPbDW2f4MIQEQ2cPOVsTWLJ_hKc2qiB5zfCBXDmIFJ5qIkNbjaP7XQ>
 <xmx:tPbDW9klGPX7F70P0nglaRZY466iOqMXsE_-9Nw0MUq4_eS_gyOC3w>
 <xmx:tPbDW-2KV_hdfGS7dUwQqwN_Eb4GtoFzjDHtNB1zCMzdIawKOzUnBg>
 <xmx:tPbDW-d9U5C0mR4bFgi_WNbtv8OanpWF4ASe3b5tmlk87mpTuabj9g>
 <xmx:tfbDW-zj_mEd8SvYrsTUVRm1xezRwIX4xhc92M0BmCUWC2Vvru5L-A>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56DC4102DD;
 Sun, 14 Oct 2018 22:08:50 -0400 (EDT)
Message-ID: <69cae9d44cbebb2cd4f468dc710d6a97210af835.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v4] net/ncsi: Add NCSI Broadcom OEM command
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "David S. Miller"
 <davem@davemloft.net>,  netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Date: Mon, 15 Oct 2018 13:08:46 +1100
In-Reply-To: <20181012182008.1665690-1-vijaykhemka@fb.com>
References: <20181012182008.1665690-1-vijaykhemka@fb.com>
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
X-List-Received-Date: Mon, 15 Oct 2018 02:09:02 -0000

On Fri, 2018-10-12 at 11:20 -0700, Vijay Khemka wrote:
> This patch adds OEM Broadcom commands and response handling. It also
> defines OEM Get MAC Address handler to get and configure the device.
> 
> ncsi_oem_gma_handler_bcm: This handler send NCSI broadcom command for
> getting mac address.
> ncsi_rsp_handler_oem_bcm: This handles response received for all
> broadcom OEM commands.
> ncsi_rsp_handler_oem_bcm_gma: This handles get mac address response and
> set it to device.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  v4: updated as per comment from Sam, I was just wondering if I can remove
>  NCSI_OEM_CMD_GET_MAC config option and let this code be valid always and
>  it will configure mac address if there is get mac address handler for given 
>  manufacture id.

Hi Vijay,

We can look at handling this a different way, but I don't think we want
to unconditionally set the system's MAC address based on the OEM GMA
command. If the user wants to set a custom MAC address, or in the case of
OpenBMC for example who have their MAC address saved in flash, this will
override that value with whatever the Network Controller has saved. In
particular as it is set up it will override any MAC address every time a
channel is configured, such as during a failover event.

We *could* always send the GMA command if it is available and move the
decision whether to use the resulting address or not into the response
handler. That would simplify the ncsi_configure_channel() logic a bit.
Another idea may be to have a Netlink command to tell NCSI to ignore the
GMA result; then we could drop the config option and the system can
safely change the address if desired.

Any thoughts? I'll also ping some of the OpenBMC people and see what
their expectations are.

> +#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
> +
> +/* NCSI OEM Command APIs */
> +static void ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
> +{
> +	unsigned char data[NCSI_OEM_BCM_CMD_GMA_LEN];
> +	int ret = 0;
> +
> +	nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
> +
> +	memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
> +	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
> +	data[5] = NCSI_OEM_BCM_CMD_GMA;
> +
> +	nca->data = data;
> +
> +	ret = ncsi_xmit_cmd(nca);
> +	if (ret)
> +		netdev_err(nca->ndp->ndev.dev,
> +			   "NCSI: Failed to transmit cmd 0x%x during configure\n",
> +			   nca->type);
> +}

As a side note while unlikely we probably want to propagate the return
value of ncsi_xmit_cmd() from here; otherwise we'll miss a failure and
the configure process will stall.

Regards,
Sam
