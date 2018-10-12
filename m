Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="pkNTy5++"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jAF8l7BP"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WX99302YzF36K;
 Fri, 12 Oct 2018 13:39:25 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8D7C5C32;
 Thu, 11 Oct 2018 22:39:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 11 Oct 2018 22:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=yUPzLmBZLxD2PcPM0UahUlMYew
 kF2A2Y5x6OjUkMBkw=; b=pkNTy5++HWJrb597xfrDLiQ57veQbkhddcCFkjJYqi
 9yX4GSYW4zYg5ROR1+UDzqhOqTNNE5Hkmpgg2k3/DRaEfQg44ZaXnAylJXAcDWOs
 xIew1ZRwE6BJi1ym7lhpKBqOuNSyHJpKjxA7S3HA2F8UXNgoDcOX/R5rx/v1P3qh
 Z+CwyI93oiBtA3gTUrI3UMBJBIg9QwQsE2hVUsjnIgrgaVB44fxv7TSYcr5WGIAp
 wUpUM5/I74J835tpKXevBnNc10kTSHYiC8IXbiFRTS8hb0w/1zyhkFK8FcTkXX1+
 4ppJ1EH88pV0UL1jwUje3q5AgZ3jYMYPn0JffixQhD9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=yUPzLmBZLxD2PcPM0UahUlMYewkF2A2Y5x6OjUkMB
 kw=; b=jAF8l7BP3pGn5xvTCC9c0FZfZ8GM5aqsky0JDT0IbEVFUEJlXtHIVfD4g
 aSLCx1Z4l+coR5yiVM5yUw6dQcJey3OdjJkaVt77OQVX7l2q8VyQmxPJBOOv11tz
 e0eE7aFzvY/In2vF4cOekrItAgurY/4AfQ7iu8679uItznV7ZgHx6t++4Dv+/x2O
 2BRdB64IbkYBksQ4fa5Vrpk1UESLgtGBl2+yDSgN68u2fnHNLvTD7Lf+4fAPQw/U
 CAP30ubuBB+yK/T+i9IzuA8C0b1Pmudt1vYKsqZIzDjVDlCKUqz+3i8NrDGxHLZI
 Ek4sjWmq5yUyoZDtFD8gJTS43+9Wg==
X-ME-Sender: <xms:WAnAW9nCJO1JQBFE4-0yCrCXu0uO2fnB3RdvSSIbNlEFj8N9t1eXjQ>
X-ME-Proxy: <xmx:WAnAW8RjOSCDElSOw7LYHplDFLkcbWBjzCkNBygRAl2jc62PfkGvqQ>
 <xmx:WAnAW0Aw_fIGhAU-oVjakaKLXJ1bBuL9pXfgeR36xfZGDpl5icTznA>
 <xmx:WAnAW7nZKNcEWjOvVXDaGgd2rwDVd3-k244ivHFhdu6XhcPZqDaFpA>
 <xmx:WAnAW0kvs19jBbkX1PODbRHznKgblds6a0m1orecMKl7rZcH8EdK6w>
 <xmx:WAnAW4dZQRaV5OtJcA9LYgJIzwWvKLv_I6HlIPB0sCgcLIcGUZd9Uw>
 <xmx:WgnAW74P7_sVnSsP-vWu_oaF-JBI0bOwUjQ2u7b_sIZsdhArBmi9sQ>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F622E455F;
 Thu, 11 Oct 2018 22:39:17 -0400 (EDT)
Message-ID: <d982edf8e0c774afaf5e77493e53c8ecb7b7a4b1.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v7] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Justin.Lee1@Dell.com, davem@davemloft.net
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, 
 openbmc@lists.ozlabs.org, amithash@fb.com, christian@cmd.nu,
 vijaykhemka@fb.com
Date: Fri, 12 Oct 2018 13:39:15 +1100
In-Reply-To: <cd371b0265b74889a10241a6af7e4843@AUSX13MPS302.AMER.DELL.COM>
References: <cd371b0265b74889a10241a6af7e4843@AUSX13MPS302.AMER.DELL.COM>
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
X-List-Received-Date: Fri, 12 Oct 2018 02:39:26 -0000

On Thu, 2018-10-11 at 18:07 +0000, Justin.Lee1@Dell.com wrote:
> The new command (NCSI_CMD_SEND_CMD) is added to allow user space application
> to send NC-SI command to the network card.
> Also, add a new attribute (NCSI_ATTR_DATA) for transferring request and response.
> 
> The work flow is as below. 
> 
> Request:
> User space application
> 	-> Netlink interface (msg)
> 	-> new Netlink handler - ncsi_send_cmd_nl()
> 	-> ncsi_xmit_cmd()
> 
> Response:
> Response received - ncsi_rcv_rsp()
> 	-> internal response handler - ncsi_rsp_handler_xxx()
> 	-> ncsi_rsp_handler_netlink()
> 	-> ncsi_send_netlink_rsp ()
> 	-> Netlink interface (msg)
> 	-> user space application
> 
> Command timeout - ncsi_request_timeout()
> 	-> ncsi_send_netlink_timeout ()
> 	-> Netlink interface (msg with zero data length)
> 	-> user space application
> 
> Error:
> Error detected
> 	-> ncsi_send_netlink_err ()
> 	-> Netlink interface (err msg)
> 	-> user space application
> 
> 
> Signed-off-by: Justin Lee <justin.lee1@dell.com> 
> 

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
