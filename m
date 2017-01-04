Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wj0-x242.google.com (mail-wj0-x242.google.com
 [IPv6:2a00:1450:400c:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttvLJ0ygVzDqN4
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2017 02:07:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xzos3nx8"; 
 dkim-atps=neutral
Received: by mail-wj0-x242.google.com with SMTP id hb5so42711109wjc.2
 for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2017 07:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DciBzcoHTeuvJJvqsqAgk+Z8RStRmIWRzx0NcAnQNLg=;
 b=Xzos3nx85Kt9NLvAM2ncsTtA5Myc5uOqugzDf0onJR2Gw56srkrlzjxPkGh8066Gub
 lrci5rkGSxoNm85XBIGluWoLgDbHmqYoGnq0epWwOSf+P+UwslVkEY70P8e7kWJ0Izpn
 jczgyJU6KPjPcMilBXRdjWME0kHhnd5Txj9zJ+HYOLzZRZepATs3WEJw03y71y60B91A
 vJjrczKOO6v+IERp/HPuvVESlExESCv6ZHweBifzqOgIrmN1fb+JiQqRzeLnqkdPY34D
 N6OkQdTFjo0WiMEBn2yxOVilXYmDz/3LLQuhDSulBv8EdwYyhey4ywk8eSGa7ms78EdV
 K6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DciBzcoHTeuvJJvqsqAgk+Z8RStRmIWRzx0NcAnQNLg=;
 b=WiMDVoI9YMws5HbHL5l7PMejBokcKQUjL9uS4ngIz/eMSsT/ORchfsCtQLFMlJyv7L
 3QyhApkoFvdyVgjTtCu5yfQ6+vmZSqEpS0m8DElRdpSjpbWjjSeIDG+ObsfZyDDkTm+j
 o+HUIEVb2ZyXt8Gi3Qd7B9sBjmyjb2iKFKSVU3G7eJGl7NNT8JO2giTADuj/5H9KBKZm
 QUxgy5SPVhKwRIJtPsud+J4jZh9Yjq04HZiJTWpr/TmcXiD0avn4NCrSudjMI9IDlUdK
 PsENb6Js6l30sHLfU+GRBS9vGxXtZa4YUq8K+ROFtf8+LJrQkMX17HOfauKaHVURgu5g
 gx8Q==
X-Gm-Message-State: AIkVDXIPP3bXPwZvlzl+BSe4rybMfPWdbgw5tez4fYDqr+qzA2Qka3fgSUBHNpSZZkKWYyzeVqlCtkbBQdPNqg==
X-Received: by 10.194.122.202 with SMTP id lu10mr6184006wjb.2.1483542435859;
 Wed, 04 Jan 2017 07:07:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.137.100 with HTTP; Wed, 4 Jan 2017 07:07:15 -0800 (PST)
In-Reply-To: <1483494787.22609.4.camel@aj.id.au>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
 <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
 <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
 <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
 <E8AB41DE-BABF-428F-9F12-5F4FE5DD5BAD@fuzziesquirrel.com>
 <1483489505.22609.1.camel@aj.id.au>
 <1483494787.22609.4.camel@aj.id.au>
From: Eddie James <eajames.ibm@gmail.com>
Date: Wed, 4 Jan 2017 09:07:15 -0600
Message-ID: <CALpMbdmMFGVDwGyC6XB6pk4YxA25AqbxU234Zc8RYhN2gNryDQ@mail.gmail.com>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 04 Jan 2017 15:07:20 -0000

Will do Andrew.

Just had some discussion with Brad and Patrick. I think we can use the
"bind/unbind" sysfs api to cause the occ i2c device to probe when we
want it to. Will investigate that today.

Thanks,
Eddie

On Tue, Jan 3, 2017 at 7:53 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-01-04 at 10:55 +1030, Andrew Jeffery wrote:
>> On Tue, 2017-01-03 at 19:13 -0500, Brad Bishop wrote:
>> > > > > On Jan 3, 2017, at 7:06 PM, Joel Stanley <joel@jms.id.au>
>> > > > > wrote:
>> > >
>> > > On Wed, Jan 4, 2017 at 10:49 AM, Brad Bishop
>> > > > > <bradleyb@fuzziesquirrel.com> wrote:
>> > > >
>> > > > What if the driver is built into the kernel?  Is there such a
>> > > > thing as module only drivers?
>> > >
>> > > Our kernel is build with module loading disabled at present.
>> > >
>> > > modprobing the driver when userspace is ready is a neat hack that
>> > > we
>> > > could use for now. However, the driver will need a mechanism that
>> >
>> > Do you happen to know if =E2=80=98a mechanism=E2=80=99 is something th=
at needs to
>> > be invented or
>> > if Linux already has something?
>>
>> I spoke with Rusty about this and by his response there's no existing
>> "event-bus" mechanism. His suggestions for the problem were:
>>
>> 1. As userspace is coordinating the host power-on, do the modprobe in
>> userspace
>
> After some discussion between Jeremy, Joel, Alistair and myself it was
> decided that managing the problem from userspace was the way to go.
>
> The rough approach is to describe the devices in the devicetree, but
> mark them as 'status =3D "disabled";' so they are not bound to drivers on
> boot. It is then userspace's job to trigger the binding as necessary,
> but exactly how it should be done is unknown.
>
> Eddie: Can you investigate what we might need to do to make this work?
>
> Andrew
>
>>
>> 2. Push the power-on logic into the kernel so it can trigger hotplug
>> events to probe the drivers, and expose a power-{on,off}/{soft,hard}-
>> reboot interface to userspace.
>>
>> Andrew
