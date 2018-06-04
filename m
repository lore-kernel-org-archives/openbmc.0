Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40zxB06qrrzF11V
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jun 2018 23:49:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2018 06:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="61630053"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga001.jf.intel.com with ESMTP; 04 Jun 2018 06:49:07 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 4 Jun 2018 06:49:06 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.118]) by
 ORSMSX156.amr.corp.intel.com ([169.254.8.16]) with mapi id 14.03.0319.002;
 Mon, 4 Jun 2018 06:49:06 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Brad Chou <chou.brad@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: IPMI and Redfish support in openbmc Linux
Thread-Topic: IPMI and Redfish support in openbmc Linux
Thread-Index: AQHT+8ZF4LXYlSBvmE6ly+mZldteZaRQHMWg
Date: Mon, 4 Jun 2018 13:49:06 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933BDDEB33@ORSMSX114.amr.corp.intel.com>
References: <mailman.479.1527871603.18429.openbmc@lists.ozlabs.org>
 <C98DD0A2-E79C-47D9-843D-D6012DA22A6C@gmail.com>
In-Reply-To: <C98DD0A2-E79C-47D9-843D-D6012DA22A6C@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="iso-8859-1"
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
X-List-Received-Date: Mon, 04 Jun 2018 13:49:14 -0000

There is no KCS bridge merged with master yet, although I submitted one for=
 code review last week.   Your best bet at making it available on master wo=
uld be to provide review feedback to the Gerrit reviews below, which should=
 help get it merged quickly.

https://gerrit.openbmc-project.xyz/#/c/10946/
https://gerrit.openbmc-project.xyz/#/c/10951/

Alternately, you can simply pull in those commits and add the phosphor-ipmi=
-kcs component to your build while it's in code review.  I already have a f=
ew reports of people having used it successfully.=20

-Ed


From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.or=
g] On Behalf Of Brad Chou
Sent: Sunday, June 3, 2018 10:39 PM
To: openbmc@lists.ozlabs.org
Subject: RE: IPMI and Redfish support in openbmc Linux

Hi Ed,
May I know how to use kcs with host ipmi ?
Any recipe need to be changed ?

Thanks.


On Jun 2, 2018, at 00:46, openbmc-request@lists.ozlabs.org wrote:

A subset of Ipmi 2.0 is provided by the Ipmi daemons here:
https://github.com/openbmc/phosphor-host-ipmid
https://github.com/openbmc/phosphor-net-ipmid

Net IPMI supports the out of band ipmi over network. =A0Host ipmi supports =
in band ipmi over kcs or block transfer.

There are several servers that support Redfish, and we have a working group=
 that meets weekly to talk through technical issues each week, which you're=
 welcome to attend. =A0The only one checked into the upstream project is bm=
cweb. =A0If you need help getting it started, I'm happy to help.
https://github.com/openbmc/bmcweb

Yes, ipmitool works compiles for the target, and includes an extra transpor=
t to be able to connect directly to dbus and do ipmi transactions from ther=
e.

-Ed

From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.or=
g] On Behalf Of AKASH G J
Sent: Friday, June 1, 2018 2:23 AM
To:=A0openbmc@lists.ozlabs.org
Subject: IPMI and Redfish support in openbmc Linux

Hi Team,

I build the Linux image using the steps given in=A0https://github.com/openb=
mc/openbmc, target machine as Zaius. Whether support is available for IPMI =
2.0 and Redfish interface? Is it possible to use ipmitool in the cross comp=
iled Linux?
