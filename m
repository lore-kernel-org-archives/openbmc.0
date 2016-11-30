Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wj0-x244.google.com (mail-wj0-x244.google.com
 [IPv6:2a00:1450:400c:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tTQYL5qn9zDvsL
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 03:17:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/ppSSn1"; 
 dkim-atps=neutral
Received: by mail-wj0-x244.google.com with SMTP id kp2so22929075wjc.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 08:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OFHciaWVNV+p+u+7A2SxCIfjjgaFEL7sgr5q9jKeyO4=;
 b=j/ppSSn1gLKs+J2+NGM0Vh0Wn6ZHId2iauAVJ9kJfzze3bDKk46A8Z8sHyyNVfWGF6
 C9QxLaUjeCDwjGBSj+IkZJCH9FdOpXfIbbJmzKYaPfHXBusguFtLbaQFNpf3l45/EXcb
 20zXvnrmaipH4Mu9VLdpzxkADqC/0DY5XonJ9leVmuYyZhy9LfSnFcMBJrq16lCbSqcu
 fHPZxgH8rQtI0HngIbX5stuupQYozYepQURzAMxCIjweMfq2MVWFgyEjUBFThMUVVmg6
 wdi7jVXR4RzECFF6raeT1A+oaNNGIHVZt6rsBGaZpy0zq8+6yaP1e1XE/13xlY/naN/A
 Zaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OFHciaWVNV+p+u+7A2SxCIfjjgaFEL7sgr5q9jKeyO4=;
 b=STicVDfqdmPrEbBL8lcUhI5VH4SM2371p4TNzqnSK3fi/vHEkFvCwo/vYg5cnoPVRI
 t/mpPIVq/u3Z6iMw3yT803/2sMZAwmg1+NVtRMz1G6j7ytOV8unf8lHsuyRFqlOH4Twf
 0Y5t1tZXk0D++KdjwNJU2YyFmQ0p7QvKkonT5IorI6zolOWKCIZzMRooIWH7f+EZUU+g
 XpO24HkItDoHGh80xM06aAMYt0vkCUScrFHhTbzTJKyY9JGvsiywD7t1t55bCNvCVXkt
 QAct6Uvl8AfEEKOeY3K16dWcq/jsPmkJP8d31R5HTS2D+DXrBw8XXBy3XsNzOk2Os0nX
 EpMQ==
X-Gm-Message-State: AKaTC01JcMJ3tFi779ZPWLBaAfvkEGa9RBy7vakjuaqFAs50btTkEkHn7lLPJNti7R5OC8jWh6HK8U2nIDsqig==
X-Received: by 10.194.115.70 with SMTP id jm6mr29504001wjb.140.1480522643150; 
 Wed, 30 Nov 2016 08:17:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Wed, 30 Nov 2016 08:17:22 -0800 (PST)
In-Reply-To: <1480467654.2503.96.camel@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <a8d6f13b45861401ffc6ea5b2e1d89519301483a.1478835488.git.andrew@aj.id.au>
 <CALpMbd=eu5gmjZ_-5mt0mkXs+RKXVjQ6ddLXmYzawa4PJJob9A@mail.gmail.com>
 <1480467654.2503.96.camel@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Wed, 30 Nov 2016 10:17:22 -0600
Message-ID: <CALpMbdkcqOO5kUQf5nzNE+_W2yWtTwV7ej86SnYbs6a_zTLvPw@mail.gmail.com>
Subject: Re: [RFC PATCH linux 6/9] hwmon: occ: Add hwmon implementation for
 the P8 OCC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 30 Nov 2016 16:17:27 -0000

On Tue, Nov 29, 2016 at 7:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2016-11-29 at 17:00 -0600, Eddie James wrote:
>> > +
>> > +static int occ_p8_probe(struct i2c_client *client,
>> > +                        const struct i2c_device_id *id)
>> > +{
>> > +       struct occ *occ;
>> > +       struct occ_sysfs *hwmon;
>> > +
>> > +       occ = occ_p8_start(&client->dev, client, p8_bus_ops);
>> > +       if (IS_ERR(occ))
>> > +               return PTR_ERR(occ);
>> > +
>> > +       hwmon = occ_sysfs_start(&client->dev, occ,
>> &p8_sysfs_config);
>>
>> I see why you defined those here. But I guess I don't see why
>> occ_sysfs_config has to be separate from occ_config structure. It
>> could be populated in occ_p8_start and then passed to occ_sysfs_start
>> here.
>
> I admit getting to this point was a little tricky, and I'm not
> completely satisfied by what I've come up with. Here's my reasoning:
>
> I felt that only half of your struct occ_protocol dealt with SCOM
> protocol problems, specifically the command_addr and response_addr
> members. num_caps_fields and caps_names were only used in the sysfs
> code where they are relevant for interpretation of the payload, but are
> not in transacting SCOMs. Therefore I removed them from struct
> occ_protocol.

Makes sense.

>
> I also renamed struct occ_protocol to occ_config. I could live with
> either name but my feeling is it's more obvious that the consumer of
> the API needs to populate a struct with 'config' in its name.
>
> Given I'd removed num_caps_fields and caps_names I had to put the
> information somewhere. One place might be in struct occ as I've
> interpreted your suggestion above. However, I was trying to keep struct
> occ opaque so in occ.c could fully encapsulate its behaviour. As struct
> occ is opaque, occ_sysfs.c has no visibility into its members and thus
> can't access anything we stash in it, e.g. num_caps_fields and
> caps_names.
>
> That leaves us with needing some other solution, one of which I've
> implemented above. It achieves the goals I was outlining above and
> keeps the sysfs code free of any implementation specifics, at the cost
> of describing the information in a slightly weird spot.
>
> An alternative might be to define struct occ_sysfs_config in occ_p8.c
> and add an extern to occ_p8.h. That bakes sysfs knowledge into the p8
> header which to me feels more unfortunate than my current approach. Or,
> define say p8_caps_names and p8_num_caps in occ_p8.c and extern those
> in occ_p8.h and use them to define a struct occ_sysfs_config here. What
> do you think?

I think your solution is fine, I was just a bit confused as to why you
decided to do that. Let's stick with your solution, it's better than
putting it in the headers.

Thanks,
Eddie
