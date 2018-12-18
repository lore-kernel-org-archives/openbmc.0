Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K7Y613wnzDqRL
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 06:35:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 11:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; 
 d="scan'208,217";a="119467064"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 11:35:47 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.59]) by
 ORSMSX105.amr.corp.intel.com ([169.254.2.191]) with mapi id 14.03.0415.000;
 Tue, 18 Dec 2018 11:35:46 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Joseph Reynolds <jrey@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Translating phosphor-webui [GUI accessibility]
Thread-Topic: Translating phosphor-webui [GUI accessibility]
Thread-Index: AQHUlwYUInuBNPjKGka1PyOYiyrjhKWE4qtw
Date: Tue, 18 Dec 2018 19:35:46 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993459829BD@ORSMSX114.amr.corp.intel.com>
References: <f2333c9e1119f06c15c3b1e31ba3e7dd@linux.vnet.ibm.com>
In-Reply-To: <f2333c9e1119f06c15c3b1e31ba3e7dd@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2JiYWU3MjYtNzdmNy00YmRmLThlZWUtMmQ5ZmJmMzlhM2UyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZUZicElZT2s2bnZROVpCd1I5blVhNmJFc1pmYlhVYlBncTl5aXRSVTlwRkllVGI4akxBWnRJdkNiQnRRaVZ4SiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Tue, 18 Dec 2018 19:35:54 -0000

>=20
> Performing the translation was difficult because the English sentences we=
re
> built from phrases with replacement text in the middle of the sentence.  =
For
> example, in the sentence, "The processor temperature of
> 60 degrees is over the limit of 58", can built from HTML like:
>    <p>The processor temperature of</p><script>...get the
> temp...</script><p>degrees is over the limit.</p>.
>=20
This exact problem is already covered by the angular translate module.  The=
y dedicate a whole page to it in their documentation:
https://angular-translate.github.io/docs/#/guide/06_variable-replacement

>=20
> We discussed using the AngularJS translation framework.
>=20
> There were some problems with the way the translated text appeared in the
> web browser window.  Some of the translated text was much longer than
> the English versions; and some of these were clipped instead of flowed.
> These problems are being addressed by fixing the HTML and CSS code.
>=20
Sounds good to me.  I'm interested in how some of the internals will work, =
but so long as we're following anular-translate best practices, I don't thi=
nk we'll have a problem.
