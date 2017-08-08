Return-Path: <tcminyard@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRZt30HBczDqp9
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 23:26:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bnyWF1C+"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id b130so3055578oii.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1vTrcKAbfq3j6FYkXQYxUiQRqZWr+PQPEOuXzK1ly5I=;
 b=bnyWF1C++qC/pczTlui22aTGQCBEBACw5DY32Cb5oOEGw3biUM4YnpSOlseWZFop7M
 vzNliF+cnlrIYprbNFkDB6CgQMOuRGWfPgVNw/9pB9qFz7I7Uh3/5Y1AkrqrVkhJMBPx
 xaDDOGhbscK1l+XN0oZgVwdC6N5/zoBZ8xm7HwmO+rvO7FeHa/FPBvSahwCiVDJ3aQ11
 dUYJ468tyvumbNtMujaFTFvxyUeXbaBeLSJv1BNHzJtCQSjcIYVX4RPBLoVbP1Y674lL
 WzMtHLrBl6JJYqtl6YEcmVRgHFjR132w/bLczHC5I2hm8J26v7DuqxyQj1+qk5wkENEu
 YVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1vTrcKAbfq3j6FYkXQYxUiQRqZWr+PQPEOuXzK1ly5I=;
 b=RJG8JPssqBTBrPYh/OqLXds7ZDNz28yeDMIXWAF/FNJPasbQbQf5YotBorA7mjCWp8
 dKD5K0jjOi+wQGIs39UI7ZzbwGMoa4P1K69B5BaTE6/DtwzN4Thr5Uf7b5Qievz3LwDt
 9kYDdw2n+YCKAFSbX7/4BnJTzFl8M7mkwRrE0qEUDDUwinv30ltquIpLEyujKNptzyqm
 ofe1WedD6LkSIHPZte1zPBD27QcSdG4r5TNE9a0ynUvV5ROzgX3Dg2BPEG4DU326ypvz
 LU8YS46iowIYuU86HqxU4MPIt0LPvepRaZzC0fjDqZcCNh0Otas+XKywLFWZAMyds1PC
 E6yA==
X-Gm-Message-State: AHYfb5jMGBwX1ex7PscMeJNX3AL+Mtpw5g3zIoc6oPB2Nw20NafSCXl7
 J0ps7Zt4KITHCQ==
X-Received: by 10.202.177.11 with SMTP id a11mr4145614oif.166.1502198775831;
 Tue, 08 Aug 2017 06:26:15 -0700 (PDT)
Received: from serve.minyard.net ([47.184.154.34])
 by smtp.gmail.com with ESMTPSA id j188sm1756997oib.47.2017.08.08.06.26.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Aug 2017 06:26:14 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 76588216;
 Tue,  8 Aug 2017 08:26:12 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Benjamin Fair <benjaminfair@google.com>, linux-doc@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
 <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
Date: Tue, 8 Aug 2017 08:26:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 13:26:20 -0000

On 08/07/2017 08:25 PM, Brendan Higgins wrote:
> On Sat, Aug 5, 2017 at 3:23 PM, Corey Minyard <minyard@acm.org> wrote:
>> On 08/04/2017 08:18 PM, Brendan Higgins wrote:
>>> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has
>>> the
>>> same semantics as IPMI Block Transfer except it done over I2C.
>>>
>>> For the OpenBMC people, this is based on an RFC:
>>> https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
>>>
>>> The documentation discusses the reason for this in greater detail, suffice
>>> it to
>>> say SSIF cannot be correctly implemented on some naive I2C devices. There
>>> are
>>> some additional reasons why we don't like SSIF, but those are again
>>> covered in
>>> the documentation for all those who are interested.
>>
>> What you have is not really BT over I2C.  You have just added a sequence
>> number to the
>> IPMI messages and dropped the SMBus command.  Other interfaces have sequence
>> numbers,
>> too.  Calling it BT is a little over the top.
> Fair point, maybe ISIF (I2C System Interface)? I don't have strong feelings
> about the name.

I'm not too picky, either, I just didn't want someone to get confused.

>
>> Do you really need the performance required by having multiple outstanding
>> messages?
>> That adds a lot of complexity, if it's unnecessary it's just a waste.  The
>> IPMI work on top
>> of interfaces does not really require that much performance, it's just
>> reading sensors,
>> FRU data, and such.  Perhaps you have a reason, but I fail to see
>> why it's really that big a deal.  The BT interface has this ability, but the
>> driver does not
>> take advantage of it and nobody has complained.
>>
> Yes, we do have some platforms which only have IPMI as a standard interface
> and we are abusing some OEM commands to do some things that we probably
> should not do with IPMI like doing firmware updates.

Perhaps that is some level of abuse, but it's pretty common.  I'm not 
against it.

There is standard IPMI firmware NetFN (though no commands defined) that 
if you use
the driver automatically goes into "Maintenance mode" and modified the 
timeouts
and handling to some extent to help with this.

>   Also, we have some
> commands which take a really long time to complete (> 1s). Admittedly, this is
> abusing IPMI to solve problems which should probably be solved elsewhere;
> nevertheless, it is a feature we are actually using. And having an option to use
> sequence numbers if definitely nice from our perspective.
>
> We will probably want to improve the block transfer driver at some
> point as well.

As long as you have a legitimate need, I don't have a problem with 
this.  The upper layer
of the driver can already handle this, there's just a small piece that 
interfaces to
the lower layer that needs to be modified.  And the ability to query the 
maximum
number of outstanding messages from the lower layer.

BT will be harder, the SI interface code would need more significant 
updates.


snip

>
>> I would agree that the multi-part messages in SSIF is a big pain and and a
>> lot of
>> unnecessary complexity.  I believe it is there to accommodate host hardware
>> that is
>> limited.  But SMBus can have 255 byte messages and there's no arbitrary
>> limit on
>> I2C.  It is the way of IPMI to support the least common denominator.
>>
>> Your interface will only work on Linux.  Other OSes (unless they choose to
>> implement this
>> driver) will be unable to use your BMC.  Of course there's the NACK issue,
>> but that's a
>> big difference, and it would probably still work with existing drivers on
>> other OSes.
> I hope I did not send the message that we are planning on using this instead
> of SSIF forever and always. This is intended as an alternative to SSIF for some
> systems for which I2C is really the only available hardware interface, but SSIF
> is not well suited for said reasons.
>
> It would be great for OpenBMC if someone added support for SSIF, but as far
> as I know, no one is asking for it.

I am not convinced that SSIF is not suitable for this.  It is true that 
the lack of NACK
support won't work right now, but for the current SSIF driver that is 
adding a condition
to a single if statement.  I would be happy to have that.  The current 
code returns an
error in this case, but it might be better to just ignore it, anyway.

>> Plus people may choose to use OpenBMC on things besides the aspeed devices
>> that
>> could do a NACK.  That's kind of the point of OpenBMC, isn't it?
> Yes, using OpenBMC on other things is part of the point; however, all
> of the projects
> that I am currently aware of and am trying to support use Aspeed parts
> which also
> need an option.
>
>> My suggestion would be to implement a BMC that supports standard SSIF single
>> part
>> messages by default.  That way any existing driver will work with it.  (I
>> don't know
>> about the NACK thing, but that's a much smaller issue than a whole new
>> protocol.)
> Coming up with a satisfactory solution to working around systems that cannot
> NACK is my primary goal; I don't care about alternatives that do not address
> this.
>
>> Then use OEM extensions to query things like if it can do messages larger
>> than 32
>> bytes or supports sequence numbers, and how many outstanding messages it
>> can have, and extend the current SSIF driver.  It wouldn't be very hard.
> It would not be that hard to implement something that is naive, but I
> think it would
> be difficult to implement something that is maintainable and robust.
> For example,
> if I added an OEM extension that allowed me to add a sequence number, I would
> have to find a place that I could put it that would allow IPMI
> messages that do not
> have the sequence number to still be sent and parsed correctly so that if either
> the host or BMC reset the other would still be able to send the
> message to return
> it to the desired state. I can think of ways that this could be done,
> but I cannot
> think of anyway that it could be done cleanly and would not make maintaining
> SSIF more complicated.

There are ways to accomplish this that aren't that complex.  You can 
create an OEM
command that can query the maximum message size and the ability to do 
sequence
numbers in the messages.

If messages larger than 32-bytes are supported, and the host I2C/SMBus 
driver
supports it, you could use the standard SSIF SMBus commands to do this, they
have an 8-bit length field.

If sequence numbers are supported, The SSIF could use different SMBus 
commands
to do the write and read requests.  Since this is only if you get an OEM 
command,
and if you put the sequence numbers at the end where they are easy to add on
the send side, this is a small change to the driver.

So I think the changes would be small and contained.  I'm actually ok with a
different driver, but I think it would be more valuable to the OpenBMC 
project
to have a standardized interface that would work (in a not quite as 
efficient
mode) with software that does not use the Linux IPMI driver.

>> In my experience, sticking with standards is a good thing, and designing
>> your own
>> protocols is fraught with peril.  I'm not trying to be difficult here, but I
>> am against
>> the proliferation of things that do not need to proliferate :).
> I totally agree, which is why I tried to do something which looks like an
> existing IPMI interface to all of the software outside of this. As I mentioned
> above, I am afraid that hacking up SSIF to achieve the desired effects would
> make it much harder to maintain. I figured that the stuff I was trying
> to do does
> not really look like SSIF, so I should not force it into SSIF. If we
> don't advertise it
> as SSIF, then no one will expect it to behave that way.
>
> Moreover, if we put all of the hacky stuff in its own driver then we
> don't have to
> worry about it forever polluting SSIF; whereas, if we modify SSIF to support
> whatever weird things we suggest, it becomes a lot harder go back and clean
> it up if one day we find that no one is using it, which I do indeed hope becomes
> the case.
>
> I guess that I would say that sticking with standards is a good thing,
> but if you
> are going to break them, you must not make anything more difficult for the
> people who are following them.
>
> All this being said, we do not terribly mind keeping these patches internal, at
> least for sometime (by then maybe we will have a better solution). The main
> reason I wanted to upstream these is twofold: I heard that there are some
> other people who ran into this problem and were interested in a solution of
> this type and I thought this would be a good motivating example behind a new
> BMC side IPMI framework that we are working on as it would help to illustrate
> the desire to separate the hardware layer from the common routing layer as
> you had done with the host side; however, as long as you are aware that there
> may be other implementations, just possibly not in the mainline kernel, then
> I suppose that is not really an issue. I will try to send out an RFC for this
> framework tonight.
>
>> -corey
>>
>>
>>> In addition, since I am adding both host side and BMC side support, I
>>> figured
>>> that now is a good time to resolve the problem of where to put BMC side
>>> IPMI
>>> drivers; right now we have it (there is only one) in drivers/char/ipmi/
>>> with the
>>> rest of the host side IPMI drivers, but I think it makes sense to put all
>>> of the
>>> host side IPMI drivers in one directory and all of the BMC side drivers in
>>> another, preferably in a way that does not effect all of the current
>>> OpenIPMI
>>> users. I have not created a MAINTAINERS entry for the new directory yet,
>>> as I
>>> figured there might be some discussion to be had about it.
> Regardless of what we do with the "BT-I2C" stuff, I am still interested in what
> you think about this.

I think you are right, it probably belongs some place else.  The way 
that makes the most
sense to me would be to have an "ipmi" directory with a "host" and 
"slave" side, and since
ipmi is not really a char driver, to move it to the main driver 
directory.  That might be
fairly disruptive, though.

The other option that makes sense to me would be to add a 
drivers/char/ipmi_slave directory,
or something like that, and put the slave code there.  That would be 
less disruptive.

-corey


>>> I have tested this patchset on the Aspeed 2500 EVB.
>>>
>>> Changes since previous update:
>>>     - Cleaned up some documentation.
>>>     - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
>>>       directory.
>>
>>
> Thanks
