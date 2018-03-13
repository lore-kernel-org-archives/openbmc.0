Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22b; helo=mail-it0-x22b.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l87VBD+w"; 
 dkim-atps=neutral
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400xsw0b5VzDrK6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 01:23:31 +1100 (AEDT)
Received: by mail-it0-x22b.google.com with SMTP id u5-v6so355136itc.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BeAranLb/MAZ+haftLSXh1gKb8p+blKN2n5IKsDQDPI=;
 b=l87VBD+wc6ySCm7ZZx80tBPuLPE0l41wNrA/uaukwk4dfkJt9jnHe/RZxKP7fGD2LH
 VhY6DVGAXLtVVOOJrQZ9nwRYZ9XyLB/y2VX2je1q+DjBIm0BsYvaS2wWZmQt7+e8UzCF
 +BFTvTfnJ0PKqBNt6Lj7Lu4qs75rRBj8NuZ0/wiyqbyqdLhqBcDijpw3CIqQbJhYUDq5
 QDQpJdtGlX4esYyjcAiE/ZK83iLpU4Uj3JEs2g6YF1/e5v6188IsSeJHvZgGDO3esFn2
 XS/xfQPi7YslO8LDYqcIoQThNjWyH0B2Xq8FH4r5o+R/2QrvG7H4CmkagnfSQbxaIzIA
 wTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BeAranLb/MAZ+haftLSXh1gKb8p+blKN2n5IKsDQDPI=;
 b=sY0E8QNg5iRpXyZTiW+YH1ChUddBkXO5Y34wbmJRZTm2pEH6CnoChl/Gwx0OB711Af
 IytewlInRgDl53Nfz3xzHdzH/U7GOZG7qRexXQajzl2Txoq3H9rYgjTiKK7VICm/DeC8
 aBZaDlawshjZFOZrQ6G5X3VjpwI0AXrrFnoPX8p41+XNeH9TmCtQaP3jM5X8zQYCKhOA
 eix3tgFU97QuAg/t5HmG4i/rN4RsDEw+lHRw36ZBuOYbNRFaqkZ7b4NonP1TlhwrojOs
 A2qQJ1zEMnCC0mbHIG14Atcnl/vRJK4ndE+JJPYzax2Tk0XV1B/6//CrnxSEKuikVORU
 T8Ww==
X-Gm-Message-State: AElRT7GlzINBpKtV6IFivfokE9Tw3B5d7p0U+3zkZyiy1Jt7ET7EvIwJ
 emYxofUj68k8UB1IpjFQLQVz4JmwX14UAdwCts4=
X-Google-Smtp-Source: AG47ELvcv5dwPuru59RhslsPumXlwOk8Yv4Xnoe6MPdfPmFKGh9YaUSgC35HtJGLw2boTNV+kLhzDUXGxf+Tkb+N/bI=
X-Received: by 10.36.65.208 with SMTP id b77mr1180615itd.7.1520951009432; Tue,
 13 Mar 2018 07:23:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.192.189.76 with HTTP; Tue, 13 Mar 2018 07:23:28 -0700 (PDT)
In-Reply-To: <a8cae0b0-9652-adfe-e262-c07d86198e94@linux.vnet.ibm.com>
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <a8cae0b0-9652-adfe-e262-c07d86198e94@linux.vnet.ibm.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 13 Mar 2018 09:23:28 -0500
Message-ID: <CAG5OiwiTyzJwkc4ZET9Bc0dchU_13h2ixfmYp-hZwKDWbKVNyw@mail.gmail.com>
Subject: Re: RFC for Telemetry data collection
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: jk@ozlabs.org, joel@jms.id.au, bradleyb@fuzziesquirrel.com, 
 venture@google.com, tomjose@linux.vnet.ibm.com, rosedahl@us.ibm.com, 
 vernon.mauery@linux.intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a1135308aa35b0b05674c0077"
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
X-List-Received-Date: Tue, 13 Mar 2018 14:23:33 -0000

--001a1135308aa35b0b05674c0077
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 7:43 AM, Deepak Kodihalli <
dkodihal@linux.vnet.ibm.com> wrote:

> On 07/09/17 8:50 pm, tomjose wrote:
>
>> Hello,
>>
>> I am working on the issue (https://urldefense.proofpoint
>> .com/v2/url?u=https-3A__github.com_openbmc_openbmc_
>> issues_1957&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=LzkOghL3
>> x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&m=Gk0KnGVKy2iC82jVgpSqjz
>> R2K_EYRlsFBqs34EjyKys&s=nQguk1LTD_q7dPNEn6dV2p4vsKaMu1vYZs5_Vh0BiNc&e= )
>> to design a telemetry application for the OpenBMC. I would be explaining a
>> rough idea of how we plan to go about. Please share your thoughts and
>> feedback on this proposal. This issue would depend on the design evolving
>> out of following issues, since this app would utilize the capabilities
>> provided. (https://urldefense.proofpoint.com/v2/url?u=https-3A__
>> github.com_openbmc_openbmc_issues_1856&d=DwICaQ&c=jf_
>> iaSHvJObTbx-siA1ZOg&r=LzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT3
>> 5AQXw&m=Gk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&s=2B_nLY
>> U03S0QgMnCrMr8YawangOxRXmXGBqPF9593DY&e= , https://urldefense.proofpoint.
>> com/v2/url?u=https-3A__github.com_openbmc_openbmc_issues_210
>> 2&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=LzkOghL3x_3V_
>> EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&m=Gk0KnGVKy2iC82jVgpSqjzR2K_E
>> YRlsFBqs34EjyKys&s=U6M9vpoDDmNbTJJH5I6M6lPBGFzS1nuqYEEGwXjAviY&e= ).
>>
>> Summary of the requirements that we came across relevant to this
>> discussion.
>>
>> 1) BMC telemetry data (example VRM rail voltages) where the data is
>> collected at different rates depending on the data and aggregated by the
>> BMC app  (minimum, maximum
>>      and average). Based on the collection timing request(frequency) the
>> metrics are logged, so that the user can fetch it for analytics.
>>
>> 2)  Users should be able to set thresholds for the temperature limits,
>> and receive alerts. This would allow user to plan the cooling needs.
>>
>> 3)  BMC would act as route for the OCC metrics to be send to the user.
>> The OCC would send down telemetric data to the BMC and BMC should figure
>> out a way to
>>       alert the user to consume this data.
>>
>>
>> We would keep the focus of the discussion on the requirement no 1.
>> This proposal presupposes that all the resources( example VRM rail
>> voltages, ambient temperature) that the telemetry app is interested in,
>> should be populated as dbus objects, which can
>> be queried to read the instantaneous values. phosphor-hwmon application
>> exposes many of the interested resources.
>>
>> The idea is to have a yaml based approach, where the policy of the
>> telemetry app will be expressed. The application would be able to consume
>> the yaml and initiate the telemetry
>> data collection. The yaml would express the following:
>>
>> a) Dbus Info (object, interface, property) associated with the resource.
>> b) Units associated with the value (celsius) and the associated scaling
>> factor).
>> c) Granularity - the time between two measures.
>> d) Aggregation methods - min,max,avg..etc.
>> e) Logging policy - frequency for creating an event and alerting the user.
>>
>> The application would operate based on the policy and log the telemetry
>> data. The details of logging would evolve as we progress on the related
>> issue.
>>
>> Regards,
>> Tom
>>
>
> Hi,
>
> I'd like to bump this topic and add some more details. I'd like to discuss
> design proposals/directions for a couple things :
>
> 1) A short/mid term proposal for telemetry requirements specific to IBM
> labs (which need to be implemented in a relatively short span of time, so
> there may not be the bandwidth to write an entirely new application not
> based on D-Bus or the OpenBMC REST API).
> 2) Industry standard methods for storing and retrieving telemetry data -
> thoughts on how to get here.
>
>
> 1) Telemetry requirements specific to IBM labs
> Here are the requirements and a design proposal.
>
> a) Instantaneous readings, such as temperatures, currents, errors, events
> etc. Let's call this Layer 0.
>
> Proposal:
> - The D-Bus model is the source for instantaneous readings. This means
> there would be D-Bus objects representing this data, and hence an OpenBMC
> REST API around it.
> - These D-Bus objects would not necessarily implement the same D-Bus
> interfaces.
> - Interested clients can read these D-Bus objects via the OpenBMC REST API.
> - If clients are interested in being notified about "changes" to the
> readings, that's possible via the existing event notification over
> WebSockets mechanism.
>

This would also map well into an OBMC MIB extension for example.


>
>
> b) Instantaneous aggregations - this would mostly apply to, but may not be
> limited to, readings such as temperatures and currents. Let's call this
> Layer 1. This basically is to solve, for eg, "what is the min/max/average
> over the last X seconds?". We have a requirement to do such aggregations on
> the BMC.
>

I would be interested in why aggregations (and historical - level 3) are a
requirement and not just handled by the monitoring/event management app as
done in network management. If this work is to be done in the BMC, it needs
to be user definable and able to be turned off for resource-critical
situations.


>
> Proposal:
> - Aggregations are represented as D-Bus objects, created by a telemetry
> app. For eg if we need to know the min/max/avg ambient temp for the last 5
> minutes, and say the the ambient temp is usually at temps/ambient, the
> aggregation could be at temps/aggregations/ambient.
> - Implement D-Bus interfaces to denote aggregations, for eg the
> temps/aggregation/ambient object could implement a D-Bus interface
> describing min/max/avg properties.
> - Aggregation objects will have the values as described in the D-Bus
> interface (such as min/max/avg), and a timestamp, as properties.
> - Enable a config (eg JSON) to let the telemetry app know things like :
> What (supported) aggregations should be performed (min/max/avg)? What D-Bus
> objects should be aggregated? How frequently should they be aggregated?
> What should be the paths of the aggregations? Potentially add a REST API to
> allow changing the (JSON) config at run-time.
> - It will be possible to read all aggregation objects, or aggregation
> objects of a specific type via one REST call.
>
>
> c) Historical aggregations or snapshot. Let's call this Layer 2. This is
> to solve, for eg, "Need a reading corresponding to every X minutes in a
> period of Y hours". This can be a snapshot of Layer 1 or Layer 0 D-Bus
> objects. We have a requirement to store this snapshot on the BMC.
>
> Proposal:
> - The snapshot will be represented as a set of D-Bus objects. For eg if
> one needs an hourly reading for a period of 24 hours, the objects could be
> at temps/aggregations/ambient/per-hour/{1..24}.
> - Enable a config to let a telemetry app to know things like : What D-Bus
> objects should I keep a history of? What is the duration of the snapshot?
> At what frequency should entries be added into the snapshot? Once the
> snapshot is full, should the entries roll, or should we restart?
> Potentially add a REST API to allow changing the (JSON) config at run-time.
> - The historical aggregations can be read via one REST call. It should be
> one D-Bus call as well most likely for the REST server, if there's an
> object manager at temps/aggregations/ambient/per-hour for eg.
> - These objects in the snapshot will implement the same interfaces as
> Layer 1 objects, so they will have the same properties (eg min/max/avg,
> timestamp).
>
>
> d) Some notes
> - With the proposal above, the API to retrieve the telemetry data is via
> the current OpenBMC REST API, so it may not readily work with telemetry
> tools relying on industry-standard API (see point 2 below), but it seems to
> be the feasible option to rely on to implement IBM's requirements in the
> expected timelines.
> - Layer 1 and Layer 2 telemetry apps would be different processes, and can
> function independent of each other.
>
>
>
> 2) Industry standard methods for storing and retrieving telemetry data
>
> - With the proposal above, the instantaneous readings are D-Bus objects,
> the instantaneous and historical aggregations are D-Bus objects as well.
> The API is the OpenBMC REST API.
> - Typically, aggregations may not have to happen on the BMC, in which case
> one can turn off layers 1 and 2.
> - This is regarding how the telemetry data is presented, and how we'd
> eventually not use the current OpenBMC REST API in production. I've heard
> (mostly from people on the To: list) of the following industry-standard
> ways to represent/retrieve telemetry data. This would mean transforming
> layer 0 D-Bus objects into these :
>         - Via Redfish (events) API
>         - Via IPMI events/PEF
>

Meh. I'd stick with Redfish/OBMC REST API over this one.


>         - Via SNMP traps
>

If there is interest here, I have experience designing MIB extensions and
sub-agents to support them.


>         - Via an sqlite db, and have something like Logstash parse it
>

Seems very heavy for BMC.


>         - Others?
> Discussions are already happening regarding Redfish, so telemetry could be
> one aspect to consider as well.
> - Aggregations could be done on the BMC with collectd. I need to look at
> this in detail. Aggregations could be stored in an RRD format. Need to look
> at this in detail as well. These are as opposed to a D-Bus model of
> aggregations. Thoughts on this? For eg, would this be much less work both
> for the BMC and the telemetry data users than the proposed D-Bus model, but
> at the same time can address the requirements I've mentioned? Do we know
> what are the commonly used client tools for processing telemetry data, and
> how they expect the data to be presented?
>
>
>
> Thanks,
> Deepak
>
>
Kurt Taylor (krtaylor)

--001a1135308aa35b0b05674c0077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Fri, Mar 9, 2018 at 7:43 AM, Deepak Kodihalli <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dkodihal@linux.vnet.ibm.com" target=3D"_blank">dkodihal@linux=
.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 07=
/09/17 8:50 pm, tomjose wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
I am working on the issue (<a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__github.com_openbmc_openbmc_issues_1957&amp;d=3DDwICaQ&amp=
;c=3Djf_iaSHvJObTbx-siA1ZOg&amp;r=3DLzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35=
AQXw&amp;m=3DGk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&amp;s=3DnQguk1LTD_=
q7dPNEn6dV2p4vsKaMu1vYZs5_Vh0BiNc&amp;e=3D" rel=3D"noreferrer" target=3D"_b=
lank">https://urldefense.proofpoint<wbr>.com/v2/url?u=3Dhttps-3A__<wbr>gith=
ub.com_openbmc_openbmc_<wbr>issues_1957&amp;d=3DDwICaQ&amp;c=3Djf_<wbr>iaSH=
vJObTbx-siA1ZOg&amp;r=3DLzkOghL3<wbr>x_3V_EkHiUQJUJ0xrq_s3_wwfssFT3<wbr>5AQ=
Xw&amp;m=3DGk0KnGVKy2iC82jVgpSqjz<wbr>R2K_EYRlsFBqs34EjyKys&amp;s=3D<wbr>nQ=
guk1LTD_q7dPNEn6dV2p4vsKaMu1<wbr>vYZs5_Vh0BiNc&amp;e=3D</a> ) to design a t=
elemetry application for the OpenBMC. I would be explaining a rough idea of=
 how we plan to go about. Please share your thoughts and feedback on this p=
roposal. This issue would depend on the design evolving out of following is=
sues, since this app would utilize the capabilities provided. (<a href=3D"h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_openbmc_op=
enbmc_issues_1856&amp;d=3DDwICaQ&amp;c=3Djf_iaSHvJObTbx-siA1ZOg&amp;r=3DLzk=
OghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&amp;m=3DGk0KnGVKy2iC82jVgpSqjzR2K_=
EYRlsFBqs34EjyKys&amp;s=3D2B_nLYU03S0QgMnCrMr8YawangOxRXmXGBqPF9593DY&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint<wbr=
>.com/v2/url?u=3Dhttps-3A__<wbr>github.com_openbmc_openbmc_<wbr>issues_1856=
&amp;d=3DDwICaQ&amp;c=3Djf_<wbr>iaSHvJObTbx-siA1ZOg&amp;r=3DLzkOghL3<wbr>x_=
3V_EkHiUQJUJ0xrq_s3_wwfssFT3<wbr>5AQXw&amp;m=3DGk0KnGVKy2iC82jVgpSqjz<wbr>R=
2K_EYRlsFBqs34EjyKys&amp;s=3D2B_nLY<wbr>U03S0QgMnCrMr8YawangOxRXmXGBqP<wbr>=
F9593DY&amp;e=3D</a> , <a href=3D"https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_openbmc_openbmc_issues_2102&amp;d=3DDwICaQ&amp;c=
=3Djf_iaSHvJObTbx-siA1ZOg&amp;r=3DLzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQ=
Xw&amp;m=3DGk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&amp;s=3DU6M9vpoDDmNb=
TJJH5I6M6lPBGFzS1nuqYEEGwXjAviY&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.<wbr>com/v2/url?u=3Dhttps-3A__github.<wbr=
>com_openbmc_openbmc_issues_210<wbr>2&amp;d=3DDwICaQ&amp;c=3Djf_iaSHvJObTbx=
-<wbr>siA1ZOg&amp;r=3DLzkOghL3x_3V_<wbr>EkHiUQJUJ0xrq_s3_wwfssFT35AQXw<wbr>=
&amp;m=3DGk0KnGVKy2iC82jVgpSqjzR2K_E<wbr>YRlsFBqs34EjyKys&amp;s=3DU6M9vpoDD=
mN<wbr>bTJJH5I6M6lPBGFzS1nuqYEEGwXjAv<wbr>iY&amp;e=3D</a> ).<br>
<br>
Summary of the requirements that we came across relevant to this discussion=
.<br>
<br>
1) BMC telemetry data (example VRM rail voltages) where the data is collect=
ed at different rates depending on the data and aggregated by the BMC app=
=C2=A0 (minimum, maximum<br>
=C2=A0=C2=A0=C2=A0=C2=A0 and average). Based on the collection timing reque=
st(frequency) the metrics are logged, so that the user can fetch it for ana=
lytics.<br>
<br>
2)=C2=A0 Users should be able to set thresholds for the temperature limits,=
 and receive alerts. This would allow user to plan the cooling needs.<br>
<br>
3)=C2=A0 BMC would act as route for the OCC metrics to be send to the user.=
 The OCC would send down telemetric data to the BMC and BMC should figure o=
ut a way to<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alert the user to consume this data.<br>
<br>
<br>
We would keep the focus of the discussion on the requirement no 1.<br>
This proposal presupposes that all the resources( example VRM rail voltages=
, ambient temperature) that the telemetry app is interested in, should be p=
opulated as dbus objects, which can<br>
be queried to read the instantaneous values. phosphor-hwmon application exp=
oses many of the interested resources.<br>
<br>
The idea is to have a yaml based approach, where the policy of the telemetr=
y app will be expressed. The application would be able to consume the yaml =
and initiate the telemetry<br>
data collection. The yaml would express the following:<br>
<br>
a) Dbus Info (object, interface, property) associated with the resource.<br=
>
b) Units associated with the value (celsius) and the associated scaling fac=
tor).<br>
c) Granularity - the time between two measures.<br>
d) Aggregation methods - min,max,avg..etc.<br>
e) Logging policy - frequency for creating an event and alerting the user.<=
br>
<br>
The application would operate based on the policy and log the telemetry dat=
a. The details of logging would evolve as we progress on the related issue.=
<br>
<br>
Regards,<br>
Tom<br>
</blockquote>
<br>
Hi,<br>
<br>
I&#39;d like to bump this topic and add some more details. I&#39;d like to =
discuss design proposals/directions for a couple things :<br>
<br>
1) A short/mid term proposal for telemetry requirements specific to IBM lab=
s (which need to be implemented in a relatively short span of time, so ther=
e may not be the bandwidth to write an entirely new application not based o=
n D-Bus or the OpenBMC REST API).<br>
2) Industry standard methods for storing and retrieving telemetry data - th=
oughts on how to get here.<br>
<br>
<br>
1) Telemetry requirements specific to IBM labs<br>
Here are the requirements and a design proposal.<br>
<br>
a) Instantaneous readings, such as temperatures, currents, errors, events e=
tc. Let&#39;s call this Layer 0.<br>
<br>
Proposal:<br>
- The D-Bus model is the source for instantaneous readings. This means ther=
e would be D-Bus objects representing this data, and hence an OpenBMC REST =
API around it.<br>
- These D-Bus objects would not necessarily implement the same D-Bus interf=
aces.<br>
- Interested clients can read these D-Bus objects via the OpenBMC REST API.=
<br>
- If clients are interested in being notified about &quot;changes&quot; to =
the readings, that&#39;s possible via the existing event notification over =
WebSockets mechanism.<br></blockquote><div><br></div><div>This would also m=
ap well into an OBMC MIB extension for example.<br>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
<br>
b) Instantaneous aggregations - this would mostly apply to, but may not be =
limited to, readings such as temperatures and currents. Let&#39;s call this=
 Layer 1. This basically is to solve, for eg, &quot;what is the min/max/ave=
rage over the last X seconds?&quot;. We have a requirement to do such aggre=
gations on the BMC.<br></blockquote><div><br></div><div>I would be interest=
ed in why aggregations (and historical - level 3) are a requirement and not=
 just handled by the monitoring/event management app as done in network man=
agement. If this work is to be done in the BMC, it needs to be user definab=
le and able to be turned off for resource-critical situations.<br>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
Proposal:<br>
- Aggregations are represented as D-Bus objects, created by a telemetry app=
. For eg if we need to know the min/max/avg ambient temp for the last 5 min=
utes, and say the the ambient temp is usually at temps/ambient, the aggrega=
tion could be at temps/aggregations/ambient.<br>
- Implement D-Bus interfaces to denote aggregations, for eg the temps/aggre=
gation/ambient object could implement a D-Bus interface describing min/max/=
avg properties.<br>
- Aggregation objects will have the values as described in the D-Bus interf=
ace (such as min/max/avg), and a timestamp, as properties.<br>
- Enable a config (eg JSON) to let the telemetry app know things like : Wha=
t (supported) aggregations should be performed (min/max/avg)? What D-Bus ob=
jects should be aggregated? How frequently should they be aggregated? What =
should be the paths of the aggregations? Potentially add a REST API to allo=
w changing the (JSON) config at run-time.<br>
- It will be possible to read all aggregation objects, or aggregation objec=
ts of a specific type via one REST call.<br>
<br>
<br>
c) Historical aggregations or snapshot. Let&#39;s call this Layer 2. This i=
s to solve, for eg, &quot;Need a reading corresponding to every X minutes i=
n a period of Y hours&quot;. This can be a snapshot of Layer 1 or Layer 0 D=
-Bus objects. We have a requirement to store this snapshot on the BMC.<br>
<br>
Proposal:<br>
- The snapshot will be represented as a set of D-Bus objects. For eg if one=
 needs an hourly reading for a period of 24 hours, the objects could be at =
temps/aggregations/ambient/per<wbr>-hour/{1..24}.<br>
- Enable a config to let a telemetry app to know things like : What D-Bus o=
bjects should I keep a history of? What is the duration of the snapshot? At=
 what frequency should entries be added into the snapshot? Once the snapsho=
t is full, should the entries roll, or should we restart? Potentially add a=
 REST API to allow changing the (JSON) config at run-time.<br>
- The historical aggregations can be read via one REST call. It should be o=
ne D-Bus call as well most likely for the REST server, if there&#39;s an ob=
ject manager at temps/aggregations/ambient/per<wbr>-hour for eg.<br>
- These objects in the snapshot will implement the same interfaces as Layer=
 1 objects, so they will have the same properties (eg min/max/avg, timestam=
p).<br>
<br>
<br>
d) Some notes<br>
- With the proposal above, the API to retrieve the telemetry data is via th=
e current OpenBMC REST API, so it may not readily work with telemetry tools=
 relying on industry-standard API (see point 2 below), but it seems to be t=
he feasible option to rely on to implement IBM&#39;s requirements in the ex=
pected timelines.<br>
- Layer 1 and Layer 2 telemetry apps would be different processes, and can =
function independent of each other.<br>
<br>
<br>
<br>
2) Industry standard methods for storing and retrieving telemetry data<br>
<br>
- With the proposal above, the instantaneous readings are D-Bus objects, th=
e instantaneous and historical aggregations are D-Bus objects as well. The =
API is the OpenBMC REST API.<br>
- Typically, aggregations may not have to happen on the BMC, in which case =
one can turn off layers 1 and 2.<br>
- This is regarding how the telemetry data is presented, and how we&#39;d e=
ventually not use the current OpenBMC REST API in production. I&#39;ve hear=
d (mostly from people on the To: list) of the following industry-standard w=
ays to represent/retrieve telemetry data. This would mean transforming laye=
r 0 D-Bus objects into these :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Via Redfish (events) API<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Via IPMI events/PEF<br></blockquote><div><br>=
</div><div>Meh. I&#39;d stick with Redfish/OBMC REST API over this one.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Via SNMP traps=C2=A0<br></blockquote><div><br=
></div><div>If there is interest here, I have experience designing MIB exte=
nsions and sub-agents to support them.<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Via an sqlite db, and have something like Log=
stash parse it<br></blockquote><div><br></div><div>Seems very heavy for BMC=
.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Others?<br>
Discussions are already happening regarding Redfish, so telemetry could be =
one aspect to consider as well.<br>
- Aggregations could be done on the BMC with collectd. I need to look at th=
is in detail. Aggregations could be stored in an RRD format. Need to look a=
t this in detail as well. These are as opposed to a D-Bus model of aggregat=
ions. Thoughts on this? For eg, would this be much less work both for the B=
MC and the telemetry data users than the proposed D-Bus model, but at the s=
ame time can address the requirements I&#39;ve mentioned? Do we know what a=
re the commonly used client tools for processing telemetry data, and how th=
ey expect the data to be presented?<br>
<br>
<br>
<br>
Thanks,<br>
Deepak<br>
<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Kurt Taylor (krtayl=
or)<br><br></div></div>

--001a1135308aa35b0b05674c0077--
