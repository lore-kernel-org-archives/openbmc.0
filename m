Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzSl6MhrzDqGp
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n3Dmi0SX"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id n76so460101ybg.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OsQvIiBMTBLZ2beBqQxK3xLHJCrWEVx98TCEh3v24xs=;
 b=n3Dmi0SX+0oufJEXgo9QBzhAHSp8y3v74qv2IJNaost89zeaj6ZQ0neO16ZRX1OnZu
 HMq+oR8jc30NPZUXEjTsjzYqL/JsPUC5+zLhfEmQrSxYVv20JEyyMhGzrvp5qDDEkSIF
 SVQXCulNUt1VNlLpENFc/2yJWFjss+aRUCNCBukih36a9jNv4XiAzyliMUkq8aIp+8gU
 +rAnxmKVMesFfxNU4dvKycB7FREYC2T/LfyvCQ1cPAZTekN9d/GTPKN8ZNfWOkPPJbDX
 ks+xTEYP+vMDe52AxTLo01GIwNW2NtV+MXv8kN3Ue0uTHuB5VNfRg41HTP+DPgpaE44b
 yqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OsQvIiBMTBLZ2beBqQxK3xLHJCrWEVx98TCEh3v24xs=;
 b=gCQQEDCahx0FtlOzAooIJcvk/9C+IgQXuF0EG3DRcuGvtb8l8hqb2ODsbu4OqnnJ73
 lH/G78DK6gCEJGr8Uuv3JVkMQ6kv8LmqjsGMl/besxz4VZ4ggtniEuo8kC1MFSXlT/p6
 6Oifneq6WQKapLqi9P65qr0g0Dd3X2pRuIFSFjbEEDNKJqtgXaaHhF23ahtQy2a2Qsq1
 WYCOxo3+20TGWDLYTQcaKma4ti54ssWIILIb+GHjTSMJMmzZnj8iVbjqD3fjw/tIIF0x
 YS+5E6V0R+mtUkZgHRCnVlzBzmvLHn66B9KXEfrSH+kIwwxpObUUqiQEk0Y9ZMs6SE4l
 SsPg==
X-Gm-Message-State: AMke39kNvUcorB9MPtBP3r1KYwWaY3WQf8IyhS/wy6cRgBE39w0ArB/XU7DQ6Z7Ci1/3qEG5/cRsTPLzq/8SQQ==
X-Received: by 10.37.25.70 with SMTP id 67mr494556ybz.15.1487912437805; Thu,
 23 Feb 2017 21:00:37 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 21:00:17 -0800 (PST)
In-Reply-To: <CACPK8XeM2Prgvs05iSU_=ARgQ-Jn9BypH4zfvhe35UDJpp-wfw@mail.gmail.com>
References: <20170224040626.99777-1-cbostic@linux.vnet.ibm.com>
 <75a2465d-10b0-7511-b916-c734d602cd90@ozlabs.org>
 <CACPK8XeM2Prgvs05iSU_=ARgQ-Jn9BypH4zfvhe35UDJpp-wfw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 15:30:17 +1030
X-Google-Sender-Auth: fwVLDsWTl-XeU-q3V8rOb-YGTaQ
Message-ID: <CACPK8XfDQJL-Qx20YigFr2RyBrOFpAJThRjtT9kS0WN+CC=zsQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v4] drivers/fsi: Add hub master support
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Edward James <eajames@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Feb 2017 05:00:40 -0000

On Fri, Feb 24, 2017 at 3:29 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Feb 24, 2017 at 2:46 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> Hi Chris,
>>
>>> Scan for links off of the mFSI master on CFAM. Add any devices
>>> detected to the existing list of FSI devices and notify any
>>> clients.
>>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>
>> Assuming all the inits are correct in hub_master_init(), and the layout
>> in sysfs is sensible, looks good to me!
>>

Note that the fsi-core.c file has a bunch of sparse warnings that you
will need to resolve:

drivers/fsi/fsi-core.c:232:5: warning: symbol 'hub_master_read' was
not declared. Should it be static?
drivers/fsi/fsi-core.c:241:5: warning: symbol 'hub_master_write' was
not declared. Should it be static?
drivers/fsi/fsi-core.c:250:5: warning: symbol 'hub_master_break' was
not declared. Should it be static?
drivers/fsi/fsi-core.c:265:5: warning: symbol 'hub_master_link_enable'
was not declared. Should it be static?
drivers/fsi/fsi-core.c:804:1: warning: symbol
'dev_attr_fsi_ipoll_period' was not declared. Should it be static?

Cheers

Joel
