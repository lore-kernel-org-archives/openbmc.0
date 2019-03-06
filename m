Return-Path: <sharad.khetan@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F7mS6wzqzDqBb
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 09:31:57 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2019 14:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,449,1544515200"; d="scan'208";a="280374788"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2019 14:31:52 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 6 Mar 2019 14:31:52 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.168]) by
 FMSMSX155.amr.corp.intel.com ([169.254.5.88]) with mapi id 14.03.0415.000;
 Wed, 6 Mar 2019 14:31:52 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "1450335857@qq.com"
 <1450335857@qq.com>, "jae.hyun.yoo@linux.intel.com"
 <jae.hyun.yoo@linux.intel.com>, "venture@google.com" <venture@google.com>
Subject: Re: License change for obmc-ikvm
Thread-Topic: License change for obmc-ikvm
Thread-Index: AQHU1GQAl54EpakFuU6Hy2R+Lb6A5aX/MAJ1
Date: Wed, 6 Mar 2019 22:31:52 +0000
Message-ID: <C02E8263-2029-499C-8485-98EB19EC6438@intel.com>
References: <42f16713-0719-4871-59a8-aa912a3b79ee@linux.vnet.ibm.com>
In-Reply-To: <42f16713-0719-4871-59a8-aa912a3b79ee@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Wed, 06 Mar 2019 22:32:10 -0000

Hi Eddie,
Is there a reason for changing the license to GPL2? Is it because of a need=
 to add a GPL2 component or is there a different reason?
Thanks,
-Sharad

> On Mar 6, 2019, at 10:31 PM, Eddie James <eajames@linux.vnet.ibm.com> wro=
te:
>=20
> Hi,
>=20
> We're planning to change the license for obmc-ikvm from Apache 2 to GPL 2=
. The change is up on gerrit for review here: https://gerrit.openbmc-projec=
t.xyz/#/c/openbmc/obmc-ikvm/+/18974/
>=20
> I've added all contributors to review, but anyone else feel free to revie=
w there or reply to this thread.
>=20
> Thanks!
>=20
> Eddie
>=20
