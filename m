Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="tpHAcGJe"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qwls19cZzDqNY
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 23:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1526994137; x=1558530137; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Bzlb+cIzajJCRQ549NYaY91d9u+9sNuCUrtKhlfJ1hs=;
 b=tpHAcGJe5k9LwFRgyZ1R1BFJ7m2vEr2hyKaOJ610MMHkZU1IA9LAMEYX
 OTLM3I1BHgqz5kUsa8TqgJ3IF3iLS3SCk+Wvu5amgHVAjkcT3XP76xkio
 A9dZrvArhvXvdUOZAjvvWQ3E8Lu+kF+7FdF2Qtbw8JP/Oe5SEAfHuyzo4 w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FwAACUFARbh2Oa6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGDFIEDgQsoCoNrlHuDCF+LaYZuFIFkC4RsgiQhNhYBAgEBAQE?=
 =?us-ascii?q?BAQIBAQIQAQEBCgsJCCgjDII1IoJTAQEiBAFEAgYZBAEZBAEBAgMLBhICAx0rC?=
 =?us-ascii?q?QkBBAESCIMaggGNA5s+AYIgg3gBAYRLgg8FgQGHL4ITiEpmHgiCNoJXAphPBwI?=
 =?us-ascii?q?JjkaBP4NuhkiBEZB6gSUjBYF/cFCCQ4IuiFqFEAE1b4wYBIEqgRgBAQ?=
X-IPAS-Result: =?us-ascii?q?A2FwAACUFARbh2Oa6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?DFIEDgQsoCoNrlHuDCF+LaYZuFIFkC4RsgiQhNhYBAgEBAQEBAQIBAQIQAQEBC?=
 =?us-ascii?q?gsJCCgjDII1IoJTAQEiBAFEAgYZBAEZBAEBAgMLBhICAx0rCQkBBAESCIMaggG?=
 =?us-ascii?q?NA5s+AYIgg3gBAYRLgg8FgQGHL4ITiEpmHgiCNoJXAphPBwIJjkaBP4NuhkiBE?=
 =?us-ascii?q?ZB6gSUjBYF/cFCCQ4IuiFqFEAE1b4wYBIEqgRgBAQ?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2018 08:01:54 -0500
From: <Michael.E.Brown@dell.com>
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, 
 <hramasub@in.ibm.com>, <Balaji.B.Rao@dell.com>,
 <bradleyb@fuzziesquirrel.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>, 
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <yupalani@microsoft.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2018 19:01:54 +0600
X-LoopCount0: from 10.166.132.55
X-IronPort-AV: E=Sophos;i="5.49,430,1520917200"; d="scan'208";a="1253931210"
X-DLP: DLP_GlobalPCIDSS
Subject: Meeting Minutes 5/21/2018 - RE: OpenBMC Redfish working group working
 call
Thread-Topic: Meeting Minutes 5/21/2018 - RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPxR2L8aPsaXMUkQRSsKaWiyuHFGQ==
Date: Tue, 22 May 2018 13:01:52 +0000
Message-ID: <affe8617cd4748f191bba0a27b616343@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 22 May 2018 13:02:18 -0000

 - No meeting next week (AI: ED: please cancel for next week. Memorial day)
 - Pavel - working on documentation to post for the dbus implementation of =
extensions. Intent is to post these docs by the middle of the week.
 - Ed pushed a patch set to enable feature selection to bmcweb at compile t=
ime (!) - yay!   (Please review!)

 - MAJOR: proposal to make "bmcweb" the official redfish stack of the openb=
mc project.
	Intention is to have this be discussion topic for our next meeting and to =
make a list of any missing features needed to get it up to par for everybod=
y's needs.

--
Michael

-----Original Appointment-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]=20
Sent: Monday, April 16, 2018 12:40 PM
To: Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Hariharas=
ubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kumar36@tcs=
.com; rolfb@us.ibm.com; Chris.Ong@microsoft.com; alirhas@microsoft.com; yup=
alani@microsoft.com
Subject: OpenBMC Redfish working group working call
When: Monday, May 21, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time (US & C=
anada).
Where: Skype Meeting



Due to the problems with Blue Jeans we had last week, and the fact that we =
don=1B$B!G=1B(Bt seem to use the video conference feature, lets switch back=
 to Skype.  Unfortunately, BlueJeans doesn=1B$B!G=1B(Bt give an easy way to=
 send out cancelations, and my account is in a state of flux,=20

Description:
Per meeting decision, this meeting invite is for the =1B$B!H=1B(BOpenBMC Re=
dfish working group=1B$B!I=1B(B. This
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing
list. The working group is open to anybody who would like to participate in=
 development of
Redfish on OpenBMC.
=20

Base agenda:
=20
Call for opens
Presentation of frameworks
Discussion of Redfish on OpenBMC

=20
=20
=20
...........................................................................=
..............................................................
=1B$B"*=1B(B Join Skype Meeting    =20
Trouble Joining? Try Skype Web App=20
Join by phone
+1(916)356-2663 (or your local bridge access #) Choose bridge 5. (Global)  =
              English (United States)=20
Find a local number=20
=20
Conference ID: 205576574
Forgot your dial-in PIN? |Help    =20
=20
[!OC([1033])!]
...........................................................................=
..............................................................
=20
=20
