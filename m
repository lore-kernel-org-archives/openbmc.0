Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygnSC11L5zDrJm
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 12:04:58 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2017 17:04:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="5145521"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2017 17:04:56 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.129]) by
 ORSMSX105.amr.corp.intel.com ([169.254.2.105]) with mapi id 14.03.0319.002;
 Mon, 20 Nov 2017 17:04:56 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC community telecon - 11/20 Agenda
Thread-Topic: OpenBMC community telecon - 11/20 Agenda
Thread-Index: AQHTYl+RwYJI1X82ukKIB1GUl61+kKMeA7mQ
Date: Tue, 21 Nov 2017 01:04:54 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4A5C8D@ORSMSX114.amr.corp.intel.com>
References: <785099C4-5D19-4341-9F40-3B6A3404EEC8@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F4A58B2@ORSMSX114.amr.corp.intel.com>
 <873758zdai.fsf@linux.vnet.ibm.com>
In-Reply-To: <873758zdai.fsf@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2017 01:04:59 -0000

> A minimal starting point would be to run every code repository through
> Coverity Scan. Setting this up with travs-ci isn't too hard (we do it for=
 parts of
> host firmware today).
>=20
> Efforts to limit the damage could also be good, like strict SELinux polic=
y. After
> all, much of the current design would work quite well for that.

I meant more along the lines of "would the community be ok with this" more =
than "is it technically possible".  I think the tooling story has come a lo=
ng ways in the last few years, especially for open source tools, but I know=
 any attempt to limit what's allowed tends to lead to controversy, so I wan=
ted to see where we all stand.

-Ed
