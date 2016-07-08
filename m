Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rm9Nw0ZSbzDqlj
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 20:15:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u68AE9iZ070964
 for <openbmc@lists.ozlabs.org>; Fri, 8 Jul 2016 06:15:40 -0400
Received: from e28smtp01.in.ibm.com (e28smtp01.in.ibm.com [125.16.236.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2415xnf2hb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Jul 2016 06:15:40 -0400
Received: from localhost
 by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 8 Jul 2016 15:45:36 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 8 Jul 2016 15:45:35 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 157B5125805F
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 15:48:22 +0530 (IST)
Received: from d50lp03.ny.us.ibm.com (d50lp03.extnet.ibm.com [146.89.104.211])
 by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u68AEPvj61145102
 for <openbmc@lists.ozlabs.org>; Fri, 8 Jul 2016 15:44:26 +0530
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 8 Jul 2016 06:15:31 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Fri, 8 Jul 2016 06:15:30 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 8 Jul 2016 10:15:28 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 8 Jul 2016 10:15:27 -0000
X-IBM-Helo: us1a3-smtp03.a3.dal06.isc4sb.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: raltherr@google.com;openbmc@lists.ozlabs.org;patrick@stwcx.xyz
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016070810152668-175716 ;
 Fri, 8 Jul 2016 10:15:26 +0000 
MIME-Version: 1.0
In-Reply-To: <CAPLgG==JmJ8fQJH_S+STjvRQzppSXcf1yhdyZJo7M=+XtJwRPA@mail.gmail.com>
Subject: Re: Issues with setting the timeofday
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Fri, 8 Jul 2016 15:45:18 +0530
References: <OFAF379D90.EBDC1ECC-ON65258094.0026E76B-65257FE9.004807C1@notes.na.collabserv.com>
 <CAPLgG=kcOH1h6NZ6-gV9dTaKzpjjZfqpQBjTzXd-r3t8e5VL5g@mail.gmail.com>
 <20160707182339.GE20922@asimov.austin.ibm.com>
 <CAPLgG=kbaOU3YEo44i33GFiOg6ciyxiyNoxe+bc-ckXdfzMTzw@mail.gmail.com>
 <20160707191336.GF20922@asimov.austin.ibm.com>
 <CAPLgG==JmJ8fQJH_S+STjvRQzppSXcf1yhdyZJo7M=+XtJwRPA@mail.gmail.com>
X-KeepSent: 94B4099D:85E76BC0-65258094:0026E786;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 41923
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB0A07DFB561168f9e8a93df938690918cEABB0A07DFB56116"
Content-Disposition: inline
x-cbid: 16070810-4789-0000-0000-000002E8463D
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.294059; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005466; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000172; SDB=6.00727398; UDB=6.00340422; UTC=2016-07-08
 10:15:28
x-cbparentid: 16070810-5102-0000-0000-000000560D11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF94B4099D.85E76BC0-ON65258094.0026E786-65257FEA.00385571@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607080102
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
X-List-Received-Date: Fri, 08 Jul 2016 10:15:44 -0000


--0__=EABB0A07DFB561168f9e8a93df938690918cEABB0A07DFB56116
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


hello Rick,

As Patrick mentioned, the intention was to set the time of day using
settimeofday() and then read it back as a verification process and that was
not giving us expected results.

I have put my comments inline.

Rick Altherr <raltherr@google.com> wrote on 07/08/2016 01:12:05 AM:

> From: Rick Altherr <raltherr@google.com>
> To: Patrick Williams <patrick@stwcx.xyz>
> Cc: Vishwanatha Subbanna/India/IBM@IBMIN, OpenBMC
<openbmc@lists.ozlabs.org>
> Date: 07/08/2016 01:12 AM
> Subject: Re: Issues with setting the timeofday
>
> In that case, I'd expect this behavior on the BMC assuming some form
> of NTP client has been started.=A0 The BMC's RTC (what hwclock is
> reading and writing) runs independent of the BMC's kernel clock
> (what date is reporting).=A0 The kernel (AFAIK) doesn't poll the RTC
> normally to keep in sync.=A0 Once the time is set at boot time, the
> kernel will just keep marching along based on the SoC's clock
> input.=A0 This can eventually lead to time skew between the kernel and
> RTC if they are using independent clocks (very very likely).
> Synchronization is left to userspace tools.
>
> root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> Sun Dec 25 12:34:56 UTC 2016
>
> The first command sets the BMC kernel time to a known timestamp.
> The second writes that to the BMC's RTC.
>
>

Agreed. The intention was to write to the kernel time using settimeofday ()
and then push it onto BMC RTC.

> root@barreleye:~# date
> Thu Jul 7 13:07:37 UTC 2016
>
> Now you've read back the BMC kernel's time and it has been rewritten
> to current, real-world time.=A0 This only happens if some userspace
> process set the kernel's time independently.=A0 The BMC RTC is not
> involved here.
>
>

Correct. the kernel time was set by the user and this command was just to
show that the
kernel time was getting overwritten.
I did not realize that systemd-timesyncd was running at the background.
After killing the systemd-timesyncd,
I was seeing that settimeofday and gettimeofday was giving me what I
wanted.

> root@barreleye:~# hwclock -r
> Sun Dec 25 12:35:01 2016=A00.000000 seconds
>
> This reads back to the BMC RTC's time.=A0 It has advanced 5 seconds
> since it was written which seems plausible.=A0 Note this also strongly
> implies that the initial commands that set the kernel time and wrote
> it to the RTC were successful.=A0 It's also possible that the RTC just
> happened to be close to the desired time already but that seems
veryunlikely.
>
>

Yes.. That was my point. The kernel time was immediately getting
overwritten.
Like I said, I was not aware that timesyncd was running.

> root@barreleye:~# hwclock -s
>
> This will read the BMC RTC's time and set the BMC kernel's time to
> that same time point.=A0 An immediate 'date' command =5Fshould=5F return =
that
time.
>
>
> root@barreleye:~# date
> Thu Jul 7 13:07:52 UTC 2016
>
> This is 15s after the last 'date' command.=A0 Given that this is the
> 3rd command to run since, there seems to be about 5s between
> commands on the CLI.=A0 That's plenty of time for ntpd or timesyncd to
> overwrite the kernel time with current NTP time.
>
>
> root@barreleye:~#
>
> On Thu, Jul 7, 2016 at 12:13 PM, Patrick Williams <patrick@stwcx.xyz>
wrote:
> On Thu, Jul 07, 2016 at 11:32:51AM -0700, Rick Altherr wrote:
> > I'm unfamiliar with Barreleye.=A0 Does the host use the BMC as an RTC?
Are
> > the commands in the first post being run on the host or on the BMC?
>
> Rick, good questions.
>
> On all the current Power systems, the Host does not have its own RTC.
The
> skiboot code will create an RTC for the kernel by using IPMI commands
down
> to the BMC.=A0 They use the standard get-sel-time / set-sel-time IPMI
> command for this.=A0 Other-BMC systems already operated this way, and sin=
ce
> the Host firmware support was already there for other-BMC systems, we
> implemented this same behavior on openBMC.=A0 There are also other IPMI
> commands that we implemented to emulate other-BMC behavior so as to not
> require Host firmware changes for openBMC.
>
> The commands Vishwa has below here are ran from the BMC.=A0 The commands
> in the Github issue are also ran from the BMC, but you will see a call
> to '/tmp/ipmitool' there.=A0 That is a development version of the ipmitool
> that will call into the dbus stack as if the Host sent an IPMI message
> through the BT interface.=A0 Thus, 'ipmitool -l dbus sel time set ...' and
> 'ipmitool -l dbus sel time get' are emulating the behavior of the host,
> while 'date' is interacting with the BMC's kernel time subsystem.
>
> > On Thu, Jul 7, 2016 at 11:23 AM, Patrick Williams <patrick@stwcx.xyz>
wrote:
> >
> > > On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Altherr wrote:
> > > > If ntpd or systemd-timesyncd is running, this makes perfect
> sense.=A0 Linux
> > > > maintains current time in the kernel.=A0 The hardware RTC is only
used to
> > > > load an initial time at boot and is written during shutdown.
> When an NTP
> > > > daemon is running and an NTP server is reachable, it will adjust
the
> > > > kernel's current time to match NTP time.=A0 I believe with timesync=
d,
it
> > > > simply steps time instead of slewing like ntpd does.
> > > >
> > > > What are you trying to accomplish?=A0 There is likely a way to
> do it if you
> > > > can describe what you want to have happen.
> > >
> > > It looks like maybe this is related to Github issue
openbmc/openbmc#310.
> > >
> > >=A0 =A0 =A0https://github.com/openbmc/openbmc/issues/310
> > >
> > > > On Thu, Jul 7, 2016 at 6:06 AM, Vishwanatha Subbanna <
> > > vishwanath@in.ibm.com>
> > > > wrote:
> > > >
> > > > > hey Joel,
> > > > >
> > > > > Here is what I am seeing on one the Barreleye box that is running
> > > > > "4.4.12-openbmc-20160606-1 : kernel". I can see that time gets
set but
> > > > > reverts immediately. Syncing what's in hwclock does not haveany
effect
> > > > > too. Any thoughts ?
> > > > >
> > > > > root@barreleye:~# date -s '2016-12-25 12:34:56' ; hwclock -w
> > > > > Sun Dec 25 12:34:56 UTC 2016
> > > > >
> > > > > root@barreleye:~# date
> > > > > Thu Jul 7 13:07:37 UTC 2016
> > > > >
> > > > > root@barreleye:~# hwclock -r
> > > > > Sun Dec 25 12:35:01 2016 0.000000 seconds
> > > > >
> > > > > root@barreleye:~# hwclock -s
> > > > >
> > > > > root@barreleye:~# date
> > > > > Thu Jul 7 13:07:52 UTC 2016
> > > > > root@barreleye:~#
> > > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > >
> > >
>
---------------------------------------------------------------------------=
----------

> > > > > Thanks and Regards,
> > > > > Vishwanath.
> > > > > Advisory Software Engineer,
> > > > > Power Firmware Development,
> > > > > Systems &Technology Lab,
> > > > > MG2-6F-255 , Manyata Embassy Business Park,
> > > > > Bangalore , KA , 560045
> > > > > Ph: +91-80-46678255
> > > > > E-mail: vishwanath@in.ibm.com
> > > > >
> > > > >
> > >
>
---------------------------------------------------------------------------=
-------

> > > > >
> > > > > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F
> > > > > openbmc mailing list
> > > > > openbmc@lists.ozlabs.org
> > > > > https://lists.ozlabs.org/listinfo/openbmc
> > > > >
> > > > >
> > >
> > > > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > > > openbmc mailing list
> > > > openbmc@lists.ozlabs.org
> > > > https://lists.ozlabs.org/listinfo/openbmc
> > >
> > >
> > > --
> > > Patrick Williams
> > >

> --
> Patrick Williams

--0__=EABB0A07DFB561168f9e8a93df938690918cEABB0A07DFB56116
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt>hello Rick,</tt><br><br><tt>As Patrick mentioned, the in=
tention was to set the time of day using settimeofday() and then read it ba=
ck as a verification process and that was not giving us expected results.</=
tt><br><br><tt>I have put my comments inline.</tt><br><br><tt>Rick Altherr =
&lt;raltherr@google.com&gt; wrote on 07/08/2016 01:12:05 AM:<br><br>&gt; Fr=
om: Rick Altherr &lt;raltherr@google.com&gt;</tt><br><tt>&gt; To: Patrick W=
illiams &lt;patrick@stwcx.xyz&gt;</tt><br><tt>&gt; Cc: Vishwanatha Subbanna=
/India/IBM@IBMIN, OpenBMC &lt;openbmc@lists.ozlabs.org&gt;</tt><br><tt>&gt;=
 Date: 07/08/2016 01:12 AM</tt><br><tt>&gt; Subject: Re: Issues with settin=
g the timeofday</tt><br><tt>&gt; <br>&gt; In that case, I'd expect this beh=
avior on the BMC assuming some form<br>&gt; of NTP client has been started.=
=A0 The BMC's RTC (what hwclock is <br>&gt; reading and writing) runs indep=
endent of the BMC's kernel clock <br>&gt; (what date is reporting).=A0 The =
kernel (AFAIK) doesn't poll the RTC <br>&gt; normally to keep in sync.=A0 O=
nce the time is set at boot time, the <br>&gt; kernel will just keep marchi=
ng along based on the SoC's clock <br>&gt; input.=A0 This can eventually le=
ad to time skew between the kernel and<br>&gt; RTC if they are using indepe=
ndent clocks (very very likely).=A0 <br>&gt; Synchronization is left to use=
rspace tools.</tt><br><tt>&gt; <br>&gt; root@barreleye:~# date -s '2016-12-=
25 12:34:56' ; hwclock -w<br>&gt; Sun Dec 25 12:34:56 UTC 2016</tt><br><tt>=
&gt; <br>&gt; The first command sets the BMC kernel time to a known timesta=
mp.=A0 <br>&gt; The second writes that to the BMC's RTC.</tt><br><tt>&gt; =
=A0</tt><br><tt>&gt; </tt><br><br><tt>Agreed. The intention was to write to=
 the kernel time using settimeofday () and then push it onto BMC RTC.</tt><=
br><tt><br>&gt; root@barreleye:~# date<br>&gt; Thu Jul 7 13:07:37 UTC 2016<=
/tt><br><tt>&gt; <br>&gt; Now you've read back the BMC kernel's time and it=
 has been rewritten<br>&gt; to current, real-world time.=A0 This only happe=
ns if some userspace <br>&gt; process set the kernel's time independently.=
=A0 The BMC RTC is not <br>&gt; involved here.</tt><br><tt>&gt; =A0</tt><br=
><tt>&gt; </tt><br><br><tt>Correct. the kernel time was set by the user and=
 this command was just to show that the </tt><br><tt>kernel time was gettin=
g overwritten. </tt><br><tt>I did not realize that systemd-timesyncd was ru=
nning at the background. After killing the systemd-timesyncd, </tt><br><tt>=
I was seeing that settimeofday and gettimeofday was giving me what I wanted=
.</tt><br><tt><br>&gt; root@barreleye:~# hwclock -r<br>&gt; Sun Dec 25 12:3=
5:01 2016=A00.000000 seconds</tt><br><tt>&gt; <br>&gt; This reads back to t=
he BMC RTC's time.=A0 It has advanced 5 seconds <br>&gt; since it was writt=
en which seems plausible.=A0 Note this also strongly<br>&gt; implies that t=
he initial commands that set the kernel time and wrote<br>&gt; it to the RT=
C were successful.=A0 It's also possible that the RTC just<br>&gt; happened=
 to be close to the desired time already but that seems veryunlikely.</tt><=
br><tt>&gt; =A0</tt><br><tt>&gt;</tt><br><br><tt>Yes.. That was my point. T=
he kernel time was immediately getting overwritten.</tt><br><tt>Like I said=
, I was not aware that timesyncd was running.</tt><br><tt><br>&gt; root@bar=
releye:~# hwclock -s</tt><br><tt>&gt; <br>&gt; This will read the BMC RTC's=
 time and set the BMC kernel's time to <br>&gt; that same time point.=A0 An=
 immediate 'date' command =5Fshould=5F return that time.</tt><br><tt>&gt; =
=A0</tt><br><tt>&gt; <br>&gt; root@barreleye:~# date<br>&gt; Thu Jul 7 13:0=
7:52 UTC 2016</tt><br><tt>&gt; <br>&gt; This is 15s after the last 'date' c=
ommand.=A0 Given that this is the <br>&gt; 3rd command to run since, there =
seems to be about 5s between <br>&gt; commands on the CLI.=A0 That's plenty=
 of time for ntpd or timesyncd to<br>&gt; overwrite the kernel time with cu=
rrent NTP time.</tt><br><tt>&gt; <br>&gt; =A0</tt><br><tt>&gt; root@barrele=
ye:~#=A0</tt><br><tt>&gt; <br>&gt; On Thu, Jul 7, 2016 at 12:13 PM, Patrick=
 Williams &lt;patrick@stwcx.xyz&gt; wrote:</tt><br><tt>&gt; On Thu, Jul 07,=
 2016 at 11:32:51AM -0700, Rick Altherr wrote:<br>&gt; &gt; I'm unfamiliar =
with Barreleye.=A0 Does the host use the BMC as an RTC?=A0 Are<br>&gt; &gt;=
 the commands in the first post being run on the host or on the BMC?<br>&gt=
; <br>&gt; Rick, good questions.<br>&gt; <br>&gt; On all the current Power =
systems, the Host does not have its own RTC.=A0 The<br>&gt; skiboot code wi=
ll create an RTC for the kernel by using IPMI commands down<br>&gt; to the =
BMC.=A0 They use the standard get-sel-time / set-sel-time IPMI<br>&gt; comm=
and for this.=A0 Other-BMC systems already operated this way, and since<br>=
&gt; the Host firmware support was already there for other-BMC systems, we<=
br>&gt; implemented this same behavior on openBMC.=A0 There are also other =
IPMI<br>&gt; commands that we implemented to emulate other-BMC behavior so =
as to not<br>&gt; require Host firmware changes for openBMC.<br>&gt; <br>&g=
t; The commands Vishwa has below here are ran from the BMC.=A0 The commands=
<br>&gt; in the Github issue are also ran from the BMC, but you will see a =
call<br>&gt; to '/tmp/ipmitool' there.=A0 That is a development version of =
the ipmitool<br>&gt; that will call into the dbus stack as if the Host sent=
 an IPMI message<br>&gt; through the BT interface.=A0 Thus, 'ipmitool -l db=
us sel time set ...' and<br>&gt; 'ipmitool -l dbus sel time get' are emulat=
ing the behavior of the host,<br>&gt; while 'date' is interacting with the =
BMC's kernel time subsystem.</tt><br><tt>&gt; <br>&gt; &gt; On Thu, Jul 7, =
2016 at 11:23 AM, Patrick Williams &lt;patrick@stwcx.xyz&gt; wrote:<br>&gt;=
 &gt;<br>&gt; &gt; &gt; On Thu, Jul 07, 2016 at 09:52:36AM -0700, Rick Alth=
err wrote:<br>&gt; &gt; &gt; &gt; If ntpd or systemd-timesyncd is running, =
this makes perfect <br>&gt; sense.=A0 Linux<br>&gt; &gt; &gt; &gt; maintain=
s current time in the kernel.=A0 The hardware RTC is only used to<br>&gt; &=
gt; &gt; &gt; load an initial time at boot and is written during shutdown.=
=A0 <br>&gt; When an NTP<br>&gt; &gt; &gt; &gt; daemon is running and an NT=
P server is reachable, it will adjust the<br>&gt; &gt; &gt; &gt; kernel's c=
urrent time to match NTP time.=A0 I believe with timesyncd, it<br>&gt; &gt;=
 &gt; &gt; simply steps time instead of slewing like ntpd does.<br>&gt; &gt=
; &gt; &gt;<br>&gt; &gt; &gt; &gt; What are you trying to accomplish?=A0 Th=
ere is likely a way to <br>&gt; do it if you<br>&gt; &gt; &gt; &gt; can des=
cribe what you want to have happen.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; It =
looks like maybe this is related to Github issue openbmc/openbmc#310.<br>&g=
t; &gt; &gt;<br>&gt; &gt; &gt;=A0 =A0 =A0<a href=3D"https://github.com/open=
bmc/openbmc/issues/310">https://github.com/openbmc/openbmc/issues/310</a><b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; On Thu, Jul 7, 2016 at 6:06 AM, Vis=
hwanatha Subbanna &lt;<br>&gt; &gt; &gt; vishwanath@in.ibm.com&gt;<br>&gt; =
&gt; &gt; &gt; wrote:<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; he=
y Joel,<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; Here is wha=
t I am seeing on one the Barreleye box that is running<br>&gt; &gt; &gt; &g=
t; &gt; &quot;4.4.12-openbmc-20160606-1 : kernel&quot;. I can see that time=
 gets set but<br>&gt; &gt; &gt; &gt; &gt; reverts immediately. Syncing what=
's in hwclock does not haveany effect<br>&gt; &gt; &gt; &gt; &gt; too. Any =
thoughts ?<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; root@bar=
releye:~# date -s '2016-12-25 12:34:56' ; hwclock -w<br>&gt; &gt; &gt; &gt;=
 &gt; Sun Dec 25 12:34:56 UTC 2016<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt;=
 &gt; &gt; &gt; root@barreleye:~# date<br>&gt; &gt; &gt; &gt; &gt; Thu Jul =
7 13:07:37 UTC 2016<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt;=
 root@barreleye:~# hwclock -r<br>&gt; &gt; &gt; &gt; &gt; Sun Dec 25 12:35:=
01 2016 0.000000 seconds<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt;=
 &gt; root@barreleye:~# hwclock -s<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt;=
 &gt; &gt; &gt; root@barreleye:~# date<br>&gt; &gt; &gt; &gt; &gt; Thu Jul =
7 13:07:52 UTC 2016<br>&gt; &gt; &gt; &gt; &gt; root@barreleye:~#<br>&gt; &=
gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; Thanks<br>&gt; &gt; &gt; &gt=
; &gt;<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt;=
 &gt; <br>&gt; ------------------------------------------------------------=
-------------------------<br>&gt; &gt; &gt; &gt; &gt; Thanks and Regards,<b=
r>&gt; &gt; &gt; &gt; &gt; Vishwanath.<br>&gt; &gt; &gt; &gt; &gt; Advisory=
 Software Engineer,<br>&gt; &gt; &gt; &gt; &gt; Power Firmware Development,=
<br>&gt; &gt; &gt; &gt; &gt; Systems &amp;Technology Lab,<br>&gt; &gt; &gt;=
 &gt; &gt; MG2-6F-255 , Manyata Embassy Business Park,<br>&gt; &gt; &gt; &g=
t; &gt; Bangalore , KA , 560045<br>&gt; &gt; &gt; &gt; &gt; Ph: +91-80-4667=
8255<br>&gt; &gt; &gt; &gt; &gt; E-mail: vishwanath@in.ibm.com<br>&gt; &gt;=
 &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; <br>&gt; ----=
---------------------------------------------------------------------------=
---<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; &gt; &gt; &gt; =
&gt; openbmc mailing list<br>&gt; &gt; &gt; &gt; &gt; openbmc@lists.ozlabs.=
org<br>&gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.ozlabs.org/listinf=
o/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>&gt; &gt; &gt; =
&gt; &gt;<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; &=
gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>&gt; &gt; &gt; &gt; openbmc mailing list<br>&gt; &gt; &gt; &gt; openbmc@li=
sts.ozlabs.org<br>&gt; &gt; &gt; &gt; <a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>&gt; &gt;=
 &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; --<br>&gt; &gt; &gt; Patrick Will=
iams<br>&gt; &gt; &gt;<br></tt><br><tt>&gt; --<br>&gt; Patrick Williams</tt=
><BR>
</body></html>

--0__=EABB0A07DFB561168f9e8a93df938690918cEABB0A07DFB56116--
