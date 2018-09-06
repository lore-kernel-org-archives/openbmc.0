Return-Path: <james.mihm@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425Nmw5vPWzF3CC
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 11:50:01 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2018 18:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,334,1531810800"; 
 d="scan'208,217";a="261103357"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga006.fm.intel.com with ESMTP; 05 Sep 2018 18:49:55 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 5 Sep 2018 18:49:55 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.46]) by
 ORSMSX114.amr.corp.intel.com ([169.254.8.8]) with mapi id 14.03.0319.002;
 Wed, 5 Sep 2018 18:49:55 -0700
From: "Mihm, James" <james.mihm@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Hackathon October 9th - 11th Proposed Agenda
Thread-Topic: OpenBMC Hackathon October 9th - 11th Proposed Agenda
Thread-Index: AdRFf0s0Sm847uazRLCTX4LZoh6IEQ==
Date: Thu, 6 Sep 2018 01:49:54 +0000
Message-ID: <C599FC839619124CAC44E062ABB7DFE2D6FF2DFD@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGE1NTBlZWMtM2MyZS00MTM1LTkwNzktOTk2YTlkYzZkODNlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVGFmSjhBRkd1eVUzM0hTVU5UXC9VR2s5alhcL3A0K3FMNitUNVBFaDJDZTVxUGVJRVUwQnppMXZDdnBhSklwY250In0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.138]
Content-Type: multipart/alternative;
 boundary="_000_C599FC839619124CAC44E062ABB7DFE2D6FF2DFDORSMSX101amrcor_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 01:50:09 -0000

--_000_C599FC839619124CAC44E062ABB7DFE2D6FF2DFDORSMSX101amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There are still openings available. Please register soon if you're planning=
 to attend the event.

To register for the event, please visit:
https://docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8=
LqJAxnryMsmkRTQ/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link

Below is my proposed list of the agenda for the OpenBMC Hackathon being hel=
d at Intel on October 9th - 11th.
This is a collection of the input that I received from those that registere=
d for the event.

I'm soliciting input from the community for discussion topics and ideas for=
 the event.
Please let me know if there is any topic that you would like to include, or=
 input regarding format.

There will be several rooms where community members/developers can break in=
to different workgroups.
I'm planning on having two tracks. Where track 1 will be focused on discuss=
ions/presentations, and track 2 will be focused on working groups.

Breakfast and lunch will be provided by Intel.

Breakfast: 8:15am
Start time:  9am
Lunch:  12-1pm
End time: 5pm

No-Host Dinner/Networking: I'm working on a list of restaurants in the area=
. This will be an organic activity and self-organizing.


Tuesday (Day 1)
Track 1 - Tech Talks
        Kick-Off and Introductions
        Keynote
        Best practices for the OpenBMC community
        User Management - progress report, new use cases
        Linux Drivers - development best practices, the good/bad/ugly
        Redfish - schema support, OCP compliance, testing, plugfest updates=
, RSD support, next steps
        Platform configuration - porting to new hardware, sensor configurat=
ion
        Demonstrations of hardware & firmware that is, or will be, availabl=
e in the open source repository

Track 2 - Hacking
        On Boarding / Training
        Writing and Debugging Code
        Documentation - work on improving the content

Wednesday (Day 2)
Track 1 - Tech Talks
        Hardware requirements/guidelines - security, sensor support
        IPMI - compliance vs. non-compliance, security impacts, BIOS OEM co=
mmands
        BMC device enablement - BSP, future requirements (e.g., i3c support=
, crypto, fuses)
        Logging and debug mechanisms, telemetry and alerts.
        Security - threat model, incident response, ARM TrustZone, process =
isolation, key storage, crypto guidelines
        Bootloader - flash memory layout, SPI flash (boot rom vs. operation=
al image)
        Secure Boot - Cerberus, Titan, PFR, Poor-Mans-Security-Implementati=
on
        Engagement with OCP

Track 2 - Hacking
        continuation from day 1
        Security Scanning
        Penetration Testing


Thursday (Day 3)
Track 1 - Tech Talks
        Validation - test plans, Jenkins support
        WebUI Design - Customization
        KVM & Virtual Media
        Feature Development
        Release Planning

Track 2 - Hacking
        continuation from day 2
        Free-form demonstration of work accomplished during hackathon

Thanks,
James Mihm
Intel - Intel DCG BMC Core Firmware




--_000_C599FC839619124CAC44E062ABB7DFE2D6FF2DFDORSMSX101amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>There are still openings available. Please register soon if you&#8217;=
re planning to attend the event.</div>
<div>&nbsp;</div>
<div>To register for the event, please visit:</div>
<div><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQk=
b3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=3D0&amp;amp;w=3D1&amp;amp;usp=3D=
mail_form_link"><font color=3D"#0563C1"><u>https://docs.google.com/forms/d/=
e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=3D0&a=
mp;amp;w=3D1&amp;amp;usp=3Dmail_form_link</u></font></a></div>
<div>&nbsp;</div>
<div>Below is my proposed list of the agenda for the OpenBMC Hackathon bein=
g held at Intel on October 9th - 11<font size=3D"1"><span style=3D"font-siz=
e:7.3pt;"><sup>th</sup></span></font>.</div>
<div>This is a collection of the input that I received from those that regi=
stered for the event.</div>
<div>&nbsp;</div>
<div>I&#8217;m soliciting input from the community for discussion topics an=
d ideas for the event. </div>
<div>Please let me know if there is any topic that you would like to includ=
e, or input regarding format.</div>
<div>&nbsp;</div>
<div>There will be several rooms where community members/developers can bre=
ak into different workgroups.</div>
<div>I&#8217;m planning on having two tracks. Where track 1 will be focused=
 on discussions/presentations, and track 2 will be focused on working group=
s.</div>
<div>&nbsp;</div>
<div>Breakfast and lunch will be provided by Intel.</div>
<div>&nbsp;</div>
<div>Breakfast: 8:15am</div>
<div>Start time:&nbsp; 9am</div>
<div>Lunch:&nbsp; 12-1pm</div>
<div>End time: 5pm</div>
<div>&nbsp;</div>
<div>No-Host Dinner/Networking: I&#8217;m working on a list of restaurants =
in the area. This will be an organic activity and self-organizing.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Tuesday (Day 1) </div>
<div>Track 1 - Tech Talks</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kick-Off and Introductions<=
/div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Keynote</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Best practices for the Open=
BMC community</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User Management - progress =
report, new use cases</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Linux Drivers - development=
 best practices, the good/bad/ugly</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redfish - schema support, O=
CP compliance, testing, plugfest updates, RSD support, next steps</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Platform configuration - po=
rting to new hardware, sensor configuration</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Demonstrations of hardware =
&amp; firmware that is, or will be, available in the open source repository=
</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
<div>Track 2 - Hacking</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; On Boarding / Training</div=
>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Writing and Debugging Code<=
/div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Documentation - work on imp=
roving the content</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
<div>Wednesday (Day 2)</div>
<div>Track 1 - Tech Talks</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hardware requirements/guide=
lines - security, sensor support</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IPMI - compliance vs. non-c=
ompliance, security impacts, BIOS OEM commands</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BMC device enablement - BSP=
, future requirements (e.g., i3c support, crypto, fuses)</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Logging and debug mechanism=
s, telemetry and alerts.</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Security - threat model, in=
cident response, ARM TrustZone, process isolation, key storage, crypto guid=
elines</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bootloader - flash memory l=
ayout, SPI flash (boot rom vs. operational image)</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Secure Boot - Cerberus, Tit=
an, PFR, Poor-Mans-Security-Implementation</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Engagement with OCP</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
<div>Track 2 - Hacking</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continuation from day 1</di=
v>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Security Scanning</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Penetration Testing</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thursday (Day 3)</div>
<div>Track 1 - Tech Talks</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Validation - test plans, Je=
nkins support</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebUI Design - Customizatio=
n</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KVM &amp; Virtual Media</di=
v>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Feature Development</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Release Planning</div>
<div>&nbsp;</div>
<div>Track 2 - Hacking</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continuation from day 2</di=
v>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Free-form demonstration of =
work accomplished during hackathon</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div><font face=3D"Comic Sans MS" size=3D"2" color=3D"navy"><span style=3D"=
font-size:10pt;">James Mihm<font face=3D"Arial" size=3D"2" color=3D"black">=
<span style=3D"font-size:11pt;">
<br>

</span></font><font size=3D"2"><span style=3D"font-size:11pt;">Intel - </sp=
an></font>Intel <font size=3D"2"><span style=3D"font-size:11pt;">DCG BMC Co=
re Firmware<br>

</span></font></span></font></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_C599FC839619124CAC44E062ABB7DFE2D6FF2DFDORSMSX101amrcor_--
