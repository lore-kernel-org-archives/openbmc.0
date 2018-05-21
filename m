Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lfZZm02f"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DQnpSX+w"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q6hD3MhzzF0wk
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 15:26:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EDFFF21AE4;
 Mon, 21 May 2018 01:26:17 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 01:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=unBjkAEpwxCvVFYJ98t9Sck7SKP2t
 K1x2MzEYqFvwIA=; b=lfZZm02fVM/AJjbnRt/9K3UZxsSo4Y/D2WqOyYJSXspVL
 vDc+YGTEpaYN7HqRv9JW14iGjrgrenZMGX88/d6HORqw0xmh/rFkQdP0JVS536KS
 CjD82p7hGFdxPad55Jymss+vcXHtbzZHQij0kvxhtSF/Txozg6N+m8nFgRU8QocA
 5SdHL8W8XZP9i6gXIZhnfhEZhs9vtUFZ6RipfpZmYaUgqDBJyyCbylVC9oXkQlR2
 aH0JEt8ggUiifDxGL984CGXGIGHNALg1twlF4AB9xPEAZxOL7oHng/kfMEybgbUQ
 jFkvL+2/tImeN9cSZonRCWV4hmVx/7ax0YPkNsNkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=unBjkA
 EpwxCvVFYJ98t9Sck7SKP2tK1x2MzEYqFvwIA=; b=DQnpSX+wMUHzBOakKsUc6E
 BrX9v0s6XwKss4aPsw+4pAUUu2MUPqhSylJOKh8h/h7g+02QLBS7PALH18FrOpes
 ILsxOv3d4tjDByS9k9evYgOFf+gQ7pQoZP6eAwTm43TFu+8wuzyrkUA9cvEuBfZb
 YUsjgaMRw1UsWXi8iF0SGbIK6Aoge+ltFCJC6xyqSZes4BRJ4UhLf8Eo/tu3kw5q
 D6xl4ceSftT7Jt4NMRMnk3Tou+7blWBrBDGCDBUUehL51JzB16p7cWcn9RZtCh+w
 /OSKH9J25Rk1RX+Omb6plA4qdiPbE5MkTR9eJHyoljCloimakPNB5bylmUM40cIA
 ==
X-ME-Proxy: <xmx:eVgCW7zsYQdI8fx6W67Bxqwtoy-R6Y62UKX5SyKGfD_GOdvQfxPOwQ>
X-ME-Proxy: <xmx:eVgCWzeq-5iIBFjLh6vPU0v8Vq5tJF_D27N344kz2mOQZfJp8I10Lw>
X-ME-Proxy: <xmx:eVgCW3IsowJTHl7NFK8AAMxynoLkIrmIh2iXxbvHDvwMQobaPPfF1g>
X-ME-Proxy: <xmx:eVgCW0HWRnhKZm9Lq-_AWbROlHT1dMdTUZzH-bm-VpGUnOf8NjX5gg>
X-ME-Proxy: <xmx:eVgCWxqLK1rqZdMA2dq__TWPfUbOqVXiUrtufVXtz9X_-TDzFNwHtQ>
X-ME-Proxy: <xmx:eVgCWwN497_Qn0dCKytuA3Pq7SqBgyvXchwitAMMf05_gL0FsgKPdg>
X-ME-Sender: <xms:eVgCW2eHWWchaqf2BKAG0mKFVQI2P9H6vWulWCF724HLG6PFHhGafA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8B4C740DC; Mon, 21 May 2018 01:26:17 -0400 (EDT)
Message-Id: <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Date: Mon, 21 May 2018 14:56:17 +0930
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
In-Reply-To: <20180518013500.18005-2-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2018 05:26:21 -0000

On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
> Similarily to the new retry on SBE fifo errors, this adds
> retries if the data we obtain from the OCC has a bad checksum.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  drivers/fsi/fsi-occ.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index f4b2df7a3084..7a5afa78fb6b 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -652,7 +652,7 @@ static void occ_worker(struct work_struct *work)
>  	struct occ_client *client;
>  	struct occ *occ = container_of(work, struct occ, work);
>  	struct device *sbefifo = occ->sbefifo;
> -
> +	int retries = 0;
>  again:
>  	if (occ->cancel)
>  		return;
> @@ -720,7 +720,10 @@ static void occ_worker(struct work_struct *work)
>  	xfr->resp_data_length = resp_data_length + 7;
>  
>  	rc = occ_verify_checksum(resp, resp_data_length);
> -
> +	if (rc) {
> +		if (retries++ < OCC_COMMAND_RETRIES)
> +			goto again;
> +	}

How should this interact with the OCC error handling mentioned in my reply on the previous patch? I feel like a checksum error is a bit of a grey area - probably caused by the transport, but possibly due to OCC firmware bugs as well? If it's the former then retrying independent of the OCC error handling protocol is probably okay, but if we're trying to catch the latter then maybe we should let this be handled as part of the OCC error handling code?

Eddie?

Ben: Did you actually hit cases where this path was triggered? There was the corruption issue with simultaneous LPC cycles that turned out to be issues around level-shifters and synchronisers, was that it?

>  done:
>  	mutex_unlock(&occ->occ_lock);
>  
> @@ -732,6 +735,7 @@ static void occ_worker(struct work_struct *work)
>  	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
>  	list_del(&xfr->link);
>  	empty = list_empty(&occ->xfrs);
> +	retries = 0;
>  
>  	spin_unlock_irqrestore(&occ->list_lock, flags);
>  
> -- 
> 2.17.0
> 
