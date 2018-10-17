Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="q0tYtFrG"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d4Qn7xqT"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ZcBM3V36zF3Kr;
 Wed, 17 Oct 2018 13:51:07 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 81B76220C1;
 Tue, 16 Oct 2018 22:51:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Oct 2018 22:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=9RDa/sfA57LjVRNoAAfNFfkqop
 cgjNBz6JwAD15+fyA=; b=q0tYtFrGWq798USTuL+11JftcpK8/Wnoej0xZToqgK
 X7FhAyqB09fzaIuK0f2mGgMu/V4q3x9QAsPpjsJXbHm2gGPXqmKuBBdyK7m1Ss0p
 8WAm3JP4C0fISHEv2C5wZ5QjCf1rC2N9mLIetxG/54FoW+6IQBmKfB6cLDmSULJO
 6jv1PJBgK5AAgby2TMweq/PtNFgs7Ki8Uv+SgtQGos427c9j5xkeLgQafouZcO6v
 yIv1+29XNGv/sULO5/8EbtXYNhjsFbgPsgHndNuQHSFEeqrJwZy1CLlApf21l1KU
 kQoGgzzWxhNcXmJjBYkdtmPObEM8AuFUCGrJ45cNk7Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9RDa/sfA57LjVRNoAAfNFfkqopcgjNBz6JwAD15+f
 yA=; b=d4Qn7xqTJvnzWsNkZ6x3i/f/unOwk6oRG0mkbI7EAG5UmwgQGBr/h45T8
 qnKzXQCpQaL+CkIx07hEOfB3gDbqE9Jxq2wJCsJBsgdoroBrxdN5VCDufGeJUiKr
 6oANWUCbIZi+yzWKcABEF+Mt6ESyrhIckSMh3nAdFNalvlK3lWJkX3ayF+1mWt1d
 xQVg+YVSf3Y4bXSCNsfXpjyysfJCDDNxaJZbJPh9tpuMfrNPQ7XTiNiBln/Qc05a
 v6tsa8tP1C4rs8iC6g+2fp6HOHmJkS+Dtv7HLsVylnwVVTpercR1bUK8ZcZyGCtO
 Uz3p9V/VmUuZFnmuEIHBLMQ3GNgvQ==
X-ME-Sender: <xms:l6PGW0dANLAh8oJtwjDikr2ADj8tV5TYY4MFYk8wMQ3bp0XUCfa6KQ>
X-ME-Proxy: <xmx:l6PGW0pStml1VN_r4f-SGUIOz4mfqtN0qgUJ9tV9AbKN-H6Zll5vcg>
 <xmx:l6PGW8vImyiXpBkQF5XdHqb9uRiUYzUg3p54lXG0NEmlEIyffG7UNw>
 <xmx:l6PGW3Xms97h_6rSuJMvA1N1rKBrkNAc6XNW2gxA1zTyduqAniKzFg>
 <xmx:l6PGWw2yVwnooHfOlhwjYa96nrsbsyXbKLJUp8W1GmoCWg1ODucm4w>
 <xmx:l6PGWwfbXMl3nRsvyTlObMIZPKwpapIgMzyTeTb0vxA_AvLfUWOTxg>
 <xmx:mKPGWwo7gCIxA0lYF5Vt7he8krP01jtJVmCXKgF3McKOm9xIC77Utw>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B532102EB;
 Tue, 16 Oct 2018 22:51:00 -0400 (EDT)
Message-ID: <ef5233889f290ec62d0f371c8e05689535740d87.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v5] net/ncsi: Add NCSI Broadcom OEM command
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "David S. Miller"
 <davem@davemloft.net>,  netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, 
 Justin.Lee1@Dell.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org
Date: Wed, 17 Oct 2018 13:50:57 +1100
In-Reply-To: <20181016191319.1909502-1-vijaykhemka@fb.com>
References: <20181016191319.1909502-1-vijaykhemka@fb.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 02:51:10 -0000

On Tue, 2018-10-16 at 12:13 -0700, Vijay Khemka wrote:
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

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
