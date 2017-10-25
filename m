Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22e; helo=mail-vk0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NreCJamR"; 
 dkim-atps=neutral
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMXnn2JdzzDqkr
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 01:38:52 +1100 (AEDT)
Received: by mail-vk0-x22e.google.com with SMTP id g11so123540vkd.13
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sxyqqbnF1cOID5bDdqRIul0VE/qznUsyqyahYKt10ZQ=;
 b=NreCJamRFBLPaVl3xoJ/4okEvqDfkL+VEjMnnDnEK75f14GSv1aUQFfjr6tyfqnu7S
 9rmFbVlLgpSXQNrbu62LVKypc97eFgYQ4Q/LnAg+/+fS9eFrtXsaNWSOO6cEqp+hqUog
 D5kMTt5p/DYi/E1iNN/jdCmFGX10A6KbFO+lm1j8yaYwJbWQ/1hJQOLJ/Sw7i+IcPJ67
 124b6A0n6HK1EHJ7OscpNgVZcFt6/EY9uhYgTMPnKR0c6tq5Z9BShxKHDuv3HgsktjLe
 AzrtdKtRqcLwPhqWBA4B5sZ4EJK29aScnf26suSVm0C4P0f9QJMBczRr5fzu8owc8LFq
 3h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sxyqqbnF1cOID5bDdqRIul0VE/qznUsyqyahYKt10ZQ=;
 b=Jlmmw3BzBBvvb1K79jlKwRSl9BMewsD++5qPC74pvDdVYAI9Xrd6Dkc3En/8OIutl3
 ShkEBOjAh8bI27Eoj5bz8h4CHCmieuCqC25QYi/OQJKlGrMAjNCUW2ZneSHBzEjnD0ax
 zSZ0tkK53lFwvzuJdKAvOM8sv1XdmCKv+0mkcrQMX52fCYmXnpZyy0fmLL+6qtta9CMT
 7zROwI6GanB9Ng6QdpkMby0UTVBRQxuL6yCHDWWnUUKNE0VU5uXHSu/lhQhRbar7y9Te
 0CFw14R/cQtrL1jZ2O3YnLfl4Htr81WaefTB6GvG7GkXMmcX1dzUEVq+6rLOhnimxhUI
 YpzQ==
X-Gm-Message-State: AMCzsaW4uf7oMXlWJWHYSoNN1HBDPELwT6Cv/5CTxOXt9CNabmdMTS6e
 pqlvqPgjPXToVDMS57oRYCNdDSUAaU7EmMVzCYj60g==
X-Google-Smtp-Source: ABhQp+QkkxzCiNkh1Xs5oyaFXfxR7DI5UEwVXQrcQXTGzpHY9jK+f5SzrcXk8Gxv6OKiKaaID7p1A3R5fEwuRDdVrc0=
X-Received: by 10.31.81.132 with SMTP id f126mr1588315vkb.195.1508942329161;
 Wed, 25 Oct 2017 07:38:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Wed, 25 Oct 2017 07:38:28 -0700 (PDT)
In-Reply-To: <OFC47AE895.C7BA821A-ON002581C4.003A3CAE-002581C4.003CB01C@notes.na.collabserv.com>
References: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
 <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
 <OF0B4D03B3.93D53D9F-ON002581C2.00659A8A@LocalDomain>
 <OF4AE1F920.ECC72211-ON002581C3.0037DD9F-002581C3.00386F1F@notes.na.collabserv.com>
 <OFA8BE74E9.C41FAFA0-ON002581C3.00503AF9@LocalDomain>
 <OFC47AE895.C7BA821A-ON002581C4.003A3CAE-002581C4.003CB01C@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 25 Oct 2017 07:38:28 -0700
Message-ID: <CAO=notyQNpuhDe+xyct4-ADduwjxfm4=UNaFvG8GjDpj8Xop9w@mail.gmail.com>
Subject: Re: phoshor-network manager daemon + IPMI
To: Ratan K Gupta <ratagupt@in.ibm.com>
Cc: Dave Cobbley <david.j.cobbley@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 25 Oct 2017 14:38:54 -0000

On Wed, Oct 25, 2017 at 4:02 AM, Ratan K Gupta <ratagupt@in.ibm.com> wrote:
> Hi Patrick,
>
> Certain test cases which we tried through IPMI,Here are few.
>
> Valid conf
> =========
> ipmitool -I dbus lan set 1 ipsrc static
> ipmitool -I dbus lan set 1 ipaddr x.x.x.x
> ipmitool -I dbus lan set 1 netmask x.x.x.x
> ipmitool -I dbus lan set 1 defgw ipaddr x.x.x.x
> ipmitool -I dbus raw 0x06 0x40

Thanks, question. Is that last command the raw of "ipmitool lan set
access on" -- I don't know if the internal version of ipmitool
supports it.  the one on the host that I'm using does.  When I run
that, excluding setting the netmask and defgw it fails when I set
access on when it goes to delete the eth0/ip interfaces that it
automatically created for me -- because I don't have a network
configuration on boot.

Your experiment groups this under valid conf -- are you saying that
you started with a specific systemd network configuration file?

>
>
> InvalidIP
> ========
> ipmitool -I dbus lan set 1 ipsrc static
> ipmitool -I dbus lan set 1 ipaddr <invalid ip address>
> ipmitool -I dbus lan set 1 netmask x.x.x.x
> ipmitool -I dbus lan set 1 defgw ipaddr x.x.x.x
> ipmitool -I dbus raw 0x06 0x40
>
> Invalid Gateway
> =============
> ipmitool -I dbus lan set 1 ipsrc static
> ipmitool -I dbus lan set 1 ipaddr 9.3.185.83
> ipmitool -I dbus lan set 1 netmask 255.255.255.0
> ipmitool -I dbus lan set 1 defgw ipaddr <invalid gateway>
> ipmitool -I dbus raw 0x06 0x40
>
> Regards
> Ratan Gupta
>
>
>
>
> ----- Original message -----
> From: Patrick Venture <venture@google.com>
> To: Ratan K Gupta <ratagupt@in.ibm.com>
> Cc: Dave Cobbley <david.j.cobbley@linux.intel.com>, OpenBMC Maillist
> <openbmc@lists.ozlabs.org>
> Subject: Re: phoshor-network manager daemon + IPMI
> Date: Tue, Oct 24, 2017 8:06 PM
>
> On Tue, Oct 24, 2017 at 3:16 AM, Ratan K Gupta <ratagupt@in.ibm.com> wrote:
>> Hi Dave,
>>
>> We have enabled the link local address auto configuration,thats why you
>> are
>> noticing the link local address,
>> But as a side effect of this,you should not notice this problem that the
>> DHCP IP has not get assigned to the
>> BMC.
>>
>> Please try the "ip addr show dev eth0" instead of ifconfig.
>>
>> Now days kernel supports ip aliasing where a single interface can have
>> multiple ip adress,so on a intterface you may see link local address
>> as well as DHCP assigned/Static Assigned IP address.
>>
>> I have tried on our setup and it is working fine.
>
> However, have you tried updating the IP address over IPMI?  As part of
> that code, it calls delete on those interfaces and IPs (all of them).
> Which fails.  Should there be logic in the ipmi daemon to only delete
> non-local-link addresses?  And then, if you try to delete a DHCP
> assigned address, it also fails -- so how does one transition from
> DHCP to static?  I'd just like to hear how these cases were tested so
> I can verify the problem is on my end with my configuration, or
> possibly that more work is required before this is working fine.
>
>
>>
>> Regards
>> Ratan
>>
>>
>> ----- Original message -----
>> From: Patrick Venture <venture@google.com>
>> Sent by: "openbmc" <openbmc-bounces+ratagupt=in.ibm.com@lists.ozlabs.org>
>> To: Dave Cobbley <david.j.cobbley@linux.intel.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Re: phoshor-network manager daemon + IPMI
>> Date: Mon, Oct 23, 2017 11:59 PM
>>
>> On Mon, Oct 23, 2017 at 10:18 AM, Dave Cobbley
>> <david.j.cobbley@linux.intel.com> wrote:
>>> I have been digging into the network manager as well.
>>> The link local problem has been popping up on our systems as well.
>>>
>>> I'm not sure why linklocaladdress causes our systems to get the 169.XX IP
>>> Address.
>>> I suspect is has something to do with the way our DHCP servers are setup
>>> on
>>> the network, systemd-networkd is not recognizing that we do in fact get
>>> an
>>> IP from DHCP.
>>>
>>> I'm assuming engineers at IBM are not seeing this behavior since the
>>> patch
>>> was accepted (please correct me if I'm wrong).
>>> Therefore this is more likely not a bug in systemd, but something strange
>>> with the configuration of network infrastructure.
>>> Either way, root cause needs to be identified.
>>>
>>> To work around it, simply delete the line linklocaladdress=xxxx from
>>> /etc/systemd/networkd/00-bmc-ethx.network
>>
>> I ended up updating the default configuration file writer to not set
>> that, then found that once it had DHCP=yes in it, it also would crash
>> on attempt to delete (from the exception it raises when you try)
>>
>>>
>>> Let me know if you make any more observations about the strange behavior
>>> (it
>>> would be nice to get past this issue).
>>>
>>> Thanks,
>>> -Dave Cobbley
>>>
>>>
>>> On 10/23/2017 07:48 AM, Patrick Venture wrote:
>>>
>>>> I'm curious if anyone has experience using the phosphor-network
>>>> manager daemon. I've run into some oddities using it for instance, if
>>>> you don't configure anything it sets up both links as LinkLocal and
>>>> enables DHCP, etc -- and then even if DHCP fails, it doesn't update it
>>>> (although it's aware of the failure) -- and when I then go to set the
>>>> IP address over IPMI to a static IP, I run the two lan channel set
>>>> commands which work (because they just set the object contents) --
>>>> when i call "access on" over IPMI, it tries to delete all the dbus
>>>> objects for the network, which fail because of checks in the network
>>>> daemon that prevent this, which causes the network daemon to crash.
>>>>
>>>> Ultimately I'm going to enable the host ipmi daemon to support
>>>> multiple channels -- the trick is then to map the channel to an
>>>> ethernet device...  Some patches will be send up today to reviewing
>>>> this type of change.
>>>>
>>>> I'm going through the uses cases now trying to get it working, and
>>>> just curious what I should be doing to get it to work.
>>>>
>>>> Also of note, when I set the MAC address -- which works :), it doesn't
>>>> update the configuration for the systemd network file with that
>>>> information  -- I'll be sending a patch for that today -- but I was
>>>> curious if that was deliberate, etc.
>>>>
>>>> Thanks,
>>>> Patrick
>>>
>>>
>>
>>
>>
>>
>>
>
>
>
>
>
