Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDq0T9cN"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y5Hk1yhqzDqCF
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 17:35:45 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id n2so20302723pgm.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Jan 2019 22:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+4IsfouBM5k447fQjg2cNq9AAdG3mq/zeEqYKpDOerY=;
 b=jDq0T9cNzS+qQylrCqprqiv43L6B8a3jBETEBaNmVDZiEkF2wUqA11X7+WRD37oEXT
 v18vmI/y80FxXOcKv3C2xV6ETAGS+zmpscBm0P6rbKGQC16OYmCBVAsJ4n6mz0vzZDzq
 6EYdWClTh1VU3bJL2ml+ReyDWVG2myjIMJ6mh6+ljEJiUhlScSqZ6qY9mKrLOhGD2mot
 EQuY2g2agrQHJu04XT/8RTDQs6IxeoAgCCH49uBTLNZAp7XsvwlVb8wF+VGABLR696Wg
 ihGLnbXoMLaj4sjg8sN9S4FPG64iXlh8WffdnueTYDhjSRCuZVZOfpRHPs8az66RRY31
 dX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4IsfouBM5k447fQjg2cNq9AAdG3mq/zeEqYKpDOerY=;
 b=dSzRXAT3jJy0ZUail+c8Qks5P8dpon1PuUMTChz2ZfdcGD6i8Oa5wCwEDEWIH8UmyL
 CLKtPXSymIk0XkE7hfEi3hvuc7tFM6vlf7txO6iuMV33ELVLb/i9544d5ZiD3l6MDxXY
 WuwaDzcQjwNq08Q6cvmFpes63gAQoO9eqVaMpo0W9Cj3oikp9BugZTAqKnvXGzxAcDQe
 2/pSuYJ1DFhg/SYik+pIWX4DXEwPmbfI8XCiIBmoJWfWgyIqkpszlmWAs8UT17IOia0X
 wX3/PPV6BuflgfQCtzzBwWn7U33K38Heqn77FjzsohJJGP/MQCv3IRombDRfl6e+xzUv
 8SRQ==
X-Gm-Message-State: AJcUukeSzXR1g1txp02+ieGCh2Q2TBHFPmTUfzZjiUWyWPc1JB0Ixl5A
 O2tWFwEBssJRjVVBXO+w3nY=
X-Google-Smtp-Source: ALg8bN5Xq94IKikOFLPj3bv+ASpH6ywwcwP9rPcJaWv5jkc2dy0VXfBVOxceM9Wr8RsxheAwzdv5Cw==
X-Received: by 2002:a63:8441:: with SMTP id k62mr28909415pgd.392.1546842944148; 
 Sun, 06 Jan 2019 22:35:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v89sm98503674pfk.12.2019.01.06.22.35.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Jan 2019 22:35:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
To: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>,
 "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170518.GA1879@roeck-us.net>
 <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa369fc7-23ad-8f06-e295-c591746cfa58@roeck-us.net>
Date: Sun, 6 Jan 2019 22:35:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d3a77a2f9b1741a28f5a2b394b517ea2@HXTBJIDCEMVIW02.hxtcorp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2019 06:35:46 -0000

On 1/6/19 10:30 PM, Liu, Xiaoting wrote:
> Hi Guenter Roeck,
> 
> Thanks for your reply.
> 
> On 2019/1/6 1:05, Guenter Roeck wrote:
>> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
>>>
>> Misleading subject. While the DPS650AB may ber a power supply,
>> it is a PMBus hwmon driver, and should be marked accordingly in the subject.
>>
>> Guenter
> 
> We will change the subject as "dt-bindings: hwmon: Add dps650ab
> documentation", is that okey?
> 

Sure.

Thanks,
Guenter

> Thanks,
> 
> Xiaoting.
> 
>>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> --
>>> 1.8.3.1
>>>
>>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> new file mode 100644
>>> index 000000000000..bbd601100e66
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>>> @@ -0,0 +1,11 @@
>>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>>> +
>>> +Required properties:
>>> +- compatible : "dps650ab"
>>> +- reg        : I2C address, one of 0x58, 0x59.
>>> +
>>> +Example:
>>> +       dps650ab@58 {
>>> +                   compatible = "dps650ab";
>>> +                   reg = <0x58>;
>>> +       };
> 
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
