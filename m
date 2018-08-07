Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="novCUGH/"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lNnj4mdmzDqgZ
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 04:48:24 +1000 (AEST)
Received: by mail-it0-x229.google.com with SMTP id d9-v6so217953itf.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7nH1cddLMyzYKWfg/P6U2shiMpchQYWoEPvYEMgngns=;
 b=novCUGH/PCHqtPj7QYjZuk6Hv9eGzlszGWFKXOUk8DSIu8SnTMuT2G8P+YhbpLfbYP
 VG58omvQribMSAzBSMZfcaWnRdFQKZ5l0ZXFXrUVNydxIoaZGk+RmXJYTZif4Ln6cndR
 +pe4mMS6prGYGBEjeJ2Nc4qufLEkFqB9QZ9TIrhtRpOdso9jhAdFU5QiIORvAz4skgyC
 YXdOB2q/XjfiLzLLREXqBBA1Kq7XVyBCdjSyT+lnjvczy8RKr2V1YsmcxEHW0SSw/FZB
 jnz4gxiP1lDsVTejSqG6FjIV9iAdNc9N2Wfx4zm1iOLPXtetNU0V/yIk1UcOxIiOWkD0
 AY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7nH1cddLMyzYKWfg/P6U2shiMpchQYWoEPvYEMgngns=;
 b=tk7oKOrbzgw8Fvh1WeEczvagi4tMAzlDMZ/7CEcWFmZwVLjg5t6Uk931ze+IQn2eI1
 trCz242Fe8fxIYjqvF+viZc9kqmxvl1pz9YonZQzK/RyuHu+dM2SokPNGm4k8XU9Rs5k
 yj/BBBnHj+mS46apaoUPdZOD2lcvQHbtVutDvqglJBzaUUvpXf/tiJqGNkjR9ufve99V
 2bhF2nF2Ydf8IqOzZXrDD1yYZDee0OBLAZEbB1oGkyzZNU4cJ065F/TfpX5qHvPJoz5R
 R+NTLxuG77bJQFzAlOKvaMdSZ8p8n3aONvcP/4DNfvB+lL9QFWKLBoDtv7XeFlY++dgj
 kwWw==
X-Gm-Message-State: AOUpUlEdrx3uay0T8Y0GAu+tEIlExsBfHeH/8Hh363Tjg/cytnsv12mR
 GvrThcvgXPO8NpsDVz+ZZQFO4I9hH8eIhxnRkr3GHw==
X-Google-Smtp-Source: AA+uWPzAKxtkVaiVJ6kQGhPXqEO3sD3ETTcfkkNBsY2to3h8/qkLGCvZcZKp+0N1pX3/rqArRxpMXSKnZzyWXn0TLLU=
X-Received: by 2002:a24:7882:: with SMTP id
 p124-v6mr2917059itc.111.1533667702196; 
 Tue, 07 Aug 2018 11:48:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 11:48:01 -0700 (PDT)
In-Reply-To: <CAO=noty=FbFRZnKwc6-1KdU4hw8xw8jNNaN8UkumHayQ=dKVMQ@mail.gmail.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
 <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
 <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
 <5627e085-571f-02ef-306d-07874eae5109@intel.com>
 <1533596643.2696676.1465549384.610418DC@webmail.messagingengine.com>
 <CAO=notxAHVWjQ_ZbFU=bOq41UWFFcg8zn0DTHwoUWW5UnAkU1w@mail.gmail.com>
 <CAO=noty=FbFRZnKwc6-1KdU4hw8xw8jNNaN8UkumHayQ=dKVMQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 7 Aug 2018 11:48:01 -0700
Message-ID: <CAO=notyGhKXobMXxC-M-0sG2Cs3R-tUzu5go0J6zAEC1DH4cmA@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Aug 2018 18:48:26 -0000

On Tue, Aug 7, 2018 at 9:41 AM, Patrick Venture <venture@google.com> wrote:
> On Tue, Aug 7, 2018 at 8:14 AM, Patrick Venture <venture@google.com> wrote:
>> On Mon, Aug 6, 2018 at 4:04 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>> I'd be interested in separating out the "file like" nature from the
>>>> interface, and keep it as just a "block level" update, that may be a
>>>> file, or may be something else.
>>>>
>>>
>>> A slight tangent, but I think it's worth talking about here:
>>>
>>> On OpenPOWER systems we developed a control protocol for the
>>> host to manipulate the LPC FW mapping. v3 of the protocol included
>>> support for mapping "arbitrary" stuff into the FW space with a
>>> command to list what devices were available. It seems very similar to
>>> what Patrick has outlined, though operates at the block level as Ed
>>> mused about above.
>>
>> i'm somewhat familiar with the mailbox daemon and v3 protocols
>> insomuch as we were using them on our openpower system before
>> transitioning to phosphor-ipmi-flash (for consistency across
>> platform).
>>
>>>
>>> Typically this mechanism is used for the host to access its firmware
>>> which - again on OpenPOWER designs - sits on a flash device owned
>>> by the BMC.
>>>
>>> The control protocol was run over the LPC mailbox available on
>>> ASPEED BMCs. However, I am currently developing a PoC IPMI
>>> replacement for the mailbox interface, and intended to use much
>>> the same command-set and argument layout as we have with the
>>> mailbox. As mentioned above it aligns pretty well with what Patrick
>>> is proposing.
>>>
>>> So our use-case has less of an update focus, but at the end of the
>>> day if you can perform arbitrary writes it roughly amounts to the
>>> same thing. Should we expand the scope to cover my use-case here?
>>> I'm fine if the answer is "no", but with the similarities it seemed
>>> necessary to bring up.
>>
>> The explicit out-of-band-data flow-control messages in
>> phosphor-ipmi-flash fit the semantics to an extent.  We actually use
>> one of the packets in the design
>> https://github.com/openbmc/phosphor-ipmi-flash/blob/master/docs/flash_update.md#flashmapregionlpc-13
>> to provide information used for the ioctl:
>>
>> bool LpcMapperAspeed::MapWindow(uint32_t *windowOffset, uint32_t *windowSize,
>>         uint32_t address, uint32_t length)
>> {
>>     static const uint32_t MASK_64K = 0xFFFFU;
>>     const uint32_t offset = address & MASK_64K;
>>     if (offset + length > regionSize)
>>     {
>>         fprintf(stderr, "requested window size %" PRIu32 ", offset %#" PRIx32
>>                 " is too large for mem region at %#" PRIXPTR " of size %zu\n",
>>                 length, offset, physAddr, regionSize);
>>         *windowSize = regionSize - offset;
>>         return false;
>>     }
>>     *windowOffset = offset;
>>     *windowSize = length;
>>     struct aspeed_lpc_ctrl_mapping map =
>>     {
>>         .window_type = ASPEED_LPC_CTRL_WINDOW_MEMORY,
>>         .window_id = 0,
>>         .flags = 0,
>>         .addr = address & ~MASK_64K,
>>         .offset = 0,
>>         .size = __ALIGN_KERNEL_MASK(offset + length, MASK_64K),
>>     };
>>     printf("requesting Aspeed LPC window at %#" PRIx32 " of size %" PRIu32 "\n",
>>            map.addr, map.size);
>>     static const char lpcControlPath[] = "/dev/aspeed-lpc-ctrl";
>>     const auto lpcControlFd = open(lpcControlPath, O_RDWR);
>>     if (FileClosed == lpcControlFd)
>>     {
>>         fprintf(stderr, "cannot open Aspeed LPC kernel control dev \"%s\"\n",
>>                 lpcControlPath);
>>         return false;
>>     }
>>     if (ioctl(lpcControlFd, ASPEED_LPC_CTRL_IOCTL_MAP, &map) == -1)
>>     {
>>         fprintf(stderr, "Failed to ioctl Aspeed LPC map with error %s\n",
>>                 strerror(errno));
>>         return false;
>>     }
>>     return true;
>> }
>>
>> The above code is going into phosphor-ipmi-flash once I finish
>> rewriting the IPMI BT interface support.
>
> So, if there is a desire to see the generic blob ipmi interface up --
> I can start upstreaming that.  I can continue phosphor-ipmi-flash for
> a flash-only approach, or I can move that code into the blobs
> interface.  Matt and Vernon have been reviewing that code, which has
> been great as it has great momentum!  The transition to ipmi-blobs
> will be very similar code as far as the handler is concerned, however,
> the ipmi portion, which is what I've nearly finished for
> phosphor-ipmi-flash will be tossed as the blob has its own IPMI
> command details.  I don't mind reworking things, and wanted to also
> draw attention and thanks to Matt and Vernon for reviewing
> phosphor-ipmi-flash.
>

I'm going to convert the current blobs protocol to markdown and send
it for comment.

>>
>>>
>>> Cheers,
>>>
>>> Andrew
>>>
>>> PS: The bits -
>>> Repository: https://github.com/openbmc/mboxbridge
>>> Protocol documentation: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mbox_protocol.md
>>> Implementation notes: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mboxd.md
