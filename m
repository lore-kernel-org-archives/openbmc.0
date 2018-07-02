Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SD1iPh3d"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KDPP0ZHDzF1LR
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 03:14:00 +1000 (AEST)
Received: by mail-ua0-x22c.google.com with SMTP id x24-v6so3792749ual.10
 for <openbmc@lists.ozlabs.org>; Mon, 02 Jul 2018 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Frgzb/Ugg0fo9ZJklhppHgc4U8xX+SoCazdLiq0pS54=;
 b=SD1iPh3dq7O/Nfr7VAd7II0XnWDSK8pnOI/KzfJpmwbp6GD19NBr3gqt3s8Z5TAcTD
 QXGvd6YqPAq9GO99jFY8VdkfsTwFeCmfoGORFPDMAVxvt46QmGVQ4dbpZf75aKuLOw/9
 AbZmUp/IsJFNJjznEzUkQCTd93f6I+RfL4Sn2ju6iU/w+18Og4WpZtIOe2hagjMpsStA
 uwiwFKMZFDUUFjAgkQrCjWNYV37uxoIg8raVCyeh2ArexnmsDl1d9JsUX3/zNa+4Fixw
 8ELi/CnKeeZgSPa8dF35H6f/XdVwaQg1El6jCx6Xo6kdX5KrrP62mX6JZ1VEw2qeTi9f
 /7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Frgzb/Ugg0fo9ZJklhppHgc4U8xX+SoCazdLiq0pS54=;
 b=MfWPwK0SFCTd97sSjQeaW5oI0aTjVnUlCrsoNyNbX+Cib6x0vIhAKwSEOpD9mhQZqz
 T3y1+78XNsp+U2ZNzpD/FHv8+RCiwSQTZL3QSgoBQtJwQ1k3Lejs9d0elrGetiAqdK34
 LQ7HHw2XUMi7DSUnfo+iV/XTMwb1hQJOHshtCPQf+Waiw54Vg8YKhRVpnXCyWY3oWL2q
 AIwsMCxYA3Qh8YH7GdD3gnA4jlOI3xPCFDKis7nZV42YqOZAM94y/pfQ0NmQQM7zkGLv
 h63sgydwBNN6PuiY4I/k0OsrVsDF/RJZhZE6/yWCfwl6VZSMtXw+0Rbk0a/yQ1RscC9y
 F9cQ==
X-Gm-Message-State: APt69E36ET1RatRJ1gb0YhIhQeJo1hbiM8fmRC2qRH6v9YwBhqT/tq75
 P9SXAkqHYkd2oVDgN0jHfvUWARijV25JCDca2OrffA==
X-Google-Smtp-Source: AAOMgpdtqb0NZV04MZ+YwzkXzgIfuTN6e9jBadjh0UAxuKsUA5h26cKhc4oj+7clfOor7wPeeKq1O/tDsDA1/z+9dSg=
X-Received: by 2002:ab0:1c1a:: with SMTP id
 a26-v6mr16337393uaj.142.1530551636999; 
 Mon, 02 Jul 2018 10:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP;
 Mon, 2 Jul 2018 10:13:36 -0700 (PDT)
In-Reply-To: <CAO=notyxfpzqQ0W2QOGWdtgoyC+Q3jQFA1=0sGmax43x-DQ--g@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
 <CAO=notyxfpzqQ0W2QOGWdtgoyC+Q3jQFA1=0sGmax43x-DQ--g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 2 Jul 2018 10:13:36 -0700
Message-ID: <CAO=notzyNqcWhTcYtqJje6erO3vx3_taS3DJHryTkqVQPRbt+g@mail.gmail.com>
Subject: Re: Merging up to OpenBMC v2.2 from v2.1 - boot problem, invalid
 ramdisk format
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 17:14:02 -0000

On Thu, Jun 28, 2018 at 7:33 AM, Patrick Venture <venture@google.com> wrote:
> On Wed, Jun 27, 2018 at 6:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On 27 June 2018 at 01:49, Patrick Venture <venture@google.com> wrote:
>>
>>> Hit any key to stop autoboot:  0
>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>> ## Loading kernel from FIT Image at 20080000 ...
>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>    Trying 'kernel@1' kernel subimage
>>>      Description:  Linux kernel
>>>      Type:         Kernel Image
>>>      Compression:  uncompressed
>>>      Data Start:   0x20080124
>>>      Data Size:    1723192 Bytes = 1.6 MiB
>>>      Architecture: ARM
>>>      OS:           Linux
>>>      Load Address: 0x40008000
>>>      Entry Point:  0x40008000
>>>      Hash algo:    sha1
>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>    Verifying Hash Integrity ... sha1+ OK
>>> Wrong Ramdisk Image Format
>>> Ramdisk image is corrupt or invalid
>>> """
>>>
>>> I figured I'd reach out first as I'm sure this will be familiar to someone :D
>>
>> This is due to a change Brad made to the u-boot setup. If you change
>> your bootcmd to simply be 'bootm 20080000' you might be fine.
>
> Thanks, I'll give that a try tomorrow morning!

Joel, that worked.  Running "bootm 20080000" from the ast uboot
command line got it to boot.

>

ast# fdt print /configurations/conf@1
libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND

ast# fdt list
/ {
        timestamp = <0x5b3a5087>;
        description = "U-Boot fitImage for gBMC (OpenBMC + Google
customizations)/4.13.16+gitAUTOINC+d5c7e19b10+.quanta-4.13-testing.+/quanta";
        #address-cells = <0x00000001>;
        images {
        };
        configurations {
        };
};

I checked our u-boot patches and didn't see anything that was
different -- Brad, presumably this is something you can speak to?
At first glance, I can just write a u-boot patch that changes the
CONFIG_BOOTCOMMAND, but I imagine it's not creating the configuration
or it's not writing it where it should and that's the real issue.

>
>>
>> Cheers,
>>
>> Joel
