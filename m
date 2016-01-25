Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id BF3F11A023C
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2016 00:47:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=VmDNQI3J; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 9D96F458081;
 Mon, 25 Jan 2016 05:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=yyi2uyy1e5h42xcjnscqiaAeJRo=; b=VmDNQI3JetOo6lR7x6X+F4FAqj6
 FvIuKIScYoUFquEGJWOKzgwUgWRJh94ioEuCCc5CPxEqGug3G56G4ouluT/BPyRN
 Eq7gHdfhXz1/hUxNYLc6c9E/UxCmi3kKb/lGhgQYG5Z8xCIhiYFqBodKFpRXdFTd
 mNB/yOfSqoBlk2Tg=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 7046545807B;
 Mon, 25 Jan 2016 05:47:33 -0800 (PST)
Message-ID: <1453729650.2773.69.camel@aj.id.au>
Subject: Re: [PATCH linux] rtc: aspeed month is off-by-one
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 26 Jan 2016 00:17:30 +1030
In-Reply-To: <1452732624-17345-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452732624-17345-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452732624-17345-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 13:47:36 -0000

Hi Milton,

On Wed, 2016-01-13 at 18:50 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> Norm reported hwclock set the date one hour

'hour' here is meant to be 'month'? The patch only touches the month
calculation.

>  different from what it
> read back.
> 
> The mktime64 call takes the month as the 1-based counted month not
> the 0-based months since January like struct rtc_tm and struct tm.
> No adjustment from the harware

WARNING: 'harware' may be misspelled - perhaps 'hardware'?
Otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>  is needed.  Also mask off a few 0 bits.
> 
> Reported-by: Norman James <nkskjames@gmail.com>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  drivers/rtc/rtc-aspeed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
> index cfb5ee0..1a5bbd1 100644
> --- a/drivers/rtc/rtc-aspeed.c
> +++ b/drivers/rtc/rtc-aspeed.c
> @@ -48,8 +48,7 @@ static int aspeed_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  > 	> sec  = (reg1 >>  0) & 0x3f;
>  > 	> cent = (reg2 >> 16) & 0x1f;
>  > 	> year = (reg2 >>  8) & 0x7f;
> -> 	> /* struct rtc_time counts from 0 to 11, but hardware is 1 to 12 */
> -> 	> mon  = ((reg2 >>  0) & 0x3f) - 1;
> +> 	> mon  = (reg2 >>  0) & 0xf;> 	> /* mktime64 and hardware use 1 = Jan */
>  
>  > 	> rtc_time64_to_tm(mktime64(cent*100 + year, mon, day, hour, min, sec),
>  > 	> 	> 	>  tm);
