Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::236; helo=mail-vk0-x236.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qGqo5tzp"; 
 dkim-atps=neutral
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Gj2f3pwdzF1QG
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jun 2018 00:34:00 +1000 (AEST)
Received: by mail-vk0-x236.google.com with SMTP id q135-v6so3421292vkh.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=auNMubXRqqdCang/gR7pPVl3LvAE495ts66cDnztz7Y=;
 b=qGqo5tzpl8Vl8HCzqfrAEyC7PHEwj/GRmK6K1frUP85OWEL9cS38mAwTqHnfT5MEAT
 DWPXJVTHXvKZsGz4XEuFO2m+zlr/js0P1Gg+LFRyTwAzlIkB/FowIfiIyGDUx8QxxYFa
 nK7cqQFwAFFFPDTk7lOD6+meNlp5b9QKGAMssn205mFPRFnrwjzbNqshL5LH3vcdKhvk
 1c1tpuqaPXhWMHR+aPMymPR1QCN2RyG5+sB4kY45j7f0jz1cWkNcy8SCCpz8JH2FpnAM
 EDwJzhRt6vpLzLp0/v0ErMCdN/fKj48CZ2wKylYFE9uOKV6gFx8nqBxKgQjq8JqkNvdp
 PgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=auNMubXRqqdCang/gR7pPVl3LvAE495ts66cDnztz7Y=;
 b=OPGLTIha9L/velpkEkHft041GTbf7iXZJ0QoAEgfidSne9imER7sOB2Ux0Qf4aMBl6
 FknRrcLxFr9NLn92B4O9AG0YW/CKI2WTVaVfUJZ6582i5D02v9i4Mi/fzQoCfYT6Vwgc
 VgSLfnQQALjuGqsoCxhvXEjx+u+XaIlzEBYxcFWwLZfr3N1dv8JrW/YK2nbfNUCSKAx6
 QxZmIO2ZFp4AhYzMfFrt6kJwRLwsLLrKMHLYVLQ/6EjM6Jau4PrgbLzWqDBOUQnbHXTQ
 Im+tKcTzCDHSjfFHaaL2dDU5ny+JAm7YHYRfU1fEMoX8S5X9p/4oVm4sBX5Cute7oBLh
 UK9g==
X-Gm-Message-State: APt69E0EjiX3uRg7HRHqfXfx/DxTdIw6DgXCGb/A9XbZGpK5SMADJ9XD
 oAXby4wQeMwKNqyZ5soilt4ff+jR8YyRdBGQUcQSYVCV
X-Google-Smtp-Source: AAOMgpd51Oyaq2G5Ip6UIE2fKWzy+/PhyNJebD234q8GWSRF8hbhkpwWL5ZXW//6tJpaAsL7xLVc6yD9txubEc09x+w=
X-Received: by 2002:a1f:3089:: with SMTP id
 w131-v6mr6350223vkw.1.1530196438135; 
 Thu, 28 Jun 2018 07:33:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 07:33:37
 -0700 (PDT)
In-Reply-To: <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 28 Jun 2018 07:33:37 -0700
Message-ID: <CAO=notyxfpzqQ0W2QOGWdtgoyC+Q3jQFA1=0sGmax43x-DQ--g@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Jun 2018 14:34:04 -0000

On Wed, Jun 27, 2018 at 6:30 PM, Joel Stanley <joel@jms.id.au> wrote:
> On 27 June 2018 at 01:49, Patrick Venture <venture@google.com> wrote:
>
>> Hit any key to stop autoboot:  0
>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>> ## Loading kernel from FIT Image at 20080000 ...
>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>    Trying 'kernel@1' kernel subimage
>>      Description:  Linux kernel
>>      Type:         Kernel Image
>>      Compression:  uncompressed
>>      Data Start:   0x20080124
>>      Data Size:    1723192 Bytes = 1.6 MiB
>>      Architecture: ARM
>>      OS:           Linux
>>      Load Address: 0x40008000
>>      Entry Point:  0x40008000
>>      Hash algo:    sha1
>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>    Verifying Hash Integrity ... sha1+ OK
>> Wrong Ramdisk Image Format
>> Ramdisk image is corrupt or invalid
>> """
>>
>> I figured I'd reach out first as I'm sure this will be familiar to someone :D
>
> This is due to a change Brad made to the u-boot setup. If you change
> your bootcmd to simply be 'bootm 20080000' you might be fine.

Thanks, I'll give that a try tomorrow morning!

>
> Cheers,
>
> Joel
