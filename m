Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zc8d05D7zDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 02:02:08 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2018 09:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,295,1531810800"; d="scan'208";a="257613105"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2018 09:02:06 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 27 Aug 2018 09:02:06 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX156.amr.corp.intel.com ([169.254.8.73]) with mapi id 14.03.0319.002;
 Mon, 27 Aug 2018 09:02:05 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: xiuzhi <1450335857@qq.com>, Eddie James <eajames@linux.vnet.ibm.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: RE: Re:RE: KVM Support?
Thread-Topic: Re:RE: KVM Support?
Thread-Index: AQHUO7lUeASCSKYkH0Gc28tAnBmHq6TPOweAgAScqAD//+8LwA==
Date: Mon, 27 Aug 2018 16:02:05 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835D37@ORSMSX114.amr.corp.intel.com>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
 <tencent_4567EF110E44C8B12656F95C@qq.com>
In-Reply-To: <tencent_4567EF110E44C8B12656F95C@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTE4MDA5NzYtMDA1Zi00ZmJiLTk2MzEtYzYxNWUwMWI3OWEzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY0tXeWJFN1RvaW0wR2pUN2xDV2FjanpRdkFsM1wvVEowYmJSQ1dcLzNEbU9UR0dVZ0w5R2RcLzVkUTRMd2hzMVlTcCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 27 Aug 2018 16:02:09 -0000

https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/6/app=
/kvm/index.js

Line 15 is out of date and needs to be deleted.  I will try to get the patc=
hset updated today.

-Ed
