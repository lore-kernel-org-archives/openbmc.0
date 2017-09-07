Return-Path: <rosedahl@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=rosedahl@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpBHs4LMhzDrZF
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 06:04:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v87JxuKi018901
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 16:04:39 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cu77ctj9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 16:04:38 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rosedahl@us.ibm.com>;
 Thu, 7 Sep 2017 20:04:37 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Sep 2017 20:04:35 -0000
Received: from us1a3-mail63.a3.dal09.isc4sb.com ([10.142.3.43])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017090720043459-928379 ;
 Thu, 7 Sep 2017 20:04:34 +0000 
In-Reply-To: <CAPLgG=nO4ceoy+7ChaTU7JfUO_-uboUCAe39DvzQUEdMaNE9kw@mail.gmail.com>
To: Rick Altherr <raltherr@google.com>
Cc: jkeusema@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 thalerj@us.ibm.com, tomjose <tomjose@linux.vnet.ibm.com>
Subject: Re: RFC for Telemetry data collection
From: "Todd Rosedahl" <rosedahl@us.ibm.com>
Date: Thu, 7 Sep 2017 15:04:37 -0500
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <CAPLgG=nO4ceoy+7ChaTU7JfUO_-uboUCAe39DvzQUEdMaNE9kw@mail.gmail.com>
MIME-Version: 1.0
X-KeepSent: AF8CC9F3:AF6F55BD-00258194:0066F1B9;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 22287
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006D7A2486258194_="
x-cbid: 17090720-9951-0000-0000-000004512EFC
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.394815;
 ST=0; TS=0; UL=0; ISC=; MB=0.351807
X-IBM-SpamModules-Versions: BY=3.00007684; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913699; UDB=6.00458608; IPR=6.00693957; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017056; XFM=3.00000015;
 UTC=2017-09-07 20:04:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-07 19:37:16 - 6.00007295
x-cbparentid: 17090720-9952-0000-0000-0000EC5B4299
Message-Id: <OFAF8CC9F3.AF6F55BD-ON00258194.0066F1B9-86258194.006E49B2@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-07_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 08 Sep 2017 07:18:51 +1000
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
X-List-Received-Date: Thu, 07 Sep 2017 20:04:42 -0000


--=_alternative 006D7A2486258194_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

We do need to provide live reads of a subset of the data, which I think is =

what Rick is describing below.  For instance fan speeds, 30 second power=20
averages, component temperatures, etc.  Much like IPMI/DCMI=20
implementations out there today.  And these need to alert based on trip=20
levels that are set.   Higher layers of software can then act on this data =

or log it away as they see fit.  I like the idea of rich meta-data around=20
these values, but I would think we would use Redfish as the method of=20
exporting this data.

We also need deep traces where the data is gathered, processed, and logged =

locally by the BMC.  Then the BMC should alert every X hours and the log=20
should be collected by the higher layer entity.  This would be for things=20
like VRM currents on every output (hourly min, max, average).  It is not=20
required that any other company use these deep telemetry logs, but they=20
are required on our systems.

As far as #3 below, this should not be a new requirement.  Just export the =

OCC telemetry log in the same way that you export all OCC/HOST logs.

Todd Rosedahl
IBM Power and Thermal Management
(507) 250-3275
rosedahl@us.ibm.com



From:   Rick Altherr <raltherr@google.com>
To:     tomjose <tomjose@linux.vnet.ibm.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>, thalerj@us.ibm.com,=20
jkeusema@us.ibm.com, rosedahl@us.ibm.com
Date:   09/07/2017 01:41 PM
Subject:        Re: RFC for Telemetry data collection



I have many opinions on telemetry data formats and APIs.  What I'm seeing=20
in your proposal looks pretty good with some subtlety in the details.  For =

example, I expect to collect most data at least once-per-second, not log=20
anything locally, and not alert.  I'll do all aggregation and thresholding =

at a higher level in the software stack.  I also, ideally, want very=20
descriptive information about where in the system the sensor is.  I've=20
attached a screenshot of what our existing host-based reporting software=20
makes available to higher-level software.  This is a view via the=20
human-readable web interface, the data is normally served via protobufs.

Rick

On Thu, Sep 7, 2017 at 8:20 AM, tomjose <tomjose@linux.vnet.ibm.com>=20
wrote:
Hello,

I am working on the issue (https://github.com/openbmc/openbmc/issues/1957) =

to design a telemetry application for the OpenBMC. I would be explaining a =

rough idea of how we plan to go about. Please share your thoughts and=20
feedback on this proposal. This issue would depend on the design evolving=20
out of following issues, since this app would utilize the capabilities=20
provided. (https://github.com/openbmc/openbmc/issues/1856,=20
https://github.com/openbmc/openbmc/issues/2102).

Summary of the requirements that we came across relevant to this=20
discussion.


1) BMC telemetry data (example VRM rail voltages) where the data is=20
collected at different rates depending on the data and aggregated by the=20
BMC app  (minimum, maximum
    and average). Based on the collection timing request(frequency) the=20
metrics are logged, so that the user can fetch it for analytics.

2)  Users should be able to set thresholds for the temperature limits, and =

receive alerts. This would allow user to plan the cooling needs.

3)  BMC would act as route for the OCC metrics to be send to the user. The =

OCC would send down telemetric data to the BMC and BMC should figure out a =

way to
     alert the user to consume this data.


We would keep the focus of the discussion on the requirement no 1.
This proposal presupposes that all the resources( example VRM rail=20
voltages, ambient temperature) that the telemetry app is interested in,=20
should be populated as dbus objects, which can
be queried to read the instantaneous values. phosphor-hwmon application=20
exposes many of the interested resources.

The idea is to have a yaml based approach, where the policy of the=20
telemetry app will be expressed. The application would be able to consume=20
the yaml and initiate the telemetry
data collection. The yaml would express the following:

a) Dbus Info (object, interface, property) associated with the resource.
b) Units associated with the value (celsius) and the associated scaling=20
factor).
c) Granularity - the time between two measures.
d) Aggregation methods - min,max,avg..etc.
e) Logging policy - frequency for creating an event and alerting the user.

The application would operate based on the policy and log the telemetry=20
data. The details of logging would evolve as we progress on the related=20
issue.

Regards,
Tom




[attachment "zaius-fan-telemetry.png" deleted by Todd=20
Rosedahl/Rochester/IBM]=20




--=_alternative 006D7A2486258194_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">We do need to provide live reads of a su=
bset
of the data, which I think is what Rick is describing below. &nbsp;For
instance fan speeds, 30 second power averages, component temperatures,
etc. &nbsp;Much like IPMI/DCMI implementations out there today. &nbsp;And
these need to alert based on trip levels that are set. &nbsp; Higher layers
of software can then act on this data or log it away as they see fit. &nbsp=
;I
like the idea of rich meta-data around these values, but I would think
we would use Redfish as the method of exporting this data.</font><br><br><f=
ont size=3D2 face=3D"sans-serif">We also need deep traces where the data
is gathered, processed, and logged locally by the BMC. &nbsp;Then the BMC
should alert every X hours and the log should be collected by the higher
layer entity. &nbsp;This would be for things like VRM currents on every
output (hourly min, max, average). &nbsp;It is not required that any other
company use these deep telemetry logs, but they are required on our systems=
.</font><br><font size=3D2 face=3D"sans-serif"><br>As far as #3 below, this=
 should not be a new requirement. &nbsp;Just export
the OCC telemetry log in the same way that you export all OCC/HOST logs.<br=
><br>Todd Rosedahl<br>IBM Power and Thermal Management<br>(507) 250-3275<br=
>rosedahl@us.ibm.com</font><br><br><br><br><font size=3D1 color=3D#5f5f5f f=
ace=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Rick Altherr &lt;raltherr@g=
oogle.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">=
To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">tomjose &lt;tomjose@linux.v=
net.ibm.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif=
">Cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Maillist &lt;openbm=
c@lists.ozlabs.org&gt;,
thalerj@us.ibm.com, jkeusema@us.ibm.com, rosedahl@us.ibm.com</font><br><fon=
t size=3D1 color=3D#5f5f5f face=3D"sans-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">09/07/2017 01:41 PM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: RFC for
Telemetry data collection</font><br><hr noshade><br><br><br><font size=3D3>=
I have many opinions on telemetry data formats and APIs.&nbsp;
What I'm seeing in your proposal looks pretty good with some subtlety in
the details.&nbsp; For example, I expect to collect most data at least
once-per-second, not log anything locally, and not alert.&nbsp; I'll do
all aggregation and thresholding at a higher level in the software stack.&n=
bsp;
I also, ideally, want very descriptive information about where in the system
the sensor is.&nbsp; I've attached a screenshot of what our existing host-b=
ased
reporting software makes available to higher-level software.&nbsp; This
is a view via the human-readable web interface, the data is normally served
via protobufs.</font><br><br><font size=3D3>Rick</font><br><br><font size=
=3D3>On Thu, Sep 7, 2017 at 8:20 AM, tomjose &lt;</font><a href=3Dmailto:to=
mjose@linux.vnet.ibm.com target=3D=5Fblank><font size=3D3 color=3Dblue><u>t=
omjose@linux.vnet.ibm.com</u></font></a><font size=3D3>&gt;
wrote:</font><br><font size=3D3>Hello,<br><br>I am working on the issue (</=
font><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5F=
github.com=5Fopenbmc=5Fopenbmc=5Fissues=5F1957&amp;d=3DDwMFaQ&amp;c=3Djf=5F=
iaSHvJObTbx-siA1ZOg&amp;r=3Dg3oFrUCNLMKFaP17rERsIZKSKE6yYvKL3jAcaxmIa64&amp=
;m=3DUujlkiUKZq6cfZKZKDw9TP5RTSTH7aH4Geiv3kJpY8I&amp;s=3DB7x6-SS4rBONuXqxyO=
GlOHXDKtm6XUFf3Yt3XH44xxo&amp;e=3D" target=3D=5Fblank><font size=3D3 color=
=3Dblue><u>https://github.com/openbmc/openbmc/issues/1957</u></font></a><fo=
nt size=3D3>)
to design a telemetry application for the OpenBMC. I would be explaining
a rough idea of how we plan to go about. Please share your thoughts and
feedback on this proposal. This issue would depend on the design evolving
out of following issues, since this app would utilize the capabilities
provided. (</font><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A=5F=5Fgithub.com=5Fopenbmc=5Fopenbmc=5Fissues=5F1856&amp;d=3DDwMFaQ&=
amp;c=3Djf=5FiaSHvJObTbx-siA1ZOg&amp;r=3Dg3oFrUCNLMKFaP17rERsIZKSKE6yYvKL3j=
AcaxmIa64&amp;m=3DUujlkiUKZq6cfZKZKDw9TP5RTSTH7aH4Geiv3kJpY8I&amp;s=3DrDhtl=
0eeZYA7rqH8OBb4TmsXNNiQmyJT7jx0wu9fgJs&amp;e=3D" target=3D=5Fblank><font si=
ze=3D3 color=3Dblue><u>https://github.com/openbmc/openbmc/issues/1856</u></=
font></a><font size=3D3>,
</font><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=
=5Fgithub.com=5Fopenbmc=5Fopenbmc=5Fissues=5F2102&amp;d=3DDwMFaQ&amp;c=3Djf=
=5FiaSHvJObTbx-siA1ZOg&amp;r=3Dg3oFrUCNLMKFaP17rERsIZKSKE6yYvKL3jAcaxmIa64&=
amp;m=3DUujlkiUKZq6cfZKZKDw9TP5RTSTH7aH4Geiv3kJpY8I&amp;s=3DpdVKSjq=5Fe2b1Z=
8vKixCfz1WGKAfhBIzIonDhoVW-dpg&amp;e=3D" target=3D=5Fblank><font size=3D3 c=
olor=3Dblue><u>https://github.com/openbmc/openbmc/issues/2102</u></font></a=
><font size=3D3>).<br><br>Summary of the requirements that we came across r=
elevant to this discussion.<br><br><br>1) BMC telemetry data (example VRM r=
ail voltages) where the data is collected
at different rates depending on the data and aggregated by the BMC app&nbsp;
(minimum, maximum<br>&nbsp; &nbsp; and average). Based on the collection ti=
ming request(frequency)
the metrics are logged, so that the user can fetch it for analytics.<br><br=
>2)&nbsp; Users should be able to set thresholds for the temperature limits,
and receive alerts. This would allow user to plan the cooling needs.<br><br=
>3)&nbsp; BMC would act as route for the OCC metrics to be send to the user.
The OCC would send down telemetric data to the BMC and BMC should figure
out a way to<br>&nbsp; &nbsp; &nbsp;alert the user to consume this data.<br=
><br><br>We would keep the focus of the discussion on the requirement no 1.=
<br>This proposal presupposes that all the resources( example VRM rail volt=
ages,
ambient temperature) that the telemetry app is interested in, should be
populated as dbus objects, which can<br>be queried to read the instantaneou=
s values. phosphor-hwmon application
exposes many of the interested resources.<br><br>The idea is to have a yaml=
 based approach, where the policy of the telemetry
app will be expressed. The application would be able to consume the yaml
and initiate the telemetry<br>data collection. The yaml would express the f=
ollowing:<br><br>a) Dbus Info (object, interface, property) associated with=
 the resource.<br>b) Units associated with the value (celsius) and the asso=
ciated scaling
factor).<br>c) Granularity - the time between two measures.<br>d) Aggregati=
on methods - min,max,avg..etc.<br>e) Logging policy - frequency for creatin=
g an event and alerting the user.<br><br>The application would operate base=
d on the policy and log the telemetry
data. The details of logging would evolve as we progress on the related
issue.<br><br>Regards,<br>Tom<br><br><br><br></font><br><font size=3D1 face=
=3D"sans-serif">[attachment &quot;zaius-fan-telemetry.png&quot;
deleted by Todd Rosedahl/Rochester/IBM] </font><br><br><BR>
--=_alternative 006D7A2486258194_=--
