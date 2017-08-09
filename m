Return-Path: <bjwyman@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSRBm5sLrzDqjB
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 08:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NEwKz3jC"; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id a77so7025810qkb.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 15:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jmRDQ1O/S+IdqOk2YcSu3AEWWs6P8nR2/ciOB/iXDVM=;
 b=NEwKz3jCx6JoZY/BI7tjF3SLEQk1NJO56U9iH+q9IZfNgfPPVUEkqih9NbqDANTxCT
 8Xi37IK4X4xhI5EklNNozaHPH3kVOkhbkLklnnFv7cJw4yT8kgu3zkTH7iAp8qJw3VFM
 FNbgca38rOMrC02kVfwmEmvc2uLluso9Qi3wiBuw/tFyry1Jwg86qoOvU+PfL9W2p+cR
 SS982+ieashuw8ivn0jxbjW4JGX3/431guzuxhbYlHnllk/OFxGbdVwdB8HPgpbYfp/q
 9/h2OPxqvc5J0kE2K2u175zMMVwEFXBU7TBI+YEO5fcACj6zJ0mWsAFOGs7b47bO4j2u
 eTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jmRDQ1O/S+IdqOk2YcSu3AEWWs6P8nR2/ciOB/iXDVM=;
 b=Mi0l2dRRBMWXX7hrT1IjpdqXVgwzO115qcM/vzEuLHGjhOnCc4Tck5F0YYDO3sQpv0
 7qansNjGN8IDs4Dq7ltcUvnceiNIIkpey8Wijo2YFyOLEpVqEhHLa8i0EsykXOddI6aW
 5vFJLaZm76qkGImmvQedjOnENTUEHbuJDB2fk2IViSXOaAMRwF5CSAC4StZsfTtxjrZq
 5PLluTSSbbNReKXZ0vwXLX8v8FkxdcOLYoeFrDkukK03mWhqu9JVNpoH4F6uGBWYFZKY
 hWyzu9uPziJmZhkz3nSowkvYMTD6FQvc/7KcQZahKKaTqMYrp8z2mtxft4jJ+ecRyjab
 5fzA==
X-Gm-Message-State: AHYfb5igSDi8PfKWR5+mbJWNRmhECxDJzUI3L1Wuhva4UBhEw1tD+bYc
 Gt0cbR3h6YF224TA0u/K7XoDDy7gzA==
X-Received: by 10.55.214.138 with SMTP id p10mr4525635qkl.144.1502318622232;
 Wed, 09 Aug 2017 15:43:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Wed, 9 Aug 2017 15:43:41 -0700 (PDT)
In-Reply-To: <1502159688.7946.6.camel@aj.id.au>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806869.29409.14.camel@aj.id.au>
 <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
 <1502084490.7709.1.camel@aj.id.au> <1502159688.7946.6.camel@aj.id.au>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 9 Aug 2017 17:43:41 -0500
Message-ID: <CAK_vbW1yFzg6MUiPJzZ7M=8TjsH8kR-01aDKWsQMz=749a+2mQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM power
 supply hwmon driver
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 09 Aug 2017 22:43:45 -0000

On Mon, Aug 7, 2017 at 9:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2017-08-07 at 15:11 +0930, Andrew Jeffery wrote:
>> >
>> > >
>> > > > +
>> > > > +static const struct i2c_device_id ibmps_id[] = {
>> > > > > > > > > +       { "witherspoon", witherspoon },
>> > > > > +       { }
>> > > >
>> > > > +};
>> > > > +MODULE_DEVICE_TABLE(i2c, ibmps_id);
>> > > > +
>> > > > +static const struct of_device_id ibmps_of_match[] = {
>> > > > > > > > > +       { .compatible = "ibm,ibmps" },
>> > > > > +       {}
>> > > >
>> > > > +};
>> > > > +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
>> > >
>> > > p8_i2c_occ_of_match isn't right. Do we need both device tables?
>> > > "witherspoon" as a device ID also seems unusual. What's going on there?
>> >
>> > Uhh, not sure how that got in there... How does this compile?? I'll fix
>> > it. The power supply doesn't have any device id or anything, so I just
>> > went with witherspoon...
>>
>> My issue is "withersoon" identifies a class of machine, not a power
>> supply, even if the powersupply is specific to Witherspoon.
>
> Further to this, I've just got hold of the datasheet. My reading of it
> says the part number is "01KL054". Maybe the driver should include that
> in its name and compatible.
I don't know that this part number value always remains the same, for
the part used in a particular system. There was a similar 2000W PMBus
power supply that had one part number, and it stuck. However, a
previous 1720W power supply had at least four different part numbers
before it finally stuck on the final one.

That being said, there quite probably are some differences between
various part numbers, but most of what this device driver is doing
would still be compatible. I can see have 01KL054 in the compatible
list, but trying to shoe-horn it into the device driver name doesn't
feel like it makes sense to me.

>
> Andrew
