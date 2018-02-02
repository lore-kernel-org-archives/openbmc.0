Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::242; helo=mail-ot0-x242.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qu1qFT7U"; 
 dkim-atps=neutral
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXd6y0KpGzF0Yh
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 11:25:29 +1100 (AEDT)
Received: by mail-ot0-x242.google.com with SMTP id r23so17212983ote.8
 for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2018 16:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=eobFmH5JytXkTrmXt5mRn6/mcYlilNZ6ZDiMv7LQRRI=;
 b=Qu1qFT7UWnCIfF2pj+D2klE0oz4PSYlNQGbx77veazIlxp4kPA+ECGsS3yrJ/PnTDL
 TNlVFzOKMO1+XsjFGcK/Rc6rak4zpUdE2nwytt6io1zdrTcBN5eKON5t1abVrUJD6AZ1
 dZaNzN4kb9sLmYs+V6EF2G+NfIQwe0z/pc0RyTj8M6mLGJcDxF8yvaQ/e9nZsLX7nvU3
 gTD0Q1B6oZOi2OsmeYZRuqxUlfa0b9bcbqolVNS5z/njGqUt8EZdTlvEPTu/bfmaDSkE
 WpVkHMv9kATQaBJ5uUASQOICWeVSmLmGHe6LYG41nlXB/WJ//4FxILTeIiH1FQXoR3RB
 IcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=eobFmH5JytXkTrmXt5mRn6/mcYlilNZ6ZDiMv7LQRRI=;
 b=uLe+ZYmCkIo2ADFyFlTuqzsIQsQ7CBp76INPvKBFuBzeS76lC8IPej5f8iQrqmVNLd
 ogiul3D9lbfwim12+OsED+Bu+BQi67R3OVxpJyfmcNqOMfjTXoCsyCAqvHH1A41sxGrP
 M+ZlcJHlvWbKlFXhR4TOvC/tm8S2nK3dlaEu/jCU4vn44cBum5jCX4SzyJzi+KrQznZj
 dx4G3k+Co1hOfPs5MPI8P2YeCxE+/nOTi56WE9FKRiglHMoy/5vChEmZt3y3ZwD1xIQh
 epjmtJH5KGeliXDiEN5h+dNR3FpseR9FpO9Fsq2clgbNThyaA0UmSq0TEgI2I4KjUuZf
 3hKg==
X-Gm-Message-State: AKwxytfxMqIbUnTYhl3Bq+zRESPPxsQA9naYE4z2WzdsX/4YW/0xCrOb
 Rc2GsL1n3KKYf3mIV63FpQ==
X-Google-Smtp-Source: AH8x226mLG3u3DI5FiJKyhx5+PWWH7HioCqL0qw+MBDTL58P56CZcKG0lsT+H7xeolvgbb3tYKKFEw==
X-Received: by 10.157.51.154 with SMTP id u26mr10611246otc.119.1517531126529; 
 Thu, 01 Feb 2018 16:25:26 -0800 (PST)
Received: from [192.168.27.3] ([47.184.168.85])
 by smtp.gmail.com with ESMTPSA id m9sm453963otc.5.2018.02.01.16.25.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Feb 2018 16:25:25 -0800 (PST)
Reply-To: minyard@acm.org
Subject: Re: [PATCH arm/aspeed/ast2500 v3 1/2] ipmi: add a KCS IPMI BMC driver
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, minyard@acm.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1517474936-15308-1-git-send-email-haiyue.wang@linux.intel.com>
 <66b3a8f8-b477-6ada-5ced-944a5b67edd3@acm.org>
 <062c4b58-960a-5023-be75-9b7cd1163783@linux.intel.com>
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <af22ee18-3b8c-0c47-72bc-053d2b7e738e@gmail.com>
Date: Thu, 1 Feb 2018 18:25:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <062c4b58-960a-5023-be75-9b7cd1163783@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 00:25:31 -0000

On 02/01/2018 05:56 PM, Wang, Haiyue wrote:
>
>
> On 2018-02-02 04:32, Corey Minyard wrote:
>>> +static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
>>> +{
>>> +    u8 cmd;
>>> +
>>> +    set_state(kcs_bmc, WRITE_STATE);
>>> +    write_data(kcs_bmc, KCS_ZERO_DATA);
>>> +
>>> +    cmd = read_data(kcs_bmc);
>>> +    switch (cmd) {
>>> +    case KCS_CMD_WRITE_START:
>>> +        if (kcs_bmc->phase != KCS_PHASE_IDLE &&
>>> +            kcs_bmc->phase != KCS_PHASE_ERROR) {
>>> +            kcs_force_abort(kcs_bmc);
>>> +            break;
>>> +        }
>>> +
>>
>> The spec says you can do a write start basically any time and the 
>> state machine starts over. I know I kind of went back and forth on 
>> this in my previous email, but what you had before is correct, I think.
>>
> So change it to the bellowing code is OK now? :-)
>
> +    case KCS_CMD_WRITE_START:
> +        kcs_bmc->data_in_avail = false;
> +        kcs_bmc->data_in_idx   = 0;
> +        kcs_bmc->phase         = KCS_PHASE_WRITE;
> +        kcs_bmc->error         = KCS_NO_ERROR;
> +        break;
>
Yes, that should be good.  Sorry about the confusion.
