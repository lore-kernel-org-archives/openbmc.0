Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n4CS5lC0zF1d1
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 07:27:48 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 May 2018 14:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,412,1520924400"; d="scan'208";a="42150937"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2018 14:27:46 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 17 May 2018 14:27:45 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.24]) by
 ORSMSX155.amr.corp.intel.com ([169.254.7.157]) with mapi id 14.03.0319.002;
 Thu, 17 May 2018 14:27:45 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Yugi Mani <yupalani@microsoft.com>, "Michael.E.Brown@dell.com"
 <Michael.E.Brown@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>, "Balaji.B.Rao@dell.com"
 <Balaji.B.Rao@dell.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong
 <Chris.Ong@microsoft.com>, Ali Larijani <alirhas@microsoft.com>
Subject: RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Topic: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPsYkRv1Xl4DXIGTxCVOcJsabY0fQBvTmKAAAGWxVA=
Date: Thu, 17 May 2018 21:27:44 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933A0B9D36@ORSMSX114.amr.corp.intel.com>
References: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
 <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Thu, 17 May 2018 21:27:49 -0000

Apologies for the HTML email.  I got trigger happy and sent it from the wro=
ng client.  Plaintext version of content is below:

It looks like it got published on Monday in the 2018.1 Schema drop.  You're=
 looking for the Assembly schema "Assembly_v1.xml" posted here:

https://www.dmtf.org/sites/default/files/standards/documents/DSP8010_2018.1=
.zip

-Ed
