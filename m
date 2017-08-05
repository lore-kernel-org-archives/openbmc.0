Return-Path: <tcminyard@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPyww6FdCzDqmc
 for <openbmc@lists.ozlabs.org>; Sun,  6 Aug 2017 08:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qFRT5EA+"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id l64so5159056pge.2
 for <openbmc@lists.ozlabs.org>; Sat, 05 Aug 2017 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x5TfN4gLKywgVThgKzUkit0wyR6IjZJRsSg4MdYKHNw=;
 b=qFRT5EA+H4j008RGMkyLnmR7hwz5H8O0CDI70Oh5yHs1LK9aIYaKBsBvT2kfx4kqF5
 XYstDGdGIPmCqNPfYXFHQdYf3xE0iVqH0IDVosnb7nn6+LAaT1DcZdw+uXmZ/PNWJiu1
 xd4y5EexsueoVLWkfsIe4Xp7M+D7D2TLXkE+Y8eNTX/ypu7aR56Eo0LjQwEt3gH2BVCX
 xX/Pr9z/4uB2FfqBfBQWwLBB2G2KIYqVddV2c636Ic+g+HW6e+SKdNT0jxyMTTt1FJhQ
 G90jAgwww17m8dg94oOADpk2NH/tR+4F6p7hFRwInqqS3py8w4EKTkAoGEtMYTE9Tk9G
 fsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=x5TfN4gLKywgVThgKzUkit0wyR6IjZJRsSg4MdYKHNw=;
 b=bBTe9l69FJVYCrRyemckuDPTV/pUBbLhI9R0GE9bAgR8GHgKXGegJirUMhfLAvhRLU
 Z5AzgTKEXeLrZi+3BX3xIAWjGi4t1Q091vgdOcZ61jm8ccAwBJ5AlJkIhe5pTmjcPGUY
 fdfQ9r9aqJgvbNwbnlbgRVd+0Rc4u8B4P/TqU7sDVEekjiRAjnGuBjl81sIa9y8ZdKKf
 S7cAxAnQCAIQt4Ckz7z6Su7ZlQ+GK4o1dt4qVpIP7yMWIZjFNHSr7kwe+i3kNYZxw32K
 Uedhtm58ctT23NXVxi9bkt71nfrrL1SAEajBmVsK9ppgCRwlmAyFjlX2iNRX0F6V2nF5
 kBEw==
X-Gm-Message-State: AIVw112cPeW2Tk+JP1ho1pz5R/2cPXBnMkMr7V/fX1ZVGt4wmUiSgr3i
 n5mFJNbk1H5HxA==
X-Received: by 10.99.124.76 with SMTP id l12mr6797816pgn.90.1501971790770;
 Sat, 05 Aug 2017 15:23:10 -0700 (PDT)
Received: from serve.minyard.net ([47.184.154.34])
 by smtp.gmail.com with ESMTPSA id w8sm4996465pgc.1.2017.08.05.15.23.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Aug 2017 15:23:08 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 017FD329;
 Sat,  5 Aug 2017 17:23:06 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: Brendan Higgins <brendanhiggins@google.com>, corbet@lwn.net,
 robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, joel@jms.id.au, benh@kernel.crashing.org,
 benjaminfair@google.com
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20170805011855.1027-1-brendanhiggins@google.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
Date: Sat, 5 Aug 2017 17:23:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170805011855.1027-1-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 07 Aug 2017 09:44:34 +1000
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
X-List-Received-Date: Sat, 05 Aug 2017 22:23:13 -0000

On 08/04/2017 08:18 PM, Brendan Higgins wrote:
> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
> same semantics as IPMI Block Transfer except it done over I2C.
>
> For the OpenBMC people, this is based on an RFC:
> https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
>
> The documentation discusses the reason for this in greater detail, suffice it to
> say SSIF cannot be correctly implemented on some naive I2C devices. There are
> some additional reasons why we don't like SSIF, but those are again covered in
> the documentation for all those who are interested.

I'm not terribly excited about this.  A few notes:

SMBus alerts are fairly broken in Linux right now.  I have a patch to 
fix this at:
https://github.com/cminyard/linux-ipmi/commit/48136176ce1890f99857c73e0ace5bd8dfb61fbf
I haven't been able to get much traction getting anyone to care.

The lack of a NACK could be worked around fairly easily in the current 
driver.  It looks like you
are just returning a message too short to be valid.  That's easy.  I 
think it's a rather major
deficiency in the hardware to not be able to NACK something, but that is 
what it is.

What you have is not really BT over I2C.  You have just added a sequence 
number to the
IPMI messages and dropped the SMBus command.  Other interfaces have 
sequence numbers,
too.  Calling it BT is a little over the top.

Do you really need the performance required by having multiple 
outstanding messages?
That adds a lot of complexity, if it's unnecessary it's just a waste.  
The IPMI work on top
of interfaces does not really require that much performance, it's just 
reading sensors,
FRU data, and such.  Perhaps you have a reason, but I fail to see
why it's really that big a deal.  The BT interface has this ability, but 
the driver does not
take advantage of it and nobody has complained.

And I don't understand the part about OpenBMC making use of sequence 
numbers.
Why does that matter for this interface?  It's the host side that would 
care about
that, the host would stick the numbers in and the slave would return 
it.  If you are
using sequence numbers in OpenBMC, which sounds quite reasonable, I 
would think
it would be a bad idea to to trust that the host would give you good 
sequence
numbers.

Plus, with multiple outstanding messages, you really need to limit it.  
A particular BMC
may not be able to handle it the full 256, and the ability to have that 
many messages
outstanding is probably not a good thing.

If you really need multiple outstanding messages, the host side IPMI 
message handler
needs to change to allow that.  It's doable, and I know how, I just 
haven't seen the
need.

I would agree that the multi-part messages in SSIF is a big pain and and 
a lot of
unnecessary complexity.  I believe it is there to accommodate host 
hardware that is
limited.  But SMBus can have 255 byte messages and there's no arbitrary 
limit on
I2C.  It is the way of IPMI to support the least common denominator.

Your interface will only work on Linux.  Other OSes (unless they choose 
to implement this
driver) will be unable to use your BMC.  Of course there's the NACK 
issue, but that's a
big difference, and it would probably still work with existing drivers 
on other OSes.
Plus people may choose to use OpenBMC on things besides the aspeed 
devices that
could do a NACK.  That's kind of the point of OpenBMC, isn't it?

My suggestion would be to implement a BMC that supports standard SSIF 
single part
messages by default.  That way any existing driver will work with it.  
(I don't know
about the NACK thing, but that's a much smaller issue than a whole new 
protocol.)
Then use OEM extensions to query things like if it can do messages 
larger than 32
bytes or supports sequence numbers, and how many outstanding messages it
can have, and extend the current SSIF driver.  It wouldn't be very hard.

In my experience, sticking with standards is a good thing, and designing 
your own
protocols is fraught with peril.  I'm not trying to be difficult here, 
but I am against
the proliferation of things that do not need to proliferate :).

-corey

>
> In addition, since I am adding both host side and BMC side support, I figured
> that now is a good time to resolve the problem of where to put BMC side IPMI
> drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
> rest of the host side IPMI drivers, but I think it makes sense to put all of the
> host side IPMI drivers in one directory and all of the BMC side drivers in
> another, preferably in a way that does not effect all of the current OpenIPMI
> users. I have not created a MAINTAINERS entry for the new directory yet, as I
> figured there might be some discussion to be had about it.
>
> I have tested this patchset on the Aspeed 2500 EVB.
>
> Changes since previous update:
>    - Cleaned up some documentation.
>    - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
>      directory.
