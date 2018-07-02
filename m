Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::233; helo=mail-ua0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ASCWrHQY"; 
 dkim-atps=neutral
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KDQ66Q88zF1Nv
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 03:14:38 +1000 (AEST)
Received: by mail-ua0-x233.google.com with SMTP id n4-v6so10494368uad.6
 for <openbmc@lists.ozlabs.org>; Mon, 02 Jul 2018 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5frRNylL102z/fpnHn1hqI+XDdsPDSxqNaW3Pcs4gj0=;
 b=ASCWrHQYZfyyQAJAAzNDgI8NbA0yQ/0tqM+Ucxyz4Yp+Oea6TB75haHuOcOUgpF/Hx
 jVO6nJFt/ZCj61Db87VfW6T6lDPKDmA35E2NHgvAqQv1L07w7pUyKkjuJxIM05DXPjDd
 OpJaW8KeOmP1N0F5MBrPV71iLFQrQS3YvtQQcRUpTsF2NJHFbLJKvwZchpNTp3oUoHbd
 jWSVxi0+pdvwy+25J1teYE60SNTK9psK+fqzsmj6oXoNTBstItPkyBgpzenDT51si7Lx
 SIeoxn/KgtYDiFebqQSVJbItkSOP65viNi86X5rd1+S7CB6CQRFODRbp3Q7I2HA0yyrH
 8oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5frRNylL102z/fpnHn1hqI+XDdsPDSxqNaW3Pcs4gj0=;
 b=SqeqjMtF2OHDP4RsXe6IXyuUF3wmYSGh4BiZmJWfl+0LZiBenuko2o/yNU5R30bF2r
 58YZNi3DI+Ix5QVRAv8iUGX25SJLX5G9QYGOsEn/ClTE0s/NjXZplS9mHzZ/CHRt/3XH
 RLfT1Z9Bh0MTYXejq7LTrEJCHoIVBP8xV8X9ywKDKJUEErZN+z9aTNiAKxBUnfJS78OW
 Kk0P3MBwMgQvRDT1ty97ROFwsv310Q0/m19H8U0xtWXOO9yyCanz/EcMXLipgIhSfPvZ
 U6VGzEzDCErFsyf8hzonq5r9bEwgqSQlhTkkOQKlNyNEdfh5OQkokdcUG7eAMF8IEYNg
 pCsg==
X-Gm-Message-State: APt69E1loYlHXQFpRpsf/RURBkWE0kKaJTLVgIeUUuTY+0ZpXEoDwdrW
 QP24KWWNNjGa7pR2jDJUEZdUvRaABOeNmq7qyEIeU2dy
X-Google-Smtp-Source: AAOMgpdUpIprtjDhpwKxkPPLZmhO5YBb4QsP9Bb6hnZVWdM7Ul5Xl9MsD6TR+IDYXoL4eBsw4bKF4FBdbQEx5hRrnH8=
X-Received: by 2002:ab0:6252:: with SMTP id
 p18-v6mr16397098uao.147.1530551676050; 
 Mon, 02 Jul 2018 10:14:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9b90:0:0:0:0:0 with HTTP;
 Mon, 2 Jul 2018 10:14:15 -0700 (PDT)
In-Reply-To: <CAO=notzyNqcWhTcYtqJje6erO3vx3_taS3DJHryTkqVQPRbt+g@mail.gmail.com>
References: <CAO=notzW-7ffufai7uSQ8FtMvJrGT56F18TM5zm7L9+opFKb0Q@mail.gmail.com>
 <CACPK8XfhTdg8NCpvBbgGev1o9oa0f7+RYhYvXzSs5Mr_b7=AsA@mail.gmail.com>
 <CAO=notyxfpzqQ0W2QOGWdtgoyC+Q3jQFA1=0sGmax43x-DQ--g@mail.gmail.com>
 <CAO=notzyNqcWhTcYtqJje6erO3vx3_taS3DJHryTkqVQPRbt+g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 2 Jul 2018 10:14:15 -0700
Message-ID: <CAO=notytH5apNSzwkbdSffWrn6heubeZBVJrw75M4fz4gXKjgQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Jul 2018 17:14:39 -0000

On Mon, Jul 2, 2018 at 10:13 AM, Patrick Venture <venture@google.com> wrote:
> On Thu, Jun 28, 2018 at 7:33 AM, Patrick Venture <venture@google.com> wrote:
>> On Wed, Jun 27, 2018 at 6:30 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> On 27 June 2018 at 01:49, Patrick Venture <venture@google.com> wrote:
>>>
>>>> Hit any key to stop autoboot:  0
>>>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>>>> ## Loading kernel from FIT Image at 20080000 ...
>>>>    Using 'conf@aspeed-bmc-quanta-q71l.dtb' configuration
>>>>    Trying 'kernel@1' kernel subimage
>>>>      Description:  Linux kernel
>>>>      Type:         Kernel Image
>>>>      Compression:  uncompressed
>>>>      Data Start:   0x20080124
>>>>      Data Size:    1723192 Bytes = 1.6 MiB
>>>>      Architecture: ARM
>>>>      OS:           Linux
>>>>      Load Address: 0x40008000
>>>>      Entry Point:  0x40008000
>>>>      Hash algo:    sha1
>>>>      Hash value:   95ed76c9361d9f6f991a6a859a06eb7626af80df
>>>>    Verifying Hash Integrity ... sha1+ OK
>>>> Wrong Ramdisk Image Format
>>>> Ramdisk image is corrupt or invalid
>>>> """
>>>>
>>>> I figured I'd reach out first as I'm sure this will be familiar to someone :D
>>>
>>> This is due to a change Brad made to the u-boot setup. If you change
>>> your bootcmd to simply be 'bootm 20080000' you might be fine.
>>
>> Thanks, I'll give that a try tomorrow morning!
>
> Joel, that worked.  Running "bootm 20080000" from the ast uboot
> command line got it to boot.

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

>>
>>>
>>> Cheers,
>>>
>>> Joel
