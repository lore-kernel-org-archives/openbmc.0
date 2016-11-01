Return-Path: <xow@google.com>
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7lQ70XRQzDvHg
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 08:54:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Jqx7NMdf; 
 dkim-atps=neutral
Received: by mail-qt0-x22d.google.com with SMTP id n6so67762121qtd.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vvRozQ3mAZ0qVzQVZnQ/u0XfT2uHY5oZ67yZIrkbT0w=;
 b=Jqx7NMdftrF49bmJ/SYwHNierRO5TzGRCF3LG3hkTuq9E3NnF8i0y7Vfijymv3to7D
 MSR1yp+Q5NY77+JC/ma8B5Ia/7X7Ol+48JAUbujHHRF56B9Bj3VtlUeNNFQ3/Nz/PCKT
 FZfPv6qinrJe/z5h50nqAXSTQ1N0l7VsWU2XBFmN0fRcOD7YZhqxQ3CizFJHLmdXDQKj
 O7oxJgKpPmU86XZXYDRAYWWN7phczZxACu5WDEnzTNzH0Pd4RxRsmCFHqc7ovWmpjGiq
 OMIjI5t9IcbBxr2dl8jJPp/nlTsC/0iaAED3jT6e6k78FFq4hno5TbctoNbwPUlARXUw
 y4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vvRozQ3mAZ0qVzQVZnQ/u0XfT2uHY5oZ67yZIrkbT0w=;
 b=WNZ2ImlkJx4dcV6StrVoJq3xNeeG4TbEGMHjYi4EHuQQ89AMfV+3ecxHCN7p0Rd1O5
 ioEuYfjldUxrldsuxjPH+k3qYoEtIgXZ/Chy4RK3D6E2oKzYlp38dOdmDVrteQ3JYGKK
 tuTdvVH+IlKFhMUFRP8KRL5cCSElxLDaPjnI3N8ohEN04bgf9sqBD5+4wTX46NWU7uIQ
 saNyQNaKKRD72CifAIJs4VrWpJEwJwlpTo3HqanS2mRRB0mWh/OSzzATp8fcWzM0GWDQ
 WRBgLAmVoDXo1Zk6SXGBEykwJQ4urnWrCEjJgrkGaHDTyHD32zj9AtykH2z+hiVTkhb0
 p7YQ==
X-Gm-Message-State: ABUngvdR8NbNzGbxcGN9dSOyuLyhP3x+A6rbVVW+wQVVmDcvoUxUx7wJ7P80ih6p7Xyht0iJAlqRAUvV+UIBQw1a
X-Received: by 10.200.48.120 with SMTP id g53mr185082qte.113.1478037291583;
 Tue, 01 Nov 2016 14:54:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Tue, 1 Nov 2016 14:54:51 -0700 (PDT)
In-Reply-To: <20161101192409.3zgt6gauspdera77@asimov>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <09ACC961-A154-4930-B6F1-1CA0DCC65559@fuzziesquirrel.com>
 <20161101192409.3zgt6gauspdera77@asimov>
From: Xo Wang <xow@google.com>
Date: Tue, 1 Nov 2016 14:54:51 -0700
Message-ID: <CAPH-5w6ZOkx6QBxCL_xgTvA+X_OKfn6mdnnR1q3b42-ipmrj3g@mail.gmail.com>
Subject: Re: Comments on Sensor design.
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 01 Nov 2016 21:54:55 -0000

Hi Patrick,

On Tue, Nov 1, 2016 at 12:24 PM, Patrick Williams <patrick@stwcx.xyz> wrote=
:
> On Tue, Nov 01, 2016 at 10:10:08AM -0400, Brad Bishop wrote:
>> I can see a path here to extending what a sensor is (additional properti=
es)
>> without impacting the existing API.  Do we lose that capability with opt=
ion #1?
>> What about com.ibm.Sensor or org.open_power.Sensor?
>
> I don't think we lose that.  Someone could always extend it with a
> 'com.ibm.Sensor.Temperature' interface if they wanted.
>
> I fully expect that we will have at least one extension which is related
> to thresholds.
>     xyz.openbmc_project.Sensor.Threshold
>         property max
>         property min
>
> I suspect what I just wrote isn't correct and may require multiple
> interfaces to handle all the different threshold types.
>
>> >
>> > In both cases the dbus path could contain the 'type':
>> >    /xyz/openbmc_project/sensors/temperature/ambient
>> >    /xyz/openbmc_project/sensors/fan_tach/fan0
>> >
>> > The question is essentially should the "Unit" property be used to
>> > resolve the 'type' or should we have distinct interfaces for each
>> > 'type=E2=80=99?
>>
>> Leaning towards the latter, for the reason stated above.
>>
>
> The big trade-off to me between them, besides minor impact of multiple
> implementations of effectively the same content, has to do with signals
> and filtering.  I could see it interesting to listen for signals on all
> *.Sensor instead of having to listen for them each individually.  Maybe
> the path is sufficient for this as well.
>

I don't think that listening to multiple interfaces or even all
interfaces of an object path is an excessive burden to the
application, since that's only a matter of writing the appropriate
sd_bus_add_match match rule.

The benefit is that a signal handler would be able to differentiate
sensor types based on the originating interface, removing the need to
parse its contents for purposes of dispatching or filtering. That also
means signals can be slightly lighter weight (as in payload).

> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

cheers
xo
