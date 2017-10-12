Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::22b; helo=mail-pf0-x22b.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jgn+7nGb"; 
 dkim-atps=neutral
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCbml6ZK3zDr4T
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 03:25:27 +1100 (AEDT)
Received: by mail-pf0-x22b.google.com with SMTP id m28so5541971pfi.11
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l74W6+VUSI9TpgMqA4LV80nWAzb2veqSiBg7jpnuojQ=;
 b=jgn+7nGbXzu6GDtkuOYmSiE7KBg+J1Tcqoz4DGKgTOLhINGrnp7RdyCjj1uq0ULpSs
 FHoSWON+unTGn9494HRfSIqUCXzEvNVEWr3TqBJZPUVRO5rrLdenKqneAoSNz5oWm00l
 OpdBegc2RV0wSA/09gbwsCQKRA/dvcmgyaK4y1NY3LDhKyb2pTNJ5+IDIRyXsI7yCXI/
 9MdfKc/bYSbcp4m1ch9bVkvyR8K92kAN0EOGp4yqAt4e0wKbKofWAZqXeRd9X+gfRU9q
 Q638sMERqoMVBpz/212qLJQ1duCkcGC8dlomMBQh69Y808CGrCIRdZIM0lmuo1s1W8jW
 02PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l74W6+VUSI9TpgMqA4LV80nWAzb2veqSiBg7jpnuojQ=;
 b=nSAOGqVnXrR/zA1eTftcpR5FDeXm4Zh5ATOgoNxDJ6O1J3E2qO55rQ5WWnxWSJkuiE
 bh3e1VHG7lfMOl9rxBiWl8B7/EfEI+UoIRYKmJX61NpdpSJhdPVT/Enr0zd8GBF3mZYW
 qHVkz393WwTCPXsWBiswnjCuJY0cl471Wh5n1jOS77EyQ/VBxo2IwmUIQa35j6XYbVT1
 YbSh9x0VvXdrBbulDfLWT7whgjyiIB8UbXCF4IUWhkmO7JbvDW4Pvdoy1cVgPUj6McOM
 iEMph+JpHC+KvV60+Fg9mqjtlxEMchtoAwVv+gvz1LpYhygZ+EhEl0/QgjW8eDO+Agyo
 SkGw==
X-Gm-Message-State: AMCzsaVlrSNnoc3x7eY+vwm0zUBQOd1JcNMXVxU/aJFdMdfU1IYH2VVX
 icr0x9SWQWc8PtGUIup5ZrW7eqJoZivz4L0md3U6rg==
X-Google-Smtp-Source: AOwi7QDgBR4omS0kYtU0Pe/0WOg3cflB8/MmGaAcnzc89RoHDXi7wjnooqKargC39dEXBjnMrizk/n40hlQ4Zj7Y47U=
X-Received: by 10.159.244.23 with SMTP id x23mr668817plr.64.1507825523612;
 Thu, 12 Oct 2017 09:25:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.184.2 with HTTP; Thu, 12 Oct 2017 09:25:23 -0700 (PDT)
In-Reply-To: <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
References: <20171011220548.GA61269@mauery>
 <1173E291-E8F5-4828-82CA-7B8BAC249B53@fuzziesquirrel.com>
From: Xo Wang <xow@google.com>
Date: Thu, 12 Oct 2017 09:25:23 -0700
Message-ID: <CAPH-5w7Kyv_GeZt=DHoYSPKJp5AjoJCUFkAwYEgVo7XpacGTUw@mail.gmail.com>
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 12 Oct 2017 16:25:29 -0000

On Thu, Oct 12, 2017 at 9:03 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Oct 11, 2017, at 6:05 PM, Vernon Mauery <vernon.mauery@linux.intel.co=
m> wrote:
>>
>> I am working on an ipmi provider library and had a few questions and
>> observations.
>>
>> 1) Why are there separate ipmi message queues for the host and network?
>
> iirc it was so that you could have a different set of providers
> registered for each channel or even different, channel specific
> implementations for the same command.
>

The reasoning here also derives from the "build the distro as you like
it" approach. If you don't want a network interface to the BMC, then
you can simply not build it or its handlers.

Of course we could write a single queue service for both host and
network that can be configured and built to support only one, but that
puts the onus on architecting and testing that service to ensure the
all three configurations all work independently.

>>   It seems awkward that for the host, the ipmi request comes from a
>>   different process (btbridge, or in our case kcsbridge), while for the
>>   network (RMCP+), the messages are handled directly in the same
>>   process.
>
> Is it still awkward if you accept the two queue approach?  The
> additional layer is needed for the bt/kcs -> host-ipmid
> abstraction.  No such abstraction is needed for network.
>
>>
>>   It seems that the network handler could just as easily package the
>>   command up and send it to ipmid the same way that btbridge does.
>>
>> 2) Can we modify the signature of the handlers so that they can behave
>>   in a more intelligent manner? It would be nice if they were handed a
>>   gsl::span<uint8_t> instead of a void* and a length. This allows for
>>   a no-copy, bounds-checked way of passing buffers.
>
> sounds good to me!
>

We can use more intelligent (safer) data passing throughout phosphor code. =
:)

>>
>>   It would be nice to know what channel something came in on. We might
>>   want to be able to change behavior based on the incoming channel (as
>>   some channels are more secure than others).
>
> I think the separate message queues solves this need; however, doing
> this need not be mutually exclusive of having separate queues if that
> enables another use case we don=E2=80=99t support today.
>
> I=E2=80=99m not totally stuck on two queues.  Especially if some alternat=
ive
> maintains the same level of flexibility.  The motivation for a single
> queue isn=E2=80=99t clear yet to me though - without more discussion it s=
ounds
> like we=E2=80=99d end up with the same capability we already have=E2=80=
=A6so why bother?
>

One set of cases is where a host might have multiple interfaces to the
BMC (e.g. BT and SSIF).

I can't immediately think of why a provider might want to respond to a
command differently based on what host interface it came on, but maybe
somebody else can.

>>
>>   It would be nice to know what IPMI privilege the command came in
>>   with (ADMIN for session-less commands) so that the command handler
>>   can behave appropriately based on the user.
>
> Makes sense.
>
>>
>> 3) When registering commands, it would be nice of the list also
>>   maintained a priority so that commands could be easily overridden.
>>   Currently the only way to override a command is to make sure that
>>   your library gets loaded first (and this is done via the library
>>   name). If we had default ipmi commands loaded at DEFAULT_PRIO and
>>   then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or
>>   something like that, we could have integrators further on down the
>>   line able to easily add a new provider library and piecemeal override
>>   individual command. An alternate (or addition) might be the addition
>>   of a unregister command method to remove an existing command so it
>>   could be replaced with a new one (or just straight up removed).
>
> The intent is that everything in OpenBMC is overridable by an integrator.
> We provide a reasonable =E2=80=98reference=E2=80=99 implementation but ca=
n be replaced
> with something else via a bitbake layer.  At image construction time.
>
> I think you are proposing a setup where an image has multiple providers
> for the same command, and the =E2=80=98reference=E2=80=99 has a low prior=
ity.  In their
> bitbake layer, an integrator could _add_ another provider with higher
> priority, which would be selected to handle the command since it has
> the higher priority.
>
> That makes sense, but why wouldn=E2=80=99t an integrator just _replace_ t=
he
> reference in an image with the custom integrator provider?  This type
> of thing is exactly why we are a bitbake distro.
>
> I hope you don=E2=80=99t have a good answer to this :-) as one of my goal=
s is
> to try move runtime complexity into the build process as much as we can.
>
>>
>>
>> I am happy to work on changes that I would like to see and submit
>> patches for review, but I wanted to know if there was some sort of
>> historical or other reason that would prevent my work from getting
>> rejected before I actually do the work.
>>
>> --Vernon

cheers
xo
