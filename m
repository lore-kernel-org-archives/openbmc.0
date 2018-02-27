Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="grGdns/a"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrZVQ5cSczF1Vw
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 10:22:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519773462; x=1551309462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bhiXAJFU7JpvspSbdxUlQsyjYx8yFxeymziQbEzvkSc=;
 b=grGdns/aqAdnMJTIZrgg37jlcb6QqH9oVrXmGAywNnQTrxRceWKhzU75
 0cJN+Z6JOBd9lY+18O3pX1NP/ypRT8rO7it2zpmNoPBw7S1Jqe7WmLxkx
 kSW3cm0GDcunlkVKLLNnSrwyv1jYPrhch+AskJtXfD8dG4Hc4t8+pfy1m M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H3AQBN55Vah8qZ6EReGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQmEHAoCptrggKBFo0ShxiBU0IKGAeFEwKCTFYWAQIBAQEBAQE?=
 =?us-ascii?q?CAQIQAQEBCgsJCCgvgjgMJ0spAS8BAQEBAQEBAQEBAQEBAQEBAQEXAiVFAQEBA?=
 =?us-ascii?q?wEBOT8MBAIBCBEEAQEfCQcoHgkIAQEEAQ0FCIUFCBCuE4hyghYBAQEBAQUBAQE?=
 =?us-ascii?q?BAQEBAQEBARgFh0qGaoMuAoF4hWgFmk4JCYZHhXqEHoFvhDSIWol6h1aBLiUKg?=
 =?us-ascii?q?XlwT4JDH4I0ggd3GAEBiy6BFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2H3AQBN55Vah8qZ6EReGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?mEHAoCptrggKBFo0ShxiBU0IKGAeFEwKCTFYWAQIBAQEBAQECAQIQAQEBCgsJC?=
 =?us-ascii?q?CgvgjgMJ0spAS8BAQEBAQEBAQEBAQEBAQEBAQEXAiVFAQEBAwEBOT8MBAIBCBE?=
 =?us-ascii?q?EAQEfCQcoHgkIAQEEAQ0FCIUFCBCuE4hyghYBAQEBAQUBAQEBAQEBAQEBARgFh?=
 =?us-ascii?q?0qGaoMuAoF4hWgFmk4JCYZHhXqEHoFvhDSIWol6h1aBLiUKgXlwT4JDH4I0ggd?=
 =?us-ascii?q?3GAEBiy6BFwEBAQ?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 17:17:40 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2018 05:21:05 +0600
X-LoopCount0: from 10.166.136.210
X-IronPort-AV: E=Sophos;i="5.47,403,1515477600"; d="scan'208";a="1057536615"
X-DLP: DLP_GlobalPCIDSS
To: <ed.tanous@intel.com>, <hramasub@in.ibm.com>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Redfish Working Group - meeting times open discussion
Thread-Topic: OpenBMC Redfish Working Group - meeting times open discussion
Thread-Index: AdOvV+OBJ9z2ISIITSyVrtwYEMVvIgAT+AYA//+qdICAAa2NgIAAY/ag
Date: Tue, 27 Feb 2018 23:22:34 +0000
Message-ID: <95223c15b186450ba0cc600b73976ab0@ausx13mps334.AMER.DELL.COM>
References: <5213c491520645a3931dda63b4cac71c@ausx13mps334.AMER.DELL.COM>
 <OF08854A1A.1EE22BA0-ON65258241.000EAA0D-65258241.000F7172@notes.na.collabserv.com>
 <20180227034229.GA8216@wn7x64-4cggry1.aus.amer.dell.com>
 <7E9441B1E5EFFD4681F54958E82169932F6684EC@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F6684EC@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Tue, 27 Feb 2018 23:22:40 -0000

Add a Monday 9am CST (7am PST) option so that I can vote for that. :)
--
Michael

-----Original Message-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]=20
Sent: Tuesday, February 27, 2018 5:20 PM
To: Brown, Michael E <Michael_E_Brown@Dell.com>; Hariharasubramanian Ramasu=
bramanian <hramasub@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: RE: OpenBMC Redfish Working Group - meeting times open discussion

>=20
> Ed or I will send out a poll (I need to figure out how, I think Ed=20
> knows how already).
>=20

Poll for meeting times is up here:  https://goo.gl/forms/WlZ4ajhQqgDzkFvC2

I started with the times list that Michael originally proposed;  If there a=
re any popular times, I can also add them to the list.  Please try to reply=
 before Thursday at 5PM PST.  I will aggregate the responses then.

I will do my best to find a time that works for everyone.

-Ed=20
