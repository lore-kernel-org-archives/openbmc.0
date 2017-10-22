Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TM8Ndz/w"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yKlDL4rX1zDqYc;
 Mon, 23 Oct 2017 03:22:09 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id b192so10015138pga.2;
 Sun, 22 Oct 2017 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pi/6WgWbu4xHbTNcdme4qRuyl4FFgDQgeiMQ+QLFJ0A=;
 b=TM8Ndz/wcKBnBS8G3YzqSJjFjwen4L57tmhqcV3rPGeTFSGBg6OLVA/HPPeT1OW1W7
 xMRjaTF/d1jiHsWKPdNyRF8qYBufaPjXRFHw2gxlgu+2i28qTLZVfzKq6u8kZQ2tqFwx
 Z+rRDfg9WUcW4+X+9AVbXkKYV3Yt2Pj6JakGvUdluwpzvf3ldcn5limKfwn37Y0D/XcF
 FSW2h6gC3GO7DBXTo9R8of9wVdosbibMMbZjT2lLSG9Cg15Xguy8N3wWjMe0pciT1rzm
 TPdfADl8xzSbTHXMqFbqUZiNhHYZuVH8iZMg94o1vXuRxL6Q2VqWoggbzJSwjdFRPzkz
 os0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pi/6WgWbu4xHbTNcdme4qRuyl4FFgDQgeiMQ+QLFJ0A=;
 b=GN8QOKilCgxDlFEfSjX1NJNuNBjeyVY7BHuDTo4qPv9jkxnBrjQvEpHIjtOiDeCH+T
 IQSUlniMzum+2+Fk2Ph0kmK0fzKwl0Qjiom6vagSZwpk54rO/MjDVWJy2vVig540gHjc
 9BxDIZiDAS3FnlltDzFZ6qNBXXg2RlqVmf8IpYD+ObMFjyR1dTjr01LB8p0njl65/BlH
 eNPODkScpXOlsTb47hUHGdTAtiRlunnIXYxeft0AphWWCNs9zewKSVIpue92stCMim9u
 b3ZRU+Aier/M5z5n/+PSGGcvwG4PGViKoX8Vvrrl30ZclqC3FQPv4gOIY5pViRjiNdUx
 zJUA==
X-Gm-Message-State: AMCzsaWjQXSEqxit6m8nmuOGYN1JeVujhajrjc3IES49yjw7v4yGswZw
 5gRidRUKPIXKU57yVQ7pqEkDVOCe
X-Google-Smtp-Source: ABhQp+TpY49czupj4s8KNP+DMepaX5QPqCRUinVF4NVki+r13FxR5EHh5EccVvOoBnFhzkfFf1s5Uw==
X-Received: by 10.99.4.209 with SMTP id 200mr9795374pge.123.1508689327660;
 Sun, 22 Oct 2017 09:22:07 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id n72sm9144400pfi.92.2017.10.22.09.22.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Oct 2017 09:22:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 4/4] watchdog: aspeed: Move init to arch_initcall
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org,
 Ryan Chen <ryan_chen@aspeedtech.com>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-5-andrew@aj.id.au>
 <CACPK8Xdz1iK-4bqZfmfTUYw3zDLxCniwt6LupJq5mo-CCca3XQ@mail.gmail.com>
 <1508240158.24322.16.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c3f1b8d1-fe4d-c68f-5f05-c4cb75912e2c@roeck-us.net>
Date: Sun, 22 Oct 2017 09:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1508240158.24322.16.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 22 Oct 2017 16:22:11 -0000

On 10/17/2017 04:35 AM, Andrew Jeffery wrote:
> On Wed, 2017-09-20 at 15:43 +0930, Joel Stanley wrote:
>>> On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>> Probing at device_initcall time lead to perverse cases where the
>>> watchdog was probed after, say, I2C devices, which then leaves a
>>> potentially running watchdog at the mercy of I2C device behaviour and
>>> bus conditions.
>>>
>>> Load the watchdog driver early to ensure that the kernel is patting it
>>> well before initialising peripherals.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> I agree that we need to make sure the watchdog driver is loaded
>> earlier. I think this is the correct method, but I'll defer to Guenter
>> on this one.
> 
> Just following up on Joel's comments: Is there anything else I need to
> address?
> 

No. Sorry, I have been terribly busy. Digging through patch backlog today.

Guenter
