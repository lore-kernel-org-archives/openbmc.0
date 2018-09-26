Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Vq9luzDo"; 
 dkim-atps=neutral
X-Greylist: delayed 740 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Sep 2018 06:52:08 AEST
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L99N6VPbzF3Lk;
 Thu, 27 Sep 2018 06:52:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1537995127; x=1569531127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RaZt0dHiZLwbt6sPn8+S18UiKiPoNGUb+kYiGO7i0HU=;
 b=Vq9luzDo8NLoCPzS8hQ7YmqZrg02oORdSoxYoEsgHl/3evdF+GUysYNa
 B4OdEtoQy1M9XX1Eg1Zc6AS2f+XFGztK2RXsL5PHXcpkJ2Q4HYbYNlESf
 YLE87et4UHepU+T+kCkZL/ec6L7IRPs7mb9x+KxwzOnMUmfpRfiMAZQHc w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EZAAAa7qtbhyWd50NaHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUYNyMot/X4tSgg2WT4F6C4RsAoN+ITQYAQMBAQIBAQIBAQIQAQEBCgs?=
 =?us-ascii?q?JCCkvgjUigmIBAQEBAgESFRM/EAIBCDYQVwIEAQ0NGoJ/gXoImV2JVwEBAYF?=
 =?us-ascii?q?oM4oYinuCF4ESgmQuilYCgSgBm14GAQKQJR+PNJRqAgQCBAUCFIFCgg5wgW6?=
 =?us-ascii?q?BT4IyjiGNGIEeAQE?=
X-IPAS-Result: =?us-ascii?q?A2EZAAAa7qtbhyWd50NaHAEBAQQBAQcEAQGBUYNyMot/X?=
 =?us-ascii?q?4tSgg2WT4F6C4RsAoN+ITQYAQMBAQIBAQIBAQIQAQEBCgsJCCkvgjUigmIBA?=
 =?us-ascii?q?QEBAgESFRM/EAIBCDYQVwIEAQ0NGoJ/gXoImV2JVwEBAYFoM4oYinuCF4ESg?=
 =?us-ascii?q?mQuilYCgSgBm14GAQKQJR+PNJRqAgQCBAUCFIFCgg5wgW6BT4IyjiGNGIEeA?=
 =?us-ascii?q?QE?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Sep 2018 15:39:29 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8QKcM8J046540; Wed, 26 Sep 2018 16:39:41 -0400
Received: from esa6.dell-outbound2.iphmx.com (esa6.dell-outbound2.iphmx.com
 [68.232.154.99])
 by mx0b-00154901.pphosted.com with ESMTP id 2mrfn50jav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Sep 2018 16:39:41 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Sep 2018 02:39:40 +0600
X-LoopCount0: from 10.166.135.91
X-IronPort-AV: E=Sophos;i="5.54,307,1534827600"; d="scan'208";a="236145508"
To: <amithash@fb.com>, <vijaykhemka@fb.com>, <sam@mendozajonas.com>,
 <joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <sdasari@fb.com>, <netdev@vger.kernel.org>
Subject: RE: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Topic: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Index: AQHUVGQiHiJXHZ5Q3Euxbr6KTObLUqUAeN2AgAEqCQCAAKxhAIAA0qKAgAAQ0QD//8rz4A==
Date: Wed, 26 Sep 2018 20:39:38 +0000
Message-ID: <5e9c8e3f8fd54845b15cd460efe9090d@AUSX13MPS306.AMER.DELL.COM>
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <CACPK8XcDExGvCNBcFqOOP+1zQFFs6pMao+7rsZrJFqxPgcY+1Q@mail.gmail.com>
 <F570466E-4F6C-4AE1-91E0-0B4ECC193BE0@fb.com>
 <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>,
 <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
 <MWHPR15MB14861AED8F8AF652CE5E62B3B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
In-Reply-To: <MWHPR15MB14861AED8F8AF652CE5E62B3B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=948 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809260193
X-Mailman-Approved-At: Sat, 29 Sep 2018 18:28:19 +1000
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
X-List-Received-Date: Wed, 26 Sep 2018 20:52:11 -0000

> >  As I understand Justin's version adds a generic handler, using the NCS=
I
> >  Netlink interface to pass OEM commands and responses to and from
> >  userspace, which does the actual packet handling.
> Thanks for the direction Sam! Justin, if you don't mind, can you share th=
e patches you have to add the support? This actually would solve a few othe=
r things we are trying to accomplish.


Basically, I add a new flag to indicate the request is coming from the Netl=
ink interface to allow the command handler and response handler to react.
#define NCSI_REQ_FLAG_NETLINK_DRIVEN	2

The work flow is as below.=20

Request:
User space application -> Netlink interface (msg) -> new Netlink handler - =
ncsi_send_cmd_nl() - ncsi_xmit_cmd()

Response:
Response received - ncsi_rcv_rsp() -> internal response handler - ncsi_rsp_=
handler_xxx() -> ncsi_send_netlink_rsp () -> Netlink interface (msg) -> use=
r space application
Command timeout - ncsi_request_timeout() -> ncsi_send_netlink_timeout () ->=
 Netlink interface (msg with zero data length) -> user space application

Error:
Detected error -> ncsi_send_netlink_err () -> Netlink interface (err msg) -=
> user space application

I will clean up some code and send out the patch.=20

Thanks,
Justin
