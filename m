Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="j2XNk5EO"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kl210dHkzF3HL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 03:26:48 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id p81-v6so19278776itp.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZyBdC02R2mMHj8ifCGZksRl7bWgbmY1eyXZskZ8XnSE=;
 b=j2XNk5EOVutpofLF73N8mJHbsyDeIaptH/AqyFp6IAt4SVhxYYkQY4l6e66XVL4ePG
 3WvYyTsCNSHalTpcbYCNhlFYF9X10ycuWxEhTyMeGPO1AzOTjhZ1SVAsXcI1HbQL12sZ
 Nx0SRttWRk21PyJM4bk8IiGshu5jdWcTFk2Z8GVTUjm1rF0oONTTYuHUWNWeS3KX0Kx+
 oRJy5HDPTaUtzwuZyP+6CCAuH5VKd+XeBJE89rqBXL9EBQG4M5kaTH/OjHIl66Xkj0pR
 6N2qs557QzzHmMpRAqHo9/kE2dZYbS60JN1awMYnjI35XcGP2Ol8gu8tPC7rLddmOVNQ
 VVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZyBdC02R2mMHj8ifCGZksRl7bWgbmY1eyXZskZ8XnSE=;
 b=Br+X13y1ZLN6mxLlH2Wxjsj7U6IV8ieMc4YKnEqEeAJt3Gg94JypsQ3FJpNJ7F0VrS
 DObAjxzE4KmSmnCI7uKeTFzRAlufn8T4zR0x1fXARBEsnVziZtAsNRu70VaVWEzetTqk
 kzWPFetGq63EhqvCi0hD4mv0ipvJhJylhJtw689L/wwy7PNQQA0KRum01+EHnl4kEid1
 9SsE6NgSu66C24O2ysOCe15TajBPQ8yGgDX7By56GDdF1vm9ejbySJFtlAn/Y01C/Zn4
 X5rrzunGXqIbwwyZhDdRJfWUXxHkzwxr7T+P7aP7W5+2C+6cJrsZxJkD4X5yv31+q9DZ
 SYrg==
X-Gm-Message-State: AOUpUlELa/lcEU+ZDS4s1zQQHFJ3I/3tmig3f70RWB4Tf2BhkPVy8a+K
 zlhcZzPs4oiblpUJ8BxRFZIlkVNHnAQCd/IJ5vuDvg==
X-Google-Smtp-Source: AAOMgpdYg1+j24FM3n/iqr/rNY6sGCnvXkd0E3kghOk4zGlSSlSLxHrAnenVvCPhPuqWJ5Gy1dlhjF1t+rdDZorScrs=
X-Received: by 2002:a02:45cd:: with SMTP id
 o74-v6mr12935627jad.43.1533576406049; 
 Mon, 06 Aug 2018 10:26:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 10:26:25 -0700 (PDT)
In-Reply-To: <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 Aug 2018 10:26:25 -0700
Message-ID: <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
Subject: Re: In-Band Firmware Update
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Robert Lippert <rlippert@google.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Cc: Sai Dasari <sdasari@fb.com>, Vernon Mauery <vernon.mauery@linux.intel.com>,
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
X-List-Received-Date: Mon, 06 Aug 2018 17:26:50 -0000

We've been working on another interface lately that allows arbitrary
BLOB read and write over IPMI.  We're using it to talk to a driver on
a future software stack that's in the works.  It's a generic approach
to reading and writing bytes that could be tailored to any purpose.
One simply implements a handler in the interface.  It was suggested
that instead of sending the current in-band code upstream (albeit
rewritten for better testing) that I instead send this upstream and
then write the update mechanism into that interface.

The interface defines some primitives:
- BmcBlobGetCount: returns the number of blobs known presently
- BmcBlobEnumerate: returns the blob's name for an index into the
count (index 0 might return "/tmp/bmc-image" or something)
- BmcBlobOpen: opens the blob and returns a session for future actions
- BmcBlobRead: returns bytes
- BmcBlobWrite: writes bytes
- BmcBlocCommit: any action the handler wants that basically means, do thing.
- BmcBlobClose: closes the file
- BmcBlobDelete: deletes the blob, not always possible.
- BmcBlobStat: returns blob metadata
- BmcBlobSessionStat: returns metadata specific to the session

It doesn't immediately define actions such as "abort", however, "close
without commit" might be equivalent.  It also wasn't designed to
support OOB data, so it doesn't have a native packet that indicates
there are bytes for Write() but they live elsewhere, such as in a P2A
64-KiB block or an LPC memory map region.

I could likely find a way to easily handle those cases, possibly by
passing information into the Open command, and reading back from the
Stat() command.  Open takes a path to open, and it asks each handler
if they recognize the path, so one could have
"/tmp/bmc-image/p2a/{addr}" or something similar as an easy method to
configure that session.  OR "/tmp/..tgz" to use the UBI handler...

I've only pushed ~14 patches for the upstream OEM IPMI handler, and I
could port those to route through the blob interface rather
straightforwardly since it's nearly a 1:1 match.

The BMC IPMI Blobs source was written by me following TDD as closely
as possible.  The design has been under review for its use case for a
while, and is stable.

Regardless if we want to use it for this, I'd also be willing to
upstream our ipmi-blobs handler infrastructure.  It has presently one
limitation, and that is that it doesn't support run-time loading of
handlers, how ipmid supports finding IPMI libraries.  It is fully
contained with the handlers, and they're enabled by configuration
flags in the build.  This limitation could be removed if desired.

Patrick


On Mon, Aug 6, 2018 at 9:51 AM, Patrick Venture <venture@google.com> wrote:
> In an effort to do the OEM IPMI firmware update as full open source
> and to enable testing more thoroughly, I'm writing it anew and staging
> the patches upstream.
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-ipmi-flash/+/11772/
> is the current top of the stack of patches, but that'll change a bit
> this week as I implement more of the design.
>
> If you're very interested, and not on the patches, please let me know
> and I will add you to future ones.  That said, other than next week,
> when I'll be out-of-office, I'm hoping to keep the patches going in a
> brisk pace, so rapid feedback is appreciated.  Once the block-transfer
> interface portion is finished, I'll push up the host-side tool (which
> I also get to write anew).
>
> Patrick
>
> On Fri, Jul 27, 2018 at 12:01 PM, Patrick Venture <venture@google.com> wrote:
>> Sorry, I haven't been on this email label recently -- accidentally fell behind.
>>
>> In parallel to these efforts, I've started upstreaming a design:
>> https://gerrit.openbmc-project.xyz/11588 -- feel free to make
>> comments.  I'm going to implement the design (it's already
>> implemented, but now I'm expanding it to address incoming comments).
>>
>> Patrick
>>
>> On Tue, Jul 24, 2018 at 1:38 PM, Matt Spinler
>> <mspinler@linux.vnet.ibm.com> wrote:
>>> On 2018-07-23 19:13, Sai Dasari wrote:
>>>
>>>> Any thoughts on reusing/leveraging the PICMG's hpm spec @
>>>> https://www.picmg.org/openstandards/hardware-platform-management/ .
>>>> One of the benefit would be the standard 'ipmitool' has native support
>>>> for the update and changes are limited to BMC f/w.
>>>> On a downside, the firmware binary has to be repackaged as .hpm format
>>>> for this protocol to do some preparation steps as it support multiple
>>>> f/w components in a single package.
>>>
>>>
>>> This was brought up a few months ago and decided against:
>>> https://lists.ozlabs.org/pipermail/openbmc/2017-November/009938.html
>>>
>>> We are going to investigate using the DFU protocol, as that
>>> also has host side tools already available.
>>>
>>>
>>>>
>>>>     --Vernon
>>>
>>>
