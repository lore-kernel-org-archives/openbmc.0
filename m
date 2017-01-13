Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0MXs6QzwzDqHw
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 23:35:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pJGHcDiD"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id u25so52201727qki.2
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 04:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cUNEc5gRUh8pR3Qy+GH9mC43dWH1kOhWoVptpAwrp0g=;
 b=pJGHcDiDRj+ZpzNrVIwI5PTZo69EHtF3ZGaWND83NGHokCl+WQIsjpI7q95PqYOdJz
 k6wSNg9nWoNOmul/ApJvsrKojfPAe+uHZAP4LUEzIhqa+AIlb2yp7TeuaGmsBIP5CRSc
 uElVTYvZf4y64y0qtGK8e4IS52MQ9VjvVofAyE0brGjtlr1VW2giMIlksp3P+/cHiF8O
 r8b2Qji2lcZYHpPbS1makKF152jLScGRpAb31fbO45CzVkBeTRTTvtFdKhK6a5IX+YU0
 YdMQna8KXH6rRWZdWKeoyGA9owNAND/rM0K5UJBCcNzmCc5cmwnPKgwLv0NSasU5Ipn5
 s6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cUNEc5gRUh8pR3Qy+GH9mC43dWH1kOhWoVptpAwrp0g=;
 b=rkWvWEza2NxCObUT8a6pvTtMxc9HJjITO5V39pRP9pmuO79fDexqS1vJrIZkNl7teV
 W4ryLhTXYwRkd8v1Tf9cDyRRrSdExBL21u1lUdZafJ4LaOvV8vdblXSbuZ6n+XH8Z7h9
 5RxvrH7qsKPlAcqOsIgmBfbaZL8yxvRZdO4iPL7sK8a7dBhWb4F/hVJgEmgmARLdVXeI
 ZevyVJVd3z0DV2LbPA8E/KcdV82XiN933lEymkUM1nkhM5NGhRvEQx0XbdRzSoumQ4VZ
 PlEnTpVnHNmxKRnjt8qjPEiE15U/n+LRMFB+0t2hszsCFxuLYRVq+WTnnhl0v/Ymt9C9
 NUNg==
X-Gm-Message-State: AIkVDXLSS7LzEPL5szi4HcEMt3fL8ESGDlRitw5zd5J6dCBgkHoudv+VipYTvgywkSNErzlzOi7qp2RC25MI1Q==
X-Received: by 10.55.220.199 with SMTP id v190mr17692378qki.42.1484310923331; 
 Fri, 13 Jan 2017 04:35:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Fri, 13 Jan 2017 04:35:22 -0800 (PST)
In-Reply-To: <7248ccf6-226b-0a7f-162a-72bd307c2bca@linux.vnet.ibm.com>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <7248ccf6-226b-0a7f-162a-72bd307c2bca@linux.vnet.ibm.com>
From: Mine <mine260309@gmail.com>
Date: Fri, 13 Jan 2017 20:35:22 +0800
Message-ID: <CAARXrt=9jNQE+RD6as1KB23Av1xBvNCrdAB0RsH-A9EOQhMASQ@mail.gmail.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 13 Jan 2017 12:35:26 -0000

Hi Deepak

On Fri, Jan 13, 2017 at 5:11 PM, Deepak Kodihalli
<dkodihal@linux.vnet.ibm.com> wrote:
> Hello Lei,
>
>
> On 13/01/17 1:12 pm, Mine wrote:
>>
>> I=E2=80=99d like to discuss the design of |phosphor-time-manager| with t=
he new
>> sdbusplus interfaces.
>>
>> Please see below background and new design, let me know if you have any
>> comments.
>> Thanks!
>>
>>
>>       Background
>>
>> Legacy time-manager expose below interfaces and methods:
>>
>>   * curr_time_mode
>>   * curr_time_owner
>>   * requested_time_mode
>>   * requested_time_owner
>>   * GetTime(target)
>>   * SetTime(target, time)
>>
>> The implementation of |Get/SetTime()| will check the current time mode
>> and owner, and do below:
>>
>>   * For |GetTime(<target>)|:
>>       o If target is =E2=80=9Cbmc=E2=80=9D, return BMC time;
>>       o If target is =E2=80=9Chost=E2=80=9D, return Host time;
>>       o Else, return error
>>   * For |SetTime(target, time)|:
>>       o If target is =E2=80=9Cbmc=E2=80=9D:
>>           + If mode is NTP, return error
>>           + If owner is =E2=80=9CHOST=E2=80=9D, return error
>>           + Set BMC time
>>       o If target is =E2=80=9Chost=E2=80=9D:
>>           + If owner is =E2=80=9CBMC=E2=80=9D, return error
>>           + Set Host time
>>           + If owner is =E2=80=9CSPLIT=E2=80=9D, save the diff between B=
MC time and Host
>>             time;
>>
>>
>>       New Design
>>
>> Now with sdbusplus, we have EpochTime interface, with |elapsed| property=
.
>>
>> After discussion with Li Yi and Vishwa, we decided to implement as below=
:
>>
>> Create two objects:
>>
>>   * |BmcEpoch|
>>   * |HostEpoch|
>
>
>
> Could these be just associations (via the association interface) to a sin=
gle
> object? I'm not sure if the user the Epoch interface knows Host vs BMC?
> Shouldn't that be picked from the settings, or do we really have explicit
> calls to fetch/set bmc and host time?
>
According to Vishwa, it is a requirement for time manager to keep both
BMC and HOST time.

And from previous design, whether the settings' time_owner is BMC or
HOST or else,
the user of time-manager will get/set the BMC or HOST time.
E.g.
1. Host's IPMI SEL_SET_TIME will set HOST time.
    In this case, with Epoch interface, hostipmid will set HostEpoch
service's "elasped" property.
2. User is able to see both BmcEpoch and HostEpoch service on DBus,
and he is free to
get/set the "elasped" property on each service.
    The implementation will handle if the set should succeed or not.

>> They both implements EpochTime interface.
>>
>> For |BmcEpoch|:
>>
>>   * When |elapsed()| is called, return BMC time;
>>   * When |elapsed(us)| is called, use above SetTime(=E2=80=9Cbmc=E2=80=
=9D) logic
>>
>> For |HostEpoch|:
>>
>>   * When |elapsed()| is called, return HOST time;
>>   * When |elapsed(us)| is called, use above SetTime(=E2=80=9Chost=E2=80=
=9D) logic.
>>
>> And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or
>> =E2=80=9Crequested_time_mode/owner=E2=80=9D properties on DBUS.
>>
>> --
>> BRs,
>> Lei YU
>
>
> Regards,
> Deepak
>
>>
>>
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
