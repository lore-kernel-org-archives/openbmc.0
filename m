Return-Path: <narmstrong@baylibre.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdxnr1rd9zDvk6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 00:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ADj1F/D4"; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id n21so18899212qka.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 05:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=Orx3GWpVy15T8ddRMed3sPaUnBUu4bm03glcs/H8lLM=;
 b=ADj1F/D438fcB6Pl2wLJPkUGWXsN8sJQZ3s2evX925TZmapuaHolVlfv4JRaHbW5qG
 wG4U6qnj+i4KD+nwdSHlSE2s0Uj3I7ypo2FplsudLqtusDLZLLLB4v0wKX5IPiJc9v/N
 MTVKElejPv3Lu/JAeRksfs27n83KN89UhE0uSE6XflGdotUKHJW3NEmnAMJTK7choUHF
 jqxp5aq/LQldJ46BJXv7IQ5u85/GrbmOUuNSXKq1SLTGXFj0YrmMHsNNuL0gTM1S8r+j
 N2Q0E3MiRL7zXBcF4v8r55EjHdq06dNyRSF0WIwf7PUWT9iQCP9n/M8APkqs8qYmVP9S
 vKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding;
 bh=Orx3GWpVy15T8ddRMed3sPaUnBUu4bm03glcs/H8lLM=;
 b=WjvwV8+LXtE66DMEG4YC98FyX1IfFJtjGObyTvfHnEvetryHdllmOj20aan+cz8gxT
 3fFLvGabn1QiQy8xqMKhd5lyPAnPl2wiRMKgL8PpQu/E+BVGXBHZ2U2vi5iqqZw0Gjls
 cvh1Of3f3W07eluD4rcTj1fUdN6+xI4BcrERHWc4ZZHgtkTdbYrUROS/M1TJKZ3ihXGB
 G+gw4pbjR1R2Zr7Wi5n5avW2OikvCc4wWtKy7vLZy/QDMqylSgBiIhtdhwogVz+hu9Dx
 d62yYtKsM1GFZBf4p9ZO/AvW/ZjXMDYTEeQtRmoVJwmZJD19WJs6U0zIT31C15vi68WB
 Tp+w==
X-Gm-Message-State: AKaTC02dhqs6EgLTgy9xgTIwYqNsACSNIdn7kXyWrerWCc2gvW2jDnmopKL/x5THSn+7uqOR
X-Received: by 10.28.69.217 with SMTP id l86mr7194013wmi.129.1481721164294;
 Wed, 14 Dec 2016 05:12:44 -0800 (PST)
Received: from [192.168.1.21] ([90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w8sm7558138wmw.4.2016.12.14.05.12.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Dec 2016 05:12:43 -0800 (PST)
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
To: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214134530.2bd54a4e@free-electrons.com>
 <20161214125641.GA5379@kroah.com>
Cc: mark.rutland@arm.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, arnd@arndb.de,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au,
 linux-arm-kernel@lists.infradead.org
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ac324946-41da-c090-a0ca-78155611bb7e@baylibre.com>
Date: Wed, 14 Dec 2016 14:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161214125641.GA5379@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 15 Dec 2016 00:37:18 +1100
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
X-List-Received-Date: Wed, 14 Dec 2016 13:12:48 -0000

On 12/14/2016 01:56 PM, Greg KH wrote:
> On Wed, Dec 14, 2016 at 01:45:30PM +0100, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
>> Natarajan wrote:
>>
>>> Documentation for the binding which provides an interface for adding clock,
>>> data and clear signal GPIO lines to control seven segment display.
>>>
>>> The platform device driver provides an API for displaying on two 7-segment
>>> displays, and implements the required bit-banging. The hardware assumed is
>>> 74HC164 wired to two 7-segment displays.
>>>
>>> The character device driver implements the user-space API for letting a user
>>> write to two 7-segment displays including any conversion methods necessary
>>> to map the user input to two 7-segment displays.
>>>
>>> Adding clock, data and clear signal GPIO lines in the devicetree to control
>>> seven segment display on zaius platform.
>>>
>>> The platform driver matches on the device tree node; the platform driver also
>>> initializes the character device.
>>>
>>> Tested that the seven segment display works properly by writing to the
>>> character device file on a EVB AST2500 board which also has 74HC164 wired
>>> to two 7-segment displays.
>>
>> FWIW, I proposed a driver for seven segment displays back in 2013:
>>
>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html
>>
>> And the feedback from Greg KH was: we don't need a driver for that, do
>> it from userspace. See:
>>
>>    http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html
>>
>> So: good luck :-)
> 
> Did anyone ever write a library for this type of thing?
> 
> Again, I don't want to see one-off drivers for random devices like this
> that should be able to all be controlled from userspace in a common
> manner.  Much like we did for fingerprint readers a long long time
> ago...
> 
> thanks,
> 
> greg k-h

Hi Greg,

Actually, it's more than a random interface, a lot of SoCs and boards actually have such displays
and it's a pity to use UIO, sysfs gpio bitbanging and all sort of ugly stuff to only print a few
characters a simple and clean driver could achieve.
Some very well known SoCs even have integrated registers to lower the BOM and bypass the need for
a 74HC164 like component and avoid gpio bit banging.

My personal concern is that you could also need to drive more segments, thus 7-segments
is too restrictive.

But this driver is well structured, the gpio-bitbanging sub-driver is welcome.

Neil
