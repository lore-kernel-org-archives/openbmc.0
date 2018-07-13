Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="s9YcwT8V"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41S2P32hDQzF35V
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jul 2018 05:07:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1531508839; x=1563044839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XO2p/YuHpEWlbN4P8hjfN/kI0DR8uE2w7yCCCqYiEHI=;
 b=s9YcwT8VBsB1ROYnx2VFURI4tgiHXwYCzxWaPLIcURMGNfe2lbJj/3ou
 ps0DFQXlAS0jYlpAO5CUJ1YTOGjd5wQmI6alfJ4bI2YH/Up6oBsLRyf4D
 oejtl7hD68J+bpUcWhnOZIziky6NUuZ1SvJMF4fFOOReqmvsIyhlaAC4J 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G7AgAi+Ehbh2Oa6ERcHAEBAQQBAQoBA?=
 =?us-ascii?q?YQdgQ4ymC2CDIFylUELhGwCglAhOBQBAgEBAgEBAgEBAhABAQEKCwkIKS+CNSK?=
 =?us-ascii?q?CYQEBAQECATo0CxACAQg2EFcCBA4NgxiBbwkIqk6HaIJWiQKCFoQihUiFCQKHT?=
 =?us-ascii?q?JIQBwKPH4E9AYwvkhSBWIF0cFCCaoIyGo4GjBmBGgEB?=
X-IPAS-Result: =?us-ascii?q?A2G7AgAi+Ehbh2Oa6ERcHAEBAQQBAQoBAYQdgQ4ymC2CDIF?=
 =?us-ascii?q?ylUELhGwCglAhOBQBAgEBAgEBAgEBAhABAQEKCwkIKS+CNSKCYQEBAQECATo0C?=
 =?us-ascii?q?xACAQg2EFcCBA4NgxiBbwkIqk6HaIJWiQKCFoQihUiFCQKHTJIQBwKPH4E9AYw?=
 =?us-ascii?q?vkhSBWIF0cFCCaoIyGo4GjBmBGgEB?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jul 2018 14:07:07 -0500
From: <Eugene.Cho@dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2018 01:06:55 +0600
X-LoopCount0: from 10.166.132.133
X-IronPort-AV: E=Sophos;i="5.51,348,1526360400"; d="scan'208";a="272508880"
To: <gregkh@linuxfoundation.org>
CC: <a.amelkin@yadro.com>, <andrew@aj.id.au>, <benh@kernel.crashing.org>,
 <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <joel@jms.id.au>, <stewart@linux.ibm.com>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>
Subject: RE: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Thread-Topic: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Thread-Index: AQHUGrwsvtYF8DKemEGBB9m7D+FlaqSNfgPwgABYqgD//6zNEA==
Date: Fri, 13 Jul 2018 19:06:53 +0000
Message-ID: <8dfaea969aeb4b0fbd049b4e48389b43@AUSX13MPC105.AMER.DELL.COM>
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <a521b9fc-4c10-06c1-fd73-5c64379538f6@yadro.com>
 <bc2d6bd30ce243768d07b2aa5ed9cee4@AUSX13MPC105.AMER.DELL.COM>
 <20180713190320.GB30539@kroah.com>
In-Reply-To: <20180713190320.GB30539@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiI1N2VkYjQwOC0wNzM4LTQ3ZGMtYjNlOS1jOWI5ZTNkMzQwNWEiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkZrNStUaWhsUHhsTnBOVUUxeVlRMW1waE1rSWJFQitHMUJFa3pqc0lrbTQ9In0=
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
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
X-List-Received-Date: Fri, 13 Jul 2018 19:07:20 -0000

>> Dell - Internal Use - Confidential =20
>Really?  To a public mailing list?  odd...

Ha yea sorry - I was so excited to show my support, that I jumped the gun :=
)
