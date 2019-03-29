Return-Path: <sharad.khetan@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VqT21D6VzDqPX
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 16:06:12 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 22:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="144836545"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2019 22:06:09 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Mar 2019 22:06:09 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.222]) by
 fmsmsx116.amr.corp.intel.com ([169.254.2.7]) with mapi id 14.03.0415.000;
 Thu, 28 Mar 2019 22:06:09 -0700
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: susan jasinski <susantjasinski@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC GUI navigation -- User vs Security
Thread-Topic: OpenBMC GUI navigation -- User vs Security
Thread-Index: AQHU5dexRJQWaNOAaEumRpZZd5KYGaYiDo1a
Date: Fri, 29 Mar 2019 05:06:08 +0000
Message-ID: <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
In-Reply-To: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Mar 2019 05:06:15 -0000

Hi Susan,=20
Typically in server management the notion of security is different than use=
r management. Perhaps =93Authentication=94 or =93Access Control=94 or =93Ac=
cess Management=94 can be a category for the items you list.=20
Thanks,
-Sharad=20

> On Mar 28, 2019, at 7:32 PM, susan jasinski <susantjasinski@gmail.com> wr=
ote:
>=20
> Currently, the OpenBMC GUI has a single sign-on and there is a menu
> called Users from which that panel is accessed.
>=20
> Users
> - Manage User Account
>=20
> Now that we are developing LDAP user management and local user
> management, I was thinking we could put them together under a menu
> called "Security" that would replace the "Users" menu.
>=20
> Security
> - LDAP User Management
> - Local User Management
> - SSL Certificate Management (including certificate generation)
> - others?
>=20
> Does anyone have an option about this?
>=20
> Thanks in advance, Susan Jasinski
