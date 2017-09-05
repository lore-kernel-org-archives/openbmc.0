Return-Path: <jacek.anaszewski@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c0c::22f; helo=mail-wr0-x22f.google.com;
 envelope-from=jacek.anaszewski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pyzbzUlI"; 
 dkim-atps=neutral
Received: from mail-wr0-x22f.google.com (mail-wr0-x22f.google.com
 [IPv6:2a00:1450:400c:c0c::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmxCj0N3czDqYY
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 05:11:43 +1000 (AEST)
Received: by mail-wr0-x22f.google.com with SMTP id y15so10470098wrc.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 12:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=v0Kth0EZ5xlYBgWxvaaa1TzgAqF8n58zW3FvY/KpFzY=;
 b=pyzbzUlIjizqtoMEh43rWVa3YhLLGq+4KJmjBfLhhGRF9SIY//8uYs2I15OOVHznUv
 JNbi7r8Q4vCi7eN1fHkvhRsCdYnpoOUE0ymrHOhKg+IuhNgs/DLnOvOxEueo26BQCqTi
 nLaRSIBLbUb+tlnXpXjanBlAFYV4tCTKZylqXwlQdY7/kX4OT2wzsZ4XC5kwhLNfgdpk
 E1385j99zak6cUNxIQuAADGruP4TzmXJWmfM6HMx55jSgiUeNi4GgICNR/Xh5IsnEB1B
 M08Tv6lGsPAWS5a2yslrbTbPurgZP1AkxclUhInKHaDvBXF+0mKosgcBdSohVFX1XjnL
 dCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=v0Kth0EZ5xlYBgWxvaaa1TzgAqF8n58zW3FvY/KpFzY=;
 b=mGHI+0D7kWiI1lILEOvGJlkLtySTAAzxYmNO/CgXuCcGpP2DK92ZK8AyzLNBd0Nweb
 CGbeRVYHQs3sHu7fXcOIwEX8AUBqmOBySPBDt7aDsFJtKyE3TQ3lMlBZxc1MOHTNC3SS
 M7txFrHn/FNtfHXFIPpBaThWGkS3JwmACD4D7Eb1GlMmY+jK63JPlSRYpAA87OQIkZtP
 a4GixIERt7C7J+Z1Rg0uv5sbAOE1hTZ6vBIpSmGDrDctrwJS5DQz9Fr1FSWDPaSdg7vy
 4+SnzjBD/xhR6QDDjg0XnErroFXrBRcvn9Mj9FJWTvqTMuPy1tO2yxRC43e6gCLrla/d
 /GjQ==
X-Gm-Message-State: AHPjjUiIX6hskG7maH+DCWI/e9MokeGJUGu5TRO5lLTIUu0GUFrn5+nb
 RTiQcy6pg5pULUQoTNw=
X-Google-Smtp-Source: ADKCNb5mTBmRy1xUi5CEQIee758mAOJ5fuYvrrzxqR60moT7JFqWoC7G8fDvDJDSC6DU+6DnyV5kLg==
X-Received: by 10.223.172.239 with SMTP id o102mr39324wrc.135.1504638699087;
 Tue, 05 Sep 2017 12:11:39 -0700 (PDT)
Received: from [192.168.1.18] (dlw76.neoplus.adsl.tpnet.pl. [83.24.52.76])
 by smtp.gmail.com with ESMTPSA id w204sm864464wmw.32.2017.09.05.12.11.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Sep 2017 12:11:38 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh@kernel.org>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
 <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
 <1504220536.5933.32.camel@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, pavel@ucw.cz,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Enigmail-Draft-Status: N1010
Message-ID: <43133266-01c1-4ec7-893e-a7b0544f7720@gmail.com>
Date: Tue, 5 Sep 2017 21:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1504220536.5933.32.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Sep 2017 15:24:19 +1000
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
X-List-Received-Date: Tue, 05 Sep 2017 19:11:54 -0000

Hi Andrew and Rob,

On 09/01/2017 01:02 AM, Andrew Jeffery wrote:
> Hi Rob,
> 
> On Thu, 2017-08-31 at 16:28 -0500, Rob Herring wrote:
>> On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
>>> On Baseboard Management Controller (BMC) systems it's sometimes
>>> necessary for a LED to retain its state across a BMC reset (which is
>>> independent of the host system state). Add a devicetree property to
>>> describe this behaviour. The property would typically be used in
>>> conjunction with 'default-state = "keep"'.
>>  
>> A bit quick on the applying of this...
>>  
>> I don't understand how this works. The BMC usecase is interesting but 
>> that's fairly irrelevant to the binding. How do you know the GPIO state 
>> thru a reset?
> 
> The answer to that is a property of the system design in my opinion.
> 
>> You're doing a core reset, but not reseting the GPIO 
>> controller?
> 
> Well, in my specific case, the GPIO controller in question isn't on the SoC,
> it's off-chip behind an I2C bus. Powering off a BMC doesn't necessarily mean
> removing power from its peripherals, so in this case the their state is
> maintained.
> 
> Alternatively, and again in my specific (Aspeed) case, the on-SoC GPIO
> controller can be selectively reset with respect to the rest of the SoC, or
> individual GPIO lines can be marked as reset-tolerant. This gives the same
> capability and is what you've suggested above.
> 
>>  
>> When you use 'default-state = "keep"' but not this property? Seems like  the
>> same thing to me.
> 
> Is that not also true of retain-state-suspend?
> 
> The existing behaviour of leds-gpio was to turn the managed LEDs off in the
> remove() path. To me this was unexpected behaviour, but it is what it is. My
> first pass at the patch (before I sent it out) was to do as you suggest and
> only turn it off in the absence of 'default-state = "keep"'.  However there
> were quite a number of users of that configuration, and this could be an
> unexpected change of behaviour. Given retain-state-suspend was already defined,
> it seemed that the non-breaking way to get the behaviour I desired was to
> introduce retain-state-shutdown.
> 
> Sure, this is dealing with problems in the driver and not describing hardware,
> but at this point the behaviour is already in place and people might be relying
> on it.
> 
>> Presumably the bootloader would just distinguish  between a
>> warm and cold reset to decide whether to re-init the state.
>>  
>> Finally, if we do have this property, why is it GPIO specific. You could 
>> just as easily have a LED controller IC and want to do the same thing.
> 
> I don't think we're precluded from making it more general even if it's
> submitted as specific to leds-gpio? I don't have anything against making it
> more generic. I was tossing up about doing so, but went for the specific case
> first because we could make it more generic without problems. Going the other
> way is harder.

This explanation looks reasonable. I'll wait two more days before
sending LED 4.14 updates upstream.

It would be nice to have clear Rob's statement about this patch set -
either ack or NACK.

-- 
Best regards,
Jacek Anaszewski
