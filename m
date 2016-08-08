Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s79Wc00dTzDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 18:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rYwhLbme; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 109so4186564uat.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2016 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MnyzqO4W3qmx8BtUuh125fgp7RizwCpJ7BfND7eEfpQ=;
 b=rYwhLbme0bdDIXBwyIFSdFkppOwLw1NsQlOibHh/F0bq1N4IcbQl5yl5BmIfp9QLNR
 ZgKmjw+Wy6Al6AC1ijJUV1prOnr/mu3aQbFYSaXh9VzSnEhsBX2rwqpjJ80J3f/UXihE
 THzlkzoHyjNyJ9AYPLHm3B72ki9Ibx3WQ7Wx9kwqcYxCoERLyUY+wUnQWWhb7Crkv47W
 CDn/vcppFo4p9Ln6XNnCeMt5TAu3yARr5nkvRGEshf86RIl3NPBFwRLVlvA6t3M+PG7b
 rJNdU4KaMFga3PQocxwanjNPOlS6aNfodC2jIL5LuOdkbXFM7L0RnByE9NmWRK6o4HUw
 34Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MnyzqO4W3qmx8BtUuh125fgp7RizwCpJ7BfND7eEfpQ=;
 b=f3SLNAyRfGx4WHKuhS9iQwODgl4hxWtbB5sE5CO72AS5fDMYGidUoJFfilpn1MssWA
 0pAMFONrF9SnZkMGIJdpytbIAvBPiUn9hq4ubANKdtdcSXt8Wk3NQ0gHvp4MUyIKcTD4
 I8zp7buPonFbqiPLu5srDdMKmldPnPKffJomrxfNaJYQ6vpXo5laGIQysG9FhR61mOJs
 vHrij8VTLrcWuge+apIj8scNSD+DRWbrPM0BJ7aJB85FV73LCyYtlOHI8S5Bho/SEmqB
 3BASOf/6L+lhYCQqFjAv8uzIsyDRZl5kQ5FjOG6idlO0w4u3fuunsTNafb+ab/Ij1Et3
 o73Q==
X-Gm-Message-State: AEkooustfEv5kYyK0vXdBh7FRc4YikX1lAZPHX4q7fs6C2LFQrZMRCR+U7NB5o1NHMQjKOjcZ7gAAK4B9cQ7mA==
X-Received: by 10.31.201.71 with SMTP id z68mr18986536vkf.14.1470644841917;
 Mon, 08 Aug 2016 01:27:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Mon, 8 Aug 2016 01:27:01 -0700 (PDT)
In-Reply-To: <20160802044513.GA22837@gwshan>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1470040022.16990.8.camel@jms.id.au> <20160802044513.GA22837@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 17:57:01 +0930
X-Google-Sender-Auth: 2_hoLLj3D1OVdITB7dm1bXQ7U-0
Message-ID: <CACPK8Xdi-Q4JK65LKLzqiOLJ9ZxsAHkNozNnBed_3Q5cN1Auwg@mail.gmail.com>
Subject: Re: [PATCH dev-4.7 1/2] net/faraday: Avoid PHYSTS_CHG interrupt
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 08:27:24 -0000

On Tue, Aug 2, 2016 at 2:15 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> On Mon, Aug 01, 2016 at 05:57:02PM +0930, Joel Stanley wrote:
>>On Thu, 2016-07-28 at 11:04 +1000, Gavin Shan wrote:
>>> Bit#11 in MACCR (0x50) designates the signal level for PHY link
>>> status change. It's cleared, meaning high level enabled, by default.
>>> However, we can see continuous interrupt (bit#6) in ISR (0x0) for it
>>> and it's obviously a false alarm. The side effect is CPU cycles
>>> wasted
>>> to process the false alarm.
>>>
>>> This sets bit#11 in MACCR (0x50) to avoid the bogus interrupt.
>>
>>Thanks.
>>
>>I assume you're seeing this with the hardware in NCSI mode?
>>
>>Is the patch okay for other use cases?
>>
>
> Yeah, the only available testing environment is NCSI. I didn't
> test it on PHY based AST2500. Joel, please give it a shoot on
> your AST2500 board before merging it. By the way, the interrupt
> (PHYSTS_CHG) shouldn't be used even we have a PHY connected as
> polling mechanism is specified to retrieve the link status in
> ftgmac100.c

I gave this a spin on the ast2500 evb. I did get these two messages
when bringing the interface up:

ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG
ftgmac100 1e660000.ethernet eth0: [ISR] = 0x200: PHYSTS_CHG

But from then on the device worked as expected, with no flooding of
the kernel buffer.

I have applied the patches to my tree. Thanks!

Cheers,

Joel
