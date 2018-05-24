Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sKYf1qCMzF1Rm
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 05:43:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2018 12:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,437,1520924400"; d="scan'208";a="231567700"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga006.fm.intel.com with ESMTP; 24 May 2018 12:43:13 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 24 May 2018 12:43:12 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.24]) by
 ORSMSX113.amr.corp.intel.com ([169.254.9.232]) with mapi id 14.03.0319.002;
 Thu, 24 May 2018 12:43:12 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Request for review: Redfish OEM extensions
Thread-Topic: Request for review: Redfish OEM extensions
Thread-Index: AdPzltrM33ibQy9QQmKXV4lisgoMpA==
Date: Thu, 24 May 2018 19:43:11 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169933A0BC863@ORSMSX114.amr.corp.intel.com>
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
X-List-Received-Date: Thu, 24 May 2018 19:43:19 -0000

The document we discussed last week in the Redfish call is open for review =
and comment.  It attempts to propose a solution to the "How do I extend red=
fish in OpenBMC?"  Pawel would very much appreciate comments a broader audi=
ence.

https://git-amr-2.devtools.intel.com/gerrit/#/c/130414/

Along with looking at the review, if anyone has input on any of the followi=
ng, we'd=20
love to hear about it.
1. Requirements for redfish OEM extensions in OpenBmc
2. Specific use cases that aren't covered by OpenBMC today (for example, up=
loading an ssl certificate)
3. Performance concerns and extension concerns
4. Requests for schema support not already in review

Thanks,

-Ed
