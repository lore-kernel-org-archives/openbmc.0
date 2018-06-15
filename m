Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22c; helo=mail-ua0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E5y19uTW"; 
 dkim-atps=neutral
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 416qsK3ybNzF09q
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jun 2018 05:13:41 +1000 (AEST)
Received: by mail-ua0-x22c.google.com with SMTP id z16-v6so7071408uaz.10
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J9N1Jc5FjvIWIXP5r0EVh3ryNWNI/GOVmLNSRviQEWw=;
 b=E5y19uTWYMA0FpV8HAkbXorUgSXrs8xaCfTp1sCeDHKwjwpPElZRNPw44BKaz/2mhW
 lDZ3oTyfRlMVMOtWhjKdJYzJGv1H84MOD9tgzPXlMRgI2SfKrW1c3/Lom5jfc2oCD8nf
 Pw6zp2wTv1FbtoD/JkBWzPWkWC+bWw3TL3RIxVXWVueIFPfnM//oIm5Z4723WcKF63lw
 S6MFYgpDeOwYqb6CTOnRIUdLCWEnDveBZSjJDA11Ehf1+M3H5jv1VxmN8rcJ3Bz+9G8g
 c+TN40CQTyb3/t7BIyLbooLNKaMLyYwht6TUKAjntEiP4f7efq4/32evtd/rpFhPfFfc
 IaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J9N1Jc5FjvIWIXP5r0EVh3ryNWNI/GOVmLNSRviQEWw=;
 b=OB1hxow+JLkhGvVIB3Btx0n3Jw1CGT2+dv9qz3dMMdIDYzrj1ui8iGLZRHBPWm0nAw
 d+1XiTBLBtgzQuF6gVJGwgA0Gbaw1d1Noc4kAmOjKWN6GO/XImMI1KK+teXgg+R/RBkR
 visZy2oqp0L/R5h5cZtVpTPujWiJqYonzHQBVlcN9Pi06MHaNtjevPdJQZPhZMPNepg2
 7a+HJYXltDBLkijvrIqvS/YpByY0kf2jQhtykbXziEtXt8G9HQYhM97oBLJRuUpMLUBJ
 KYlsz25jI067wTOr7jz+qk+SUPK/avYMUuRi0zuljdvtMAjatrL5eWKqyjwuXbWkRbzu
 UB2w==
X-Gm-Message-State: APt69E3d6zeDTCUb3GmGzdTkG4mkDmmI2UM0xB3jfl1NJK/rZqnHm7Oy
 V+aejj0ATYMTQzJWGKEf/ueH0kzH0MKO2rGuMCERsg==
X-Google-Smtp-Source: ADUXVKIjwTSB14EiXrj7oJAzUmBTjMuZpo4UtQ5LP9neBN+uOvGZNj/KRwzmIkrvdSpsMe/HlnABeVYrs+gbfWuCoIA=
X-Received: by 2002:a9f:2266:: with SMTP id
 93-v6mr1968555uad.142.1529090018249; 
 Fri, 15 Jun 2018 12:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:bd94:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 12:13:17
 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993457F6D79@ORSMSX113.amr.corp.intel.com>
References: <CAO=notwpFu4WwDBKfSt7-C8VuP6CusZGg3hThsAcdRwSD0yXZQ@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993457F6D79@ORSMSX113.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 15 Jun 2018 12:13:17 -0700
Message-ID: <CAO=notz_JiCumj+90MOoojRaXcxaO+JkxpLQ0SqXg19PVX-oOg@mail.gmail.com>
Subject: Re: New Feature Request in phosphor-pid-control
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 19:13:42 -0000

On Fri, Jun 15, 2018 at 10:36 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
> This seems like a bit of a corner case in the thermal realm.  Are you rea=
lly sure that you want the same PID tuning values for the margin sensor as =
the absolute sensors?

We use margin values, so this use case isn't going away :D.

>
> Me and my team are actually trying to get away from margin sensors altoge=
ther.  Customers don't seem to like them, and question the fact that they'r=
e negative numbers.  It's  mostly a psychology thing, and usually after exp=
laining it to them, they understand and can live with it, but it's a pain p=
oint all the same.  In lieu of margin sensors, we're trying an approach now=
 where all sensors are absolute, but we dynamically adjust the thresholds b=
ased on what we find at runtime.  Most of the components expose their own t=
emperature goal values through some kind of interface.  In the case of Inte=
l processors, we would set our thresholds based on the information we read =
over PECI about the CPUs thermal characteristics, and report the absolute v=
alue back, then take our thermal limits as a percentage of the goal values.
>
> Back to your proposal, I'm not really clear on what the issue is with the=
 existing solution.  If the "goal" is to hunt down for a temperature, doesn=
't that just mean that the proportional and integral components of the loop=
 would have a negative coefficient in the tuning parameters?  It doesn't re=
ally matter what the sign is on the error calculation if you can simply rev=
erse it in the PID values.
>
> I fully support adding multiple sensors to a single PID loop.  This was o=
ne of the things that we were planning on adding as soon as we got more tim=
e for fan control (hopefully next quarter) but I'm not really following the=
 addition of a new parameter.

In order to choose whether to maximize or minimize the value, a goal
that varies based on the inputs, we need a method for specifying this.
The code won't care if it's a margin sensor input or absolute
temperature sensor input, but the human can control the behavior by
specifying the correct PID coefficients, as you said, but with
multiple inputs -- the code needs to know what to choose.

>
> -Ed
>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+ed.tanous=3Dintel.com@lists.ozlabs.org] On Behalf Of Patrick
>> Venture
>> Sent: Friday, June 15, 2018 8:39 AM
>> To: Lei YU <mine260309@gmail.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: New Feature Request in phosphor-pid-control
>>
>> The thermal pid controller object only supports one input.  The PID
>> parameters determine whether its goal is to increase or decrease the fan
>> speed given a set-point.  My primary usecase was to have the value as a
>> margin, if the sensor value is 15C, and the setpoint is 10C, then we're =
fine
>> because 15 > 10.  However, if it's an absolute temperature your goal wou=
ld
>> be the opposite, to speed the fans up until 15 went down to 10.  Because=
 of
>> these opposite use-cases it wasn't clear what behavior would be taken wi=
th
>> multiple inputs.  We have another program take dozens of inputs and make
>> one margin value given a configuration, and that's what is passed down t=
o
>> phosphor-pid-control.
>>
>> My proposal is to support multiple inputs to the thermal controller and =
there
>> will be a new field in the configuration "min" "max" that will decide th=
e
>> behavior.
>>
>> Patrick
