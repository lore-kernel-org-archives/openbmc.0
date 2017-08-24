Return-Path: <tcminyard@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdPZG7215zDqHx
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 23:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWZwU9/8"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id m7so3828567pga.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kuq/W4ar1cIc/gKP6cPssfNsM7PjRJb3rIef3SXV+TI=;
 b=gWZwU9/8DkvY4UravqFyDitrhl2XIQin2bJuMi3hNm9AJ+MzfOlqOAsXHAvwdUCHkO
 XNXp5kxJKY5Hwb5HSfbUb6XOpjctCNF9KTx4AEDHqMqty6W4+q6wfPSe2yTqx9Pl3/49
 tcEo3pBe9/awg+ufLF97E/fijFdrkjGOcGBzHaOcaE5k2/LvaQU2ugeFrAeYpamdRz2l
 yys2oeHtV8dfJ+A7QmVZJkqOZXCo6hwDAwuEbm83ypmt7CCmgbE5MbLSnZHrDJwLFJ26
 n5/PKfPIAN+JHGt47sSYbC/6beV8GMWw0TULihGxn1FqfAy4uizNIle/nkY7k/K77TkT
 /ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=kuq/W4ar1cIc/gKP6cPssfNsM7PjRJb3rIef3SXV+TI=;
 b=FwEngHr/otjHLD/vmlqg9+5GXTtQDlHA2K3kF3EWAzwdQLezAcF0Jk6h5d5zh0pPaP
 XalovE4AfyBJoGMsHhb+o0PJBvJ2oosPT6unEGMIjm0l8F7od3T1HQGpewlC58iDOUPs
 j+kbHUywlAiQW7eElLo3CuKFnrzqjJGiCqHCqOWX+kCDKx63uU7koypHWjFxcEG6CbBX
 bM0UOjiOTca+/dcaz5ELlpIMSgImSfcnq7eG9b8hLYWG2dXwcXwZ0Zt8HXJwC+e/imNV
 yYTcalDJ0UbJtTVba3GvLpbVff0+8l/SOIxMDWhiOCmnLbLU1VL9nUMlM3Ul6DxpBY75
 ZiYQ==
X-Gm-Message-State: AHYfb5jOv0g2FMCb6EV9i4zwwFEgVSpY/yhsVD9OKPXkaAZNQdp9gdjP
 XNSCc02pfdk6xQ==
X-Received: by 10.84.217.142 with SMTP id p14mr6720426pli.62.1503579700766;
 Thu, 24 Aug 2017 06:01:40 -0700 (PDT)
Received: from serve.minyard.net ([47.184.154.34])
 by smtp.gmail.com with ESMTPSA id a13sm7203951pgd.60.2017.08.24.06.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Aug 2017 06:01:39 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 802AB2E5;
 Thu, 24 Aug 2017 08:01:37 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [RFC v1 1/4] ipmi_bmc: framework for BT IPMI on BMCs
To: Brendan Higgins <brendanhiggins@google.com>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openipmi-developer@lists.sourceforge.net,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-2-brendanhiggins@google.com>
 <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
 <CAFd5g44QFPGV+P_RCMreM4GWarOYJ8+iLREALFwiJ3JtiLvYyQ@mail.gmail.com>
 <beae3088-ce1b-3d57-0d6e-3728397ee8a5@acm.org>
 <CAFd5g45sOLV21g+30-1AK0734gct8AP0vG=1SVC1PpbT2xSK4A@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <f44a84de-60de-9917-ec84-12b26215a834@acm.org>
Date: Thu, 24 Aug 2017 08:01:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g45sOLV21g+30-1AK0734gct8AP0vG=1SVC1PpbT2xSK4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
X-List-Received-Date: Thu, 24 Aug 2017 13:01:43 -0000

On 08/23/2017 01:03 AM, Brendan Higgins wrote:

<snip>
> ...
>>> As far as this being a complete design; I do not consider what I have
>>> presented as being complete. I mentioned some things above that I would
>>> like
>>> to add and some people have already chimed in asking for some changes.
>>> I just wanted to get some feedback before I went *too* far.
>>
>> I'm not sure this is well know, but the OpenIPMI library has a fully
>> functional BMC
>> that I wrote, originally for testing the library, but it has been deployed
>> in a system
>> and people use it with QEMU.  So I have some experience here.
> Is this the openipmi/lanserv?

Yes.  That name is terrible, but it started out as a server that 
provided a LAN
interface to an existing BMC over the local interface, primarily for my 
testing.

>
>> The biggest frustration* writing that BMC was that IPMI does not lend itself
>> to a
>> nice modular design.  Some parts are fairly modular (sensors, SDR, FRU data)
>> but some are not so clean (channel management, firmware firewall, user
>> management).  I would try to design things in nice independent pieces, and
>> end up having to put ugly hooks in places.
> Yeah, I had started to notice this when I started working on our userland IPMI
> stack.
>
>> Firmware firewall, for instance, makes sense to implement in a single place
>> that
>> handles all incoming messages.  However, it also deals with subcommands
>> (like making firewalls for each individual LAN parameter), so you either
>> have
>> to put knowledge of the individual command structure in the main firewall,
>> or you have to embed pieces of the firewall in each command that has
>> subcommands.  But if you put it in the commands, then the commands
>> have to have knowledge of the communication channels.
>>
>> I ended up running into this all over the place.  In the end I just hacked
>> in
>> what I needed because what I designed was monolithic.  It seemed that
>> designing it in a way that was modular was so complex that it wasn't worth
>> the effort.  I've seen a few BMC designs, none were modular.
>>
>> In the design you are working on here, firmware firewall will be a bit of a
>> challenge.
>>
>> Also, if you implement a LAN interface, you have to deal with a shared
>> channel and privilege levels.  You will either have to have a context per
>> LAN connection, with user and privilege attached to the context, or you
>> will need a way to have user and privilege information in each message
>> so that the message router can handle rejecting messages it doesn't
>> have privilege to do, and the responses coming back will go to the
>> right connection.
>>
>> There is also a strange situation where commands can come from a LAN
>> (or other) interface, be routed to a system interface where the host
>> picks up the command, handles it, send the response back to the
>> BMC which routes it back to the LAN interface.  People actually use this.
> That sounds like fun :-P
>
>> Another problem I see with this design is that most services don't care
>> about the interface the message comes from.  They won't want to have
>> to discover and make individual connections to each connection, they
>> will just want to say "Hook me up to everything, I don't care."
>>
>> Some services will care, though.  Event queues and interface flag handling
>> will only want that on individual interfaces.  For these types of services,
>> it would be easier if they could discover and identify the interfaces.  If
>> interfaces are added dynamically (or each LAN connection appears as
>> a context) it needs a way to know when interfaces come and go.
>>
>> If you end up implementing all this, you will have a fairly complex
>> piece of software in your message routing.  If you look at the message
>> handler in the host driver, it's fairly complex, but it makes the user's
>> job simple, and it makes the interfaces job simple(r).  IMHO that's a
>> fair trade-off.  If you have to have complexity, keep it in one place.
> I think that is a reasonable point. My initial goal was not to move the
> routing that we do in user land to kernel space and only provide basic
> facilities that are enough for my use case, but it sounds like there might
> be some wisdom in handling message routing and message filtering to
> kernel space. This might also make the framework more platform agnostic,
> and less tightly coupled to OpenBMC.
>
> Nevertheless, that substantially broadens the scope of what I am trying
> to do.
>
> I think a good place to start is still to create a common interface for
> hardware interfaces (BT, KCS, SSIF, and their varying implementations)
> to implement, as I have done, and while we are working on the rest of the
> stack on top of it, we have the device file interface that can be used in the
> meantime.
>
> Let me know what you think.

If you just need the ability to catch a few commands in the kernel, what you
have is fairly complicated.  I think a simple notifier called from every 
driver
would provide what you needed with just a few lines of code.

As far as moving all the message routing to the kernel, my (fairly 
uneducated)
opinion would be that it's a bad idea.  It's a lot of complexity to put 
in there.
I can see some advantages to putting it there: it's simpler to interact 
with than
a userspace daemon and it gives consistent access to kernel and userspace
users.  But I don't know your whole design.

-corey

> Thanks!
