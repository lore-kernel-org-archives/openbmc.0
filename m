Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="c+hw5iy1"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lJ3d1d3lzDqBx
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 01:15:08 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id h20-v6so23435808itf.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HypbTicDkTJjRegag/Vn6iu6ZhYV33h3w9XPhxRXF2Q=;
 b=c+hw5iy1zFEyv2ZMqwAT8EnC6yh5wtTxXdaqLfk5+OHq3EKeF9Bpx0LB022dhEHqak
 NJCpELCb4wjdAatWvVZXnAzh6ynuilQuDaXsmsnRnMejAGU88HS2yXqLURh9vKGvkPGQ
 oQf0YDUeEoN2KOJqIwYHU5DRigovV1Y/Fdzzz0UvJu71mz7SgLlYJV/+T/EQz4yaWX38
 9Fwl0Zgqs+U1hZkN0vxYHdnq+psZriEY16FZ4Z+hc5iJ7rWKPV6y66Sj5SxYpeUH0gwx
 wvvNPUrywbtI4e+ngy00BoWswUf7fgTtVrv0kJxFdUfWc7Wvzb2TJuKwcsgR8XZDbruD
 ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HypbTicDkTJjRegag/Vn6iu6ZhYV33h3w9XPhxRXF2Q=;
 b=ghKSlgGHdm1SZUgycHI5xzzjRbO9wBuFC5zYsmGYlOa2XHVjkruB2bCUl5MhuFDjgy
 KaCdVz3e21cd8m548njnHJ8O9s3gOwgAdVL9aOWyzStE+cceTPegLG1Wce6HnNwfWz1q
 MZAF8WPZqHVUn+2b/rFgEOXvD7+hX1miv3VwhAGhw5fnTyesIml3xQf8u9osubxlPrwC
 fmZJ66c3aqHhoxXKWg1e5jizNvwWYSL7AwquaHi71143ST6hGCYOODbGcb1yjlxVDvyn
 v4RwtZqVlXuJpBkDt/0N2J+SGZVru2gooEdAZkjv0klp5n3oEmVQjt1/90IeILBU/Myv
 b46g==
X-Gm-Message-State: AOUpUlHMK2ar1drGNvmIvgAVSGBBfjFlaTQ17iv99XM/vyFnQDv96reb
 Vxa/tffO55COx3o/ODyg199OmosoLgv4LIzOOzPAqw==
X-Google-Smtp-Source: AA+uWPxhQLBo6D1dThcwgunRsI9lx9Hj6Po4TbHLrJo2+lqtrTPipQxy8F/VZ9j3qDiw8U+KkuWucWxNE70Ds6i7VBk=
X-Received: by 2002:a24:8b82:: with SMTP id
 g124-v6mr2476520ite.70.1533654906897; 
 Tue, 07 Aug 2018 08:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 08:14:46 -0700 (PDT)
In-Reply-To: <1533596643.2696676.1465549384.610418DC@webmail.messagingengine.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
 <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
 <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
 <5627e085-571f-02ef-306d-07874eae5109@intel.com>
 <1533596643.2696676.1465549384.610418DC@webmail.messagingengine.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 7 Aug 2018 08:14:46 -0700
Message-ID: <CAO=notxAHVWjQ_ZbFU=bOq41UWFFcg8zn0DTHwoUWW5UnAkU1w@mail.gmail.com>
Subject: Re: In-Band Firmware Update
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Ed Tanous <ed.tanous@intel.com>, Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Robert Lippert <rlippert@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Nancy Yuen <yuenn@google.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 07 Aug 2018 15:15:10 -0000

On Mon, Aug 6, 2018 at 4:04 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> I'd be interested in separating out the "file like" nature from the
>> interface, and keep it as just a "block level" update, that may be a
>> file, or may be something else.
>>
>
> A slight tangent, but I think it's worth talking about here:
>
> On OpenPOWER systems we developed a control protocol for the
> host to manipulate the LPC FW mapping. v3 of the protocol included
> support for mapping "arbitrary" stuff into the FW space with a
> command to list what devices were available. It seems very similar to
> what Patrick has outlined, though operates at the block level as Ed
> mused about above.

i'm somewhat familiar with the mailbox daemon and v3 protocols
insomuch as we were using them on our openpower system before
transitioning to phosphor-ipmi-flash (for consistency across
platform).

>
> Typically this mechanism is used for the host to access its firmware
> which - again on OpenPOWER designs - sits on a flash device owned
> by the BMC.
>
> The control protocol was run over the LPC mailbox available on
> ASPEED BMCs. However, I am currently developing a PoC IPMI
> replacement for the mailbox interface, and intended to use much
> the same command-set and argument layout as we have with the
> mailbox. As mentioned above it aligns pretty well with what Patrick
> is proposing.
>
> So our use-case has less of an update focus, but at the end of the
> day if you can perform arbitrary writes it roughly amounts to the
> same thing. Should we expand the scope to cover my use-case here?
> I'm fine if the answer is "no", but with the similarities it seemed
> necessary to bring up.

The explicit out-of-band-data flow-control messages in
phosphor-ipmi-flash fit the semantics to an extent.  We actually use
one of the packets in the design
https://github.com/openbmc/phosphor-ipmi-flash/blob/master/docs/flash_update.md#flashmapregionlpc-13
to provide information used for the ioctl:

bool LpcMapperAspeed::MapWindow(uint32_t *windowOffset, uint32_t *windowSize,
        uint32_t address, uint32_t length)
{
    static const uint32_t MASK_64K = 0xFFFFU;
    const uint32_t offset = address & MASK_64K;
    if (offset + length > regionSize)
    {
        fprintf(stderr, "requested window size %" PRIu32 ", offset %#" PRIx32
                " is too large for mem region at %#" PRIXPTR " of size %zu\n",
                length, offset, physAddr, regionSize);
        *windowSize = regionSize - offset;
        return false;
    }
    *windowOffset = offset;
    *windowSize = length;
    struct aspeed_lpc_ctrl_mapping map =
    {
        .window_type = ASPEED_LPC_CTRL_WINDOW_MEMORY,
        .window_id = 0,
        .flags = 0,
        .addr = address & ~MASK_64K,
        .offset = 0,
        .size = __ALIGN_KERNEL_MASK(offset + length, MASK_64K),
    };
    printf("requesting Aspeed LPC window at %#" PRIx32 " of size %" PRIu32 "\n",
           map.addr, map.size);
    static const char lpcControlPath[] = "/dev/aspeed-lpc-ctrl";
    const auto lpcControlFd = open(lpcControlPath, O_RDWR);
    if (FileClosed == lpcControlFd)
    {
        fprintf(stderr, "cannot open Aspeed LPC kernel control dev \"%s\"\n",
                lpcControlPath);
        return false;
    }
    if (ioctl(lpcControlFd, ASPEED_LPC_CTRL_IOCTL_MAP, &map) == -1)
    {
        fprintf(stderr, "Failed to ioctl Aspeed LPC map with error %s\n",
                strerror(errno));
        return false;
    }
    return true;
}

The above code is going into phosphor-ipmi-flash once I finish
rewriting the IPMI BT interface support.

>
> Cheers,
>
> Andrew
>
> PS: The bits -
> Repository: https://github.com/openbmc/mboxbridge
> Protocol documentation: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mbox_protocol.md
> Implementation notes: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mboxd.md
