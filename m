Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UMrPruuW"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429bYs0Z9qzF3R8
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 08:10:05 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id p84-v6so6912805oic.4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 15:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QESi1UteUokq+ONHv0sotXQTVrOR0tVq8nDZHp4kHzw=;
 b=UMrPruuW+xi9v7EmFDUYc6rj9eYXyjZO31ZJV+o2sO6TZoRLPYcL0ItieuLLpxHVUZ
 sdSqEcy7I/B37cllTSyiDJ6H8MGSIOUu+x7PHK0+8kYgA+N5YK1PJD1JL7HeZ65L97o6
 u0IkaROHMCz+jg4oBqH1MSGKAnZfer9l1ien0edikhXZIo1kMcnkDMnCIIAQBRnF9m5S
 mphcSrxYgT/FlrNJQe84WXzlFr6gGmce9Km0LxYRt0gPjG5MpmsEDcgmWt2YjNLIaPvB
 se6vl4RKuIr98i711gfLxgTXn4a2FcNoMXTxAhAw+KsXBASjtaeoHzCAVzmfrfab8Rut
 +qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QESi1UteUokq+ONHv0sotXQTVrOR0tVq8nDZHp4kHzw=;
 b=sPM6famWEc5HV0UOrUx7067sP78jVAzQldgCCadhxOupfjXay41LjQc82XV311knCJ
 W2p3EkBR+UXElJlyQCgakElaQ/4/B257IexoV/FUvy22KuyfCFYQCzxkNGqAASeJOCXk
 Lt0zcNG5JM/yKS2rBs37RH6YsbKLT2DXSUuKe6Npz4SLar7ZnS/0DxkTE3b3KUNTuvm2
 2ES6b7qPeGi05NP75fhUwy43CQgqUtqDmaziRF84Jq5sNHsnXF01AMHrbzpttPVWP6DA
 0l4fJylv/j5gvTeNbycOdMuf72Yvbh7N84iN38fjyn9bDQfGli5urgUtLUidkrKRssYV
 u2XQ==
X-Gm-Message-State: APzg51Dk26SyXGkDUrD7iHUVTuHhO4Y+4OkGVOIXToibDGc71aGDZR77
 NPzXv098JLrlNwOBV7+rAQ==
X-Google-Smtp-Source: ANB0Vdby4L7IeNi+IAI7l9i3Bz46RA+l4NKFX5Lzoh/VvKdIQn72JnRjoyZ7J5kCWuMz48dsFhZ0qQ==
X-Received: by 2002:aca:4083:: with SMTP id
 n125-v6mr3978356oia.167.1536790203288; 
 Wed, 12 Sep 2018 15:10:03 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.128])
 by smtp.gmail.com with ESMTPSA id q124-v6sm1363878oif.8.2018.09.12.15.10.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Sep 2018 15:10:02 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [10.22.11.145] (50-233-148-155-static.hfc.comcastbusiness.net
 [50.233.148.155])
 by serve.minyard.net (Postfix) with ESMTPSA id 627648F8;
 Wed, 12 Sep 2018 17:10:00 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2] ipmi: looped device detection
To: Patrick Venture <venture@google.com>, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20180911225630.124502-1-venture@google.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <585d1c3a-6121-c20d-f6d6-7567595cd1af@acm.org>
Date: Wed, 12 Sep 2018 17:09:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180911225630.124502-1-venture@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
X-List-Received-Date: Wed, 12 Sep 2018 22:10:10 -0000

On 09/11/2018 05:56 PM, Patrick Venture wrote:
> Try to get the device ID repeatedly during initialization before giving up.
> The BMC isn't always responsive, and this allows it to be slightly flaky
> during early boot.
>
> Tested: Installed on a system with the BMC software disabled
> such that it was non-responsive.  The driver correctly detected this
> and gave up as expected.  Then I re-enabled the BMC software unloaded
> and reloaded the driver and it was detected properly.

The patch looks fine, but I wonder if this is something that is really 
valuable.
I have wondered about this before.

The question is: If the BMC is unavailable, what are the chances of it 
becoming
available by the time you do 5 attempts?  I would guess that is a pretty 
small
chance, which is why I haven't done this already.

You could have something that re-tested periodically, but there are so many
systems with IPMI specified in ACPI or SMBIOS that is wrong, and it would
try forever.  Also not really a good thing.

So I've left it to reload the driver or use the hotmod interface.

-corey

> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2:
>   - removed extra variable that was set but not used.
> ---
>   drivers/char/ipmi/ipmi_si_intf.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 90ec010bffbd..5fed96897fe8 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -1918,11 +1918,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
>    * held, primarily to keep smi_num consistent, we only one to do these
>    * one at a time.
>    */
> +#define GET_DEVICE_ID_ATTEMPTS	5
>   static int try_smi_init(struct smi_info *new_smi)
>   {
>   	int rv = 0;
>   	int i;
>   	char *init_name = NULL;
> +	unsigned long sleep_rm;
>   
>   	pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
>   		ipmi_addr_src_to_str(new_smi->io.addr_source),
> @@ -2003,7 +2005,26 @@ static int try_smi_init(struct smi_info *new_smi)
>   	 * Attempt a get device id command.  If it fails, we probably
>   	 * don't have a BMC here.
>   	 */
> -	rv = try_get_dev_id(new_smi);
> +	for (i = 0; i < GET_DEVICE_ID_ATTEMPTS; i++) {
> +		pr_info(PFX "Attempting to read BMC device ID\n");
> +		rv = try_get_dev_id(new_smi);
> +		/* If it succeeded, stop trying */
> +		if (!rv)
> +			break;
> +
> +		/* Sleep for ~0.25s before trying again instead of hammering
> +		 * the BMC.
> +		 */
> +		sleep_rm = msleep_interruptible(250);
> +		if (sleep_rm != 0) {
> +			pr_info(PFX "Find BMC interrupted\n");
> +			rv = -EINTR;
> +			goto out_err;
> +		}
> +	}
> +
> +	/* If we exited the loop above and rv is non-zero we ran out of tries.
> +	 */
>   	if (rv) {
>   		if (new_smi->io.addr_source)
>   			dev_err(new_smi->io.dev,
