Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB09C47DD9
	for <openbmc@archiver.kernel.org>; Wed, 28 Feb 2024 11:05:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlBMd0jZ9z3vdL
	for <openbmc@archiver.kernel.org>; Wed, 28 Feb 2024 22:05:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlBM25qYcz3dXF
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 22:04:26 +1100 (AEDT)
Received: from [192.168.0.53] (ip5f5aedb1.dynamic.kabel-deutschland.de [95.90.237.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8347861E5FE05;
	Wed, 28 Feb 2024 12:03:57 +0100 (CET)
Message-ID: <e2b0b8e3-9b39-4621-9e43-d7de02286a27@molgen.mpg.de>
Date: Wed, 28 Feb 2024 12:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de>
 <4b06d535-6739-47b5-ad1e-0ff94322620e@roeck-us.net>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <4b06d535-6739-47b5-ad1e-0ff94322620e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, Ban Feng <baneric926@gmail.com>, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Dear Guenter,


Am 28.02.24 um 10:03 schrieb Guenter Roeck:
> On 2/27/24 23:57, Paul Menzel wrote:

>> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
>>> From: Ban Feng <kcfeng0@nuvoton.com>
>>>
>>> NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>>
>> Please reference the datasheet.
> 
> Note that something like
> 
> Datasheet: Available from Nuvoton upon request
> 
> is quite common for hardware monitoring chips and acceptable.

Yes, it would be nice to document it though. (And finally for vendors to 
just make them available for download.)

>> Could you please give a high level description of the driver design?
> 
> Can you be more specific ? I didn't have time yet to look into details,
> but at first glance this looks like a standard hardware monitoring driver.
> One could argue that the high level design of such drivers is described
> in Documentation/hwmon/hwmon-kernel-api.rst.
> 
> I don't usually ask for a additional design information for hwmon drivers
> unless some chip interaction is unusual and needs to be explained,
> and then I prefer to have it explained in the code. Given that, I am
> quite curious and would like to understand what you are looking for.
For a 10+ lines commit, in my opinion the commit message should say 
something about the implementation. Even it is just, as you wrote, a 
note, that it follows the standard design.


Kind regards,

Paul
