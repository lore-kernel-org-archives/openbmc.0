Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxDc3204VzDqNh
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 17:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ZdJEjDiM"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xxDc25fq5z9sBZ;
 Tue, 19 Sep 2017 17:13:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1505805187; bh=BNwHsN3TbNx+SwxEbQkebt6kyBwOzuohY5PFxoe7wZs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZdJEjDiMZ6zfNYvuGUluT1c2uTS7NZQQgoEmfxb4ehLLkesU3cksR/cLmm/a+6N9G
 dlaFnRKBTHCYrvT6frBgw5cpsm02gDWXoUMoCiThlBUOnPgtmImqil/rmKZkPT3Wdg
 uuDWf9qWV/Aw6N8GBuLtUS5KSl0qcwfvvxF4fk+62Ypt1f4sD0k7ZF2/zhHcclK8/a
 YJm3gwsf40QgojqdfGonJHBqil5Saxvk7chZ3/S+sTG7HREQnyDhkw2QKGnfh9QuKV
 biw02j+TS/53Zkmz5y24pEFVDewx95M43Ne6qlZfKNS/kYoZrqGN4AKYxAUydkcT9W
 bnD+wFee9C2lQ==
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Switch to non-blocking
 for occ reads
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@us.ibm.com>
References: <1505769141-1288-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <aa870aa4-0eac-9d99-0133-eac71f05bec0@ozlabs.org>
Date: Tue, 19 Sep 2017 15:13:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505769141-1288-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 07:13:08 -0000

Hi Eddie,

> It's possible for the sbefifo ops to hang entirely if the system goes
> down (checkstop, etc), meaning that the occ and occ-hwmon drivers may
> hang during remove().

How does this address that though? Your comment implies that a thread is
stuck in occ_drv_read, is that correct?

I see that you're now opening in non-blocking mode, but:

> -	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
> -	if (rc < 0)
> -		goto err;
> +	do {
> +		rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
> +		if (rc != -EAGAIN)
> +			break;
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule_timeout(msecs_to_jiffies(OCC_CMD_INCOMPLETE_MS));
> +	} while (!p9_sbe_occ->cancel);

- the only way that you hit the !p9_sbe_occ->cancel condition is if
we've run the ->remove callback, in which case we *definitely* shouldn't
have threads still referencing the device. There seems to be nothing
preventing p9_sbe_occ from being free()ed underneath you.

If this patch works, it suggests that there's either a
reference-counting issue, or a memory leak.

Regards,


Jeremy
