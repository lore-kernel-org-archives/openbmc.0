Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kqKz0nj0zDqC8
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 06:40:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="251798744"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2018 13:31:48 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 6 Aug 2018 13:31:43 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.242]) by
 ORSMSX154.amr.corp.intel.com ([169.254.11.155]) with mapi id 14.03.0319.002;
 Mon, 6 Aug 2018 13:31:43 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: James Feist <james.feist@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Proposal to change sensor interface to use double values
Thread-Topic: Proposal to change sensor interface to use double values
Thread-Index: AQHULbnhRuounfEWkk62wNoxumfBhqSzLWsw
Date: Mon, 6 Aug 2018 20:31:42 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934581FE54@ORSMSX114.amr.corp.intel.com>
References: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
In-Reply-To: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-List-Received-Date: Mon, 06 Aug 2018 20:40:56 -0000

KzENCg0KVGhlIGV4aXN0aW5nIGludGVyZmFjZXMgYXJlIGVycm9yIHByb25lIHRvIGltcGxlbWVu
dCB0by4gIFRoaXMgY2hhbmdlIG1ha2VzIHRoZW0gZWFzaWVyIHRvIHVzZSwgYW5kIGNsZWFyZXIu
DQoNCi1FZA0K
