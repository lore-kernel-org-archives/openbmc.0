Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L1GPTaOF"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TKTn332mzDqBN
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 05:31:39 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id v32so15787709qtc.10
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N63bY9zeUEW8m4Lpz90WN12UzepjSSZZWs2HwaA8seE=;
 b=L1GPTaOF2fBn2O9cMye7yc3/PHv0s71Djzqazqd3OStQbTxGr0rfVcTg/6777fSEnM
 REmU4rNpTvPPVgbdrnG+aBD+FKh5HmqAXzkhG4xn/ajq2lvboIwLEvKMd43p/sAKGvSE
 YQ6tpuRZPsFrt4MJplEEiGIxH7Xr2PPm5l/83jXQtn0D55XQ16uz1SmhMpirUJspux4A
 8MIM3PmS9DnNPTRrlyQiXG/M2qCC9+U9qzRUb+rZJ9ixEtkx1H9qQiYA592zM9jBmnt9
 nxHAQyYSDqXWBRFjLCyE9OcZtTdQDeZf4pZ8fPwWchOQCr4MWiC9aKdmKpfy3644zspI
 AKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N63bY9zeUEW8m4Lpz90WN12UzepjSSZZWs2HwaA8seE=;
 b=nSBcgs98rir7KUxy/TNMJOjuLm5eGZfOaVYYYtvNxuZgGrNekDCHUr70u3+I2zVKqC
 GI6RMQGzK9mrtXIbySdsM9SNRApKU8/BAAnC3l+3afhIXQTIjZ7AoggozEj1f5xOJGkd
 8qB+zYvBc9is6UT3tYw6arL290+gq0fTRyFaf83FPqm8jIwOONc+SBz/S7/sg/+hN2e9
 y7OYw0pWzgGH04kABTpmOXSUClVuDlQbtTnuYa27RQYX8J9Lno0jn5vcyjjH/+dw/Om/
 Wiys6Dpjc61KtOKAIkNjyRRSzdqhmJ+/DqMurgZDl9bKF7/Zzx1mnvdBTV3+2r5IrcW4
 zxoA==
X-Gm-Message-State: APjAAAUIrhYRkp7CdNHw35l8K9LvwST/QZErgqB+NUAJ8daZtWLkV9O1
 Q5pmeCV+tWLun3zEQN4jHWtjYOkLBxJO9zxeghXg9A==
X-Google-Smtp-Source: APXvYqwEmKA2ui0OlPcOeBck/FMBJ9+D0eBprpNnPtOF7ZprTb4Fi+ReIAXXpUJPWgiJc/BpxaxXO6Be3bWc9wGWr+Q=
X-Received: by 2002:ac8:f3c:: with SMTP id e57mr26888658qtk.75.1553625095893; 
 Tue, 26 Mar 2019 11:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <31685a6a49d14c1ea599921946d9eb49@quantatw.com>
 <2509b486-bca6-1a2c-50a2-4d4a9992db18@linux.intel.com>
 <1493589c638b4fa2868b1f0a8612e3ad@quantatw.com>
In-Reply-To: <1493589c638b4fa2868b1f0a8612e3ad@quantatw.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 26 Mar 2019 11:31:24 -0700
Message-ID: <CAJoAoZm7-rSH0gUsF_-TkGoZ=_JM=sOKCVtuhrN+D0Z9UA75zQ@mail.gmail.com>
Subject: Re: [OpenBMC] [phosphor-sel-logger] Property type conversion and the
 value of getScaledIPMIValue
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "benjaminfair@google.com" <benjaminfair@google.com>, 
 =?UTF-8?B?UmljaGFyZCBUdW5nICjokaPlvaXlsY8p?= <Richard.Tung@quantatw.com>, 
 =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>, 
 =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>, 
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 18:31:42 -0000

Please push your code to Gerrit. You don't need to ask permission and
we can perform the code review there. :)

On Mon, Mar 25, 2019 at 11:43 PM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi all,
>
> Sorry for the previous mail, I should not use the attached file for the m=
ailing list. I re-describe what we would like to do:
>
> Currently phosphor-sel-logger support handles only double style sensors, =
and we would like to add both of double and in64 support for phosphor-sel-l=
ogger.
>
> But I'm not sure my change is OK and post my modification as follows firs=
t:  (making sel-logger work with int64 and double.)
>
> diff --git a/include/threshold_event_monitor.hpp b/include/threshold_even=
t_monitor.hpp
> index 9352805..00dba32 100644
> --- a/include/threshold_event_monitor.hpp
> +++ b/include/threshold_event_monitor.hpp
> @@ -115,7 +115,7 @@ inline static sdbusplus::bus::match::match startThres=
holdEventMonitor(
>                                    "org.freedesktop.DBus.Properties", "Ge=
tAll");
>          getSensorValue.append("xyz.openbmc_project.Sensor.Value");
>          boost::container::flat_map<std::string,
> -                                   sdbusplus::message::variant<double>>
> +                                   sdbusplus::message::variant<double, i=
nt64_t>>
>              sensorValue;
>          try
>          {
> @@ -135,6 +135,14 @@ inline static sdbusplus::bus::match::match startThre=
sholdEventMonitor(
>              ipmi::VariantToDoubleVisitor(), sensorValue["MinValue"]);
>          double sensorVal =3D sdbusplus::message::variant_ns::visit(
>              ipmi::VariantToDoubleVisitor(), sensorValue["Value"]);
> +        double scale =3D 0;
> +        if(sdbusplus::message::variant_ns::get_if<int64_t>(
> +           &sensorValue["Value"]))
> +        {
> +            scale =3D sdbusplus::message::variant_ns::visit(
> +                ipmi::VariantToDoubleVisitor(), sensorValue["Scale"]);
> +            sensorVal *=3D std::pow(10, scale);
> +        }
>          try
>          {
>              eventData[1] =3D ipmi::getScaledIPMIValue(sensorVal, max, mi=
n);
> @@ -158,7 +166,7 @@ inline static sdbusplus::bus::match::match startThres=
holdEventMonitor(
>              conn->new_method_call(msg.get_sender(), msg.get_path(),
>                                    "org.freedesktop.DBus.Properties", "Ge=
t");
>          getThreshold.append(thresholdInterface, event);
> -        sdbusplus::message::variant<double> thresholdValue;
> +        sdbusplus::message::variant<double, int64_t> thresholdValue;
>          try
>          {
>              sdbusplus::message::message getThresholdResp =3D
> @@ -173,6 +181,10 @@ inline static sdbusplus::bus::match::match startThre=
sholdEventMonitor(
>          }
>          double thresholdVal =3D sdbusplus::message::variant_ns::visit(
>              ipmi::VariantToDoubleVisitor(), thresholdValue);
> +        if(sdbusplus::message::variant_ns::get_if<int64_t>(&thresholdVal=
ue))
> +        {
> +            thresholdVal *=3D std::pow(10, scale);
> +        }
>          try
>          {
>              eventData[2] =3D ipmi::getScaledIPMIValue(thresholdVal, max,=
 min);
> --
>
> If it's OK, I will push the patch to OpenBMC Gerrit.
>
> Thanks.
>
> Best Regard
> George Hung
> Research Division - Software Engineer
> Cloud Computing Business Unit
> Quanta Computer Inc.
> Ext: 16830
> E-Mail : George.Hung@QuantaTW.com
>
>
> -----Original Message-----
> From: George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
> Sent: Tuesday, March 26, 2019 2:26 PM
> To: 'Bills, Jason M'; OpenBMC Maillist; emilyshaffer@google.com; benjamin=
fair@google.com
> Cc: Richard Tung (=E8=91=A3=E5=BD=A5=E5=B1=8F); Buddy Huang (=E9=BB=83=E5=
=A4=A9=E9=B4=BB); Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89); Fran Hsu (=E5=
=BE=90=E8=AA=8C=E8=AC=99)
> Subject: RE: [OpenBMC] [phosphor-sel-logger] Property type conversion and=
 the value of getScaledIPMIValue
>
> Hi all,
>
> Considering there are two style of sensors (scaled int64 and double value=
s) for sensor value DBus properties, we would like to add both of them supp=
ort for phosphor-sel-logger.
>
> The attached file is the patch for making sel-logger work with int64 and =
double.
>
> If it's OK, I will push the patch to OpenBMC Gerrit.
>
> Hi Jason,
>
> Thanks for your kind advices.
>
> About the first question I mentioned before, "The sensor DBus properties =
, =E2=80=9C/MaxValue/MinValue/Value/=E2=80=9D are always 0", it's because t=
ype conversion cause always get 0, not their values are invalid. I'm sorry =
for my confused description.
>
>
> Thanks.
>
> Best Regard
> George Hung
> Research Division - Software Engineer
> Cloud Computing Business Unit
> Quanta Computer Inc.
> Ext: 16830
> E-Mail : George.Hung@QuantaTW.com
>
> -----Original Message-----
> From: Bills, Jason M [mailto:jason.m.bills@linux.intel.com]
> Sent: Saturday, March 23, 2019 6:50 AM
> To: George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
> Cc: Richard Tung (=E8=91=A3=E5=BD=A5=E5=B1=8F); Buddy Huang (=E9=BB=83=E5=
=A4=A9=E9=B4=BB); Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89); Fran Hsu (=E5=
=BE=90=E8=AA=8C=E8=AC=99)
> Subject: Re: [OpenBMC] [phosphor-sel-logger] Property type conversion and=
 the value of getScaledIPMIValue
>
> Hi George,
>
> It is better to post these types of questions to the full mailing list as=
 I am not the right person to answer all of them.
>
> On 3/22/2019 12:20 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) wrote:
> > Hi Jason,
> >
> > Since our OpenBMC project needs to support IPMI SEL, I try to use
> > phosphor-sel-logger to add new IPMI SEL to journal, but I found some
> > issues need to discuss:
> >
> > 1.The sensor DBus properties , =E2=80=9C/MaxValue/MinValue/Value/=E2=80=
=9D are always
> > 0
>
> This means that something is wrong in the sensor configuration.  These va=
lues should all be valid.
> >
> > 2.The /value/ parameter of /getScaledIPMIValue/ function uses the
> > scaled value, not actual value,
>
> The threshold event monitor is currently designed to monitor only the dou=
ble-style sensors that store the actual value.
> >
> > it may cause the result of /scaleIPMIValueFromDouble /function is
> > =E2=80=9Cvalue out of range=E2=80=9D
> >
> > After tracing the code, we may find the root cause, but need your help
> > to check if it=E2=80=99s the correct fix. I listed as follows:
> >
> > 1.The original type declaration is
> > =E2=80=9Csdbusplus::message::variant<double>=E2=80=9D, but should be
> > =E2=80=9Csdbusplus::message::variant<int64_t>=E2=80=9D
>
> There are two styles of sensors, one style stores scaled int64 values and=
 another style stores actual double values.  The threshold event monitor cu=
rrently handles only double style sensors.
>
> If you need to support both styles of sensors, you can look here for an e=
xample visitor that can handle both int64 and double:
> https://github.com/openbmc/phosphor-pid-control/commit/c065cf1b195f9ccd8f=
ea882ce76416473d4fee7c.
> >
> > 2.Modify to use actual sensor value for =E2=80=9CgetScaledIPMIValue=E2=
=80=9D function
> >
> > The attached file is the fix patch, it should be more clear.
> >
> > If it=E2=80=99s the correct fix, will you patch to OpenBMC Gerrit, or w=
e do it
> > directly ?
>
> Please feel free to push your patch to OpenBMC Gerrit for review and disc=
ussion.
> >
> > BTW, the phosphor-sel-logger supports add IPMI SEL to journal, but
> > seems only threshold-based sensor event logs, no discrete sensors event=
 logs.
>
> That is correct.
> >
> > Is there any plan to add discrete sensors event logs to
> > phosphor-sel-logger ?
>
> Intel plans to only support threshold sensor events in the IPMI SEL.
> The phosphor-sel-logger should be extensible to support additional types =
of events.



--=20
Emily Shaffer
