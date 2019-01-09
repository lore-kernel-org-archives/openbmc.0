Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZFkG6MJLzDqc4
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 14:59:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2019 19:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,455,1539673200"; d="scan'208";a="310229438"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga005.fm.intel.com with ESMTP; 08 Jan 2019 19:59:15 -0800
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 8 Jan 2019 19:59:15 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.248]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.21]) with mapi id 14.03.0415.000;
 Tue, 8 Jan 2019 19:59:15 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: Re: Need help to create a new repo for MDR
Thread-Topic: Need help to create a new repo for MDR
Thread-Index: AQHUp85t7oY/dDNQsUGWKAMRpgmoIKWmT8Jl
Date: Wed, 9 Jan 2019 03:59:15 +0000
Message-ID: <59E051A9-98BA-4476-98F0-904986B0FBE3@intel.com>
References: <7c7d2165-d53d-6a33-0fec-069fdfbbbeda@linux.intel.com>
In-Reply-To: <7c7d2165-d53d-6a33-0fec-069fdfbbbeda@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2019 03:59:19 -0000

Cheng,

While you wait for the project to create the repo, it would help if you can=
 push the code to Gerrit under another repo so other people can get a bette=
r idea of what you=92re implementing, and start to review it.

After that=92s done, it would also help to add the link to this thread to g=
ive people some more context about what you=92re working on.

-Ed=
