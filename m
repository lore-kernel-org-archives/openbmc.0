Return-Path: <ddaney.cavm@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tf6yW3FtqzDw3P
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 07:05:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rgVW5KPu"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id c4so1549250pfb.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 12:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=98NdNDULHmLt5T+e8BjGYMu9VM9v737Vru3LqW3p7vQ=;
 b=rgVW5KPum02nmziDvKmfi1brlny3//T/62imKoPVSeDoSZS40pW9x6eZQMH7eIGBe/
 yuJsqza2Li8HQ9RoyYj26ZG19x6yXP5OvFuzFo+RDDSV6HpIjulCzKjDbgjKtFLFoA3O
 MZ7kkiMiiWKuqfGI2sTCdTv54tTLmnqtu3y6Wqtla71Yc69Acq+QmXtGaFeEZsdST1ds
 LNMX3V0riiej9qoDRr49JwMW7C26EctgdKvmHTyun/zDs388RuipZWCl+154CtfMmvzw
 AMfN1rcyLQ2WiKa17Qf/2qQtR9318lOKEp2T3Yrvi9QSyxfj2v8tpe2PaDwQ6G5yHFGV
 OnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=98NdNDULHmLt5T+e8BjGYMu9VM9v737Vru3LqW3p7vQ=;
 b=S2l/Ya5zuU1heBZwQw9XlhKwjJnNwdkwafww5y2LO8YlUOnGMs8TwN3lZILib8720F
 2SX+is/X5+KRQ6Ay5MkXCaP82P/XLVXNevHLxtgOJTXHSdJxM7x67zobWirNznocuWZ2
 uH9wnla6cni88twFz5+lBpy6aAl7NrXBgKZ70akTjvlNjJSpf7p8OZSnCm82IpoX8dpX
 ZbNI/2ItgKfo8Mk3VoWWcBu14RqTX0841MEa+s0wFr2RTtQU02OEZNaAAVnFojlNs9D+
 /nCnik5LzGrUf6j0bTaqXVMuw7bZ4gJoJRfQ7oiM75zyOOlcJlTo0XhkhAyK/47xpxoR
 qZTQ==
X-Gm-Message-State: AKaTC02TQNXS8WlFqaJqmymdS6SPaPsoS4u/nUz1BGz1Cco3yNKQblskfxlHWsjoY4sI0w==
X-Received: by 10.84.198.129 with SMTP id p1mr127196738pld.14.1481745952576;
 Wed, 14 Dec 2016 12:05:52 -0800 (PST)
Received: from ddl.caveonetworks.com
 (50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
 by smtp.googlemail.com with ESMTPSA id u78sm83743530pfa.53.2016.12.14.12.05.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Dec 2016 12:05:51 -0800 (PST)
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
To: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214125641.GA5379@kroah.com>
 <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
 <2512681.Wh85HyB8FH@wuerfel>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 mark.rutland@arm.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org
From: David Daney <ddaney.cavm@gmail.com>
Message-ID: <d054a18a-10d1-7aa5-31d5-44af1e5a6c76@gmail.com>
Date: Wed, 14 Dec 2016 12:05:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2512681.Wh85HyB8FH@wuerfel>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Dec 2016 07:37:00 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 20:05:56 -0000

On 12/14/2016 06:15 AM, Arnd Bergmann wrote:
> On Wednesday, December 14, 2016 2:12:41 PM CET Neil Armstrong wrote:
>> On 12/14/2016 01:56 PM, Greg KH wrote:
>>> On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
>>>> Hello,
>>>>
>>>> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
>>>> Natarajan wrote:
>>>>
>>>>> Documentation for the binding which provides an interface for adding clock,
>>>>> data and clear signal GPIO lines to control seven segment display.
>>>>>
>>>>> The platform device driver provides an API for displaying on two 7-segment
>>>>> displays, and implements the required bit-banging. The hardware assumed is
>>>>> 74HC164 wired to two 7-segment displays.
>>>>>
>>>>> The character device driver implements the user-space API for letting a user
>>>>> write to two 7-segment displays including any conversion methods necessary
>>>>> to map the user input to two 7-segment displays.
>>>>>
>>>>> Adding clock, data and clear signal GPIO lines in the devicetree to control
>>>>> seven segment display on zaius platform.
>>>>>
>>>>> The platform driver matches on the device tree node; the platform driver also
>>>>> initializes the character device.
>>>>>
>>>>> Tested that the seven segment display works properly by writing to the
>>>>> character device file on a EVB AST2500 board which also has 74HC164 wired
>>>>> to two 7-segment displays.
>>>>
>>>> FWIW, I proposed a driver for seven segment displays back in 2013:
>>>>
>>>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
>>>>
>>>> And the feedback from Greg KH was: we don't need a driver for that, do
>>>> it from userspace. See:
>>>>
>>>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
>>>>
>>>> So: good luck
>>>
>>> Did anyone ever write a library for this type of thing?
>>>
>>> Again, I don't want to see one-off drivers for random devices like this
>>> that should be able to all be controlled from userspace in a common
>>> manner.  Much like we did for fingerprint readers a long long time
>>> ago...
>>>
>
>> Actually, it's more than a random interface, a lot of SoCs and boards actually have such displays
>> and it's a pity to use UIO, sysfs gpio bitbanging and all sort of ugly stuff to only print a few
>> characters a simple and clean driver could achieve.
>> Some very well known SoCs even have integrated registers to lower the BOM and bypass the need for
>> a 74HC164 like component and avoid gpio bit banging.
>>
>> My personal concern is that you could also need to drive more segments, thus 7-segments
>> is too restrictive.
>>
>> But this driver is well structured, the gpio-bitbanging sub-driver is welcome.
>
> Maybe we can find a way to fit this into the existing drivers/leds/ subsystem?
>
> That already supports blinking, brightness and colour attributes of LEDs,
> so could this be extended to support (one of) digit, number, character
> or string with a common sysfs attribute and a way to hook up a led driver
> to that?

We have a lot of boards with an 8-cell dot matrix LED. Each cell is 
programmed with an 8-bit value.  The mapping of these values to the dots 
defaults to ASCII character rendering, but there is the facility to 
install other bitmaps as well.

Really I view these things not as part of the LED subsystem, but more as 
a very small frame buffer.

We like to display entire words, and the most useful interface from a 
user point of view is something that consumes entire strings rather than 
having to manage each cell independently.

You could imagine that if the text to be displayed were longer than the 
display, that the driver would make it continuously scroll.  I would 
like to see a framework where a simple character device were exposed, 
and from userspace you could do: "echo message > /dev/small-display" and 
get something sensible.

>
> 	Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
