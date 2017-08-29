Return-Path: <jacek.anaszewski@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhdbS00xbzDqF9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 05:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhnQiOrY"; 
 dkim-atps=neutral
Received: by mail-wm0-x242.google.com with SMTP id e67so4714942wmd.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Ils2Uii4KtUgGKVtB3X8QVtV7Phe4viAKc2gLQYvkUQ=;
 b=jhnQiOrY2GFfaXBGpn+tNdhVhU/kdR/XdzGrf0QGTOn86R3ROJNjphmuQd9CSRMNI7
 nHNuIwEy80+v7sj7L9oCveTBLJNM0PlkQLizrV3XIVGGKQMZX7uQTzhiKwHImOHl20L+
 i15sJcYz1sRJcltUZkQxdUqwnnfUrWn4HLazmJdmRIqKBfuiXeGFC76lPZ19Le5/bRPE
 zCTdhxwJsumb4C7NsvHcNTM9VIi2RZPrklskqp2gHKKpegCnp7KR065PFCsq2E0QtmB5
 cLoMdUIsyVKM4pHIzeigK+4NDZeiCMn0gaaKqr3kv7lw1K5dCgkPMIlX2bZcl6c91euh
 if4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=Ils2Uii4KtUgGKVtB3X8QVtV7Phe4viAKc2gLQYvkUQ=;
 b=Mw9SInATPwdXq/WyjiXmNIeGa6ePFzUWEHeJmgeZJsUkwthgOYIQYBxeR4+Lfdh8RF
 2tKSA03Rwto7bYsS3ySkWJsDk28jODjhh6BIvDgEwsQynV+gt2KSQkIqS0QJKfnbnETi
 ok3Fx3Xoh19CHaSlAvKMyHFx33ypiHsdRkblIz0i5mFmt+IIMtPRk/Ps+B6O4h4r39TN
 18gW6mEFIJcJQYwTAAsN4tp++RtECZhdpDHBxKfhu4QzecNCEuyKRohalrj+xPJi+MGL
 Zmw7lRWfpcgBAhh7Jx4+Ouj2+b3+GWzRgPGPKWhwVHg/TqTI+oSNgjXeL7B2a9A+6rcF
 bvOg==
X-Gm-Message-State: AHYfb5gCLvUWEHujCnUH4nJuGtsV7ibyf3JXJmzi4FYxJXgcsWyK57s8
 rXc/LLACsDq79A==
X-Google-Smtp-Source: ADKCNb7UninjuCijkpBdowo8FIqnTeiwgAyw+lVZIlOCGXlNWAthyIGbOxfAmTj03nCizFgGAPHBEA==
X-Received: by 10.28.27.73 with SMTP id b70mr331426wmb.161.1504034031510;
 Tue, 29 Aug 2017 12:13:51 -0700 (PDT)
Received: from [192.168.1.18] (bfy117.neoplus.adsl.tpnet.pl. [83.28.62.117])
 by smtp.gmail.com with ESMTPSA id h88sm2683457wrh.19.2017.08.29.12.13.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Aug 2017 12:13:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
To: Brandon Wyman <bjwyman@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au> <20170828101952.GE18012@amd>
 <CAK_vbW2BJjKa0dKoVjbRE++-2VB+3fM0DQ7u3DnwD2Tj-4bY7w@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, mark.rutland@arm.com,
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, rpurdie@rpsys.net,
 linux-leds@vger.kernel.org
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <f7a7f905-3743-0c83-affd-a9ec7e20159f@gmail.com>
Date: Tue, 29 Aug 2017 21:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAK_vbW2BJjKa0dKoVjbRE++-2VB+3fM0DQ7u3DnwD2Tj-4bY7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Aug 2017 12:14:14 +1000
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
X-List-Received-Date: Tue, 29 Aug 2017 19:14:00 -0000

Hi Brandon,

On 08/28/2017 11:13 PM, Brandon Wyman wrote:
> On Mon, Aug 28, 2017 at 5:19 AM, Pavel Machek <pavel@ucw.cz> wrote:
>> On Mon 2017-08-28 09:47:10, Andrew Jeffery wrote:
>>> On Baseboard Management Controller (BMC) systems it's sometimes
>>> necessary for a LED to retain its state across a BMC reset (which is
>>> independent of the host system state). Add a devicetree property to
>>> describe this behaviour. The property would typically be used in
>>> conjunction with 'default-state = "keep"'.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>> --
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
> Tested-by: Brandon Wyman <bjwyman@gmail.com>

Added this tag to both patches (1/2 and 2/2), thanks.

-- 
Best regards,
Jacek Anaszewski
