Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="GR6q6iBR"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xTzY6WfWzF3cd
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 07:17:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1542399434; x=1573935434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9rr5wDASznNv+VIvUkbahSjY7vRiRq+kazY61dM4eQ=;
 b=GR6q6iBROrX1GGXeYMmy2Y5wQzRZlMqevCJa8oqJ1/znI/XcOJoYfGkL
 KaoemB6BQTzLkODPiHY8D6TMUVIarmf1O/k3ii3OTrRmF3KeP9cowQfZv
 u/PHBIgHQ63FuYHXeLvsCCHAvJQBiJSnFQBnmNRnljF6aL317+cusKd+E M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EYAACAJO9bhiWd50NlHQEBBQEHBQG?=
 =?us-ascii?q?BUQgBCwGBVYIWJwqMBl+LH4INlzYUgWYLAQGEbAKDVSI0CQ0BAwEBAgEBAgE?=
 =?us-ascii?q?BAhABAQEKCQsIKS+CNiKCZQEBAQMBEig/BQsCAQg2EFcCBAENBQgagn+Begi?=
 =?us-ascii?q?dPwKBEIlYAQEBgh2KIowFghaBEYMShGeFcgKBKgGHTCAElk8GAQKRHyCBWIU?=
 =?us-ascii?q?HihuXaQIEAgQFAhSBRoIOcIFugU6CNRuOCkABMYsYKYEFgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2EYAACAJO9bhiWd50NlHQEBBQEHBQGBUQgBCwGBVYIWJ?=
 =?us-ascii?q?wqMBl+LH4INlzYUgWYLAQGEbAKDVSI0CQ0BAwEBAgEBAgEBAhABAQEKCQsIK?=
 =?us-ascii?q?S+CNiKCZQEBAQMBEig/BQsCAQg2EFcCBAENBQgagn+BegidPwKBEIlYAQEBg?=
 =?us-ascii?q?h2KIowFghaBEYMShGeFcgKBKgGHTCAElk8GAQKRHyCBWIUHihuXaQIEAgQFA?=
 =?us-ascii?q?hSBRoIOcIFugU6CNRuOCkABMYsYKYEFgR8BAQ?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Nov 2018 14:17:09 -0600
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAGK81o2028023
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 15:17:09 -0500
Received: from esa6.dell-outbound2.iphmx.com (esa6.dell-outbound2.iphmx.com
 [68.232.154.99])
 by mx0b-00154901.pphosted.com with ESMTP id 2nsxphj4h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 15:17:09 -0500
From: <Justin.Lee1@Dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Nov 2018 02:17:08 +0600
X-LoopCount0: from 10.166.135.94
X-IronPort-AV: E=Sophos;i="5.56,241,1539666000"; d="scan'208";a="1162006700"
To: <sam@mendozajonas.com>, <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next v4 0/6] net/ncsi: Allow enabling multiple
 packages & channels
Thread-Topic: [PATCH net-next v4 0/6] net/ncsi: Allow enabling multiple
 packages & channels
Thread-Index: AQHUfWg1dcgy1q1MWUOagrTe9pjUGqVS0K7Q
Date: Fri, 16 Nov 2018 20:17:06 +0000
Message-ID: <f41bcc1c06da4f0ead13cc97fc13d68e@AUSX13MPS302.AMER.DELL.COM>
References: <20181116045159.4980-1-sam@mendozajonas.com>
In-Reply-To: <20181116045159.4980-1-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=786 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811160179
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
X-List-Received-Date: Fri, 16 Nov 2018 20:17:15 -0000

Hi Samuel,

I have reviewed/tested it. It works well. Thanks for supporting these featu=
res!

Justin


Reviewed-by: Justin Lee <justin.lee1@dell.com>
Tested-by: Justin Lee <justin.lee1@dell.com>


> This series extends the NCSI driver to configure multiple packages and/or=
 channels simultaneously. Since the RFC series this includes a few extra ch=
anges to fix areas in the driver that either made this harder or were roadb=
locks due to deviations from the NCSI specification.
>=20
> Patches 1 & 2 fix two issues where the driver made assumptions about the =
capabilities of the NCSI topology.
> Patches 3 & 4 change some internal semantics slightly to make multi-mode =
easier.
> Patch 5 introduces a cleaner way of reconfiguring the NCSI configuration =
and keeping track of channel states.
> Patch 6 implements the main multi-package/multi-channel configuration, co=
nfigured via the Netlink interface.
>=20
> Readers who have an interesting NCSI setup - especially multi-package wit=
h HWA - please test! I think I've covered all permutations but I don't have=
 infinite hardware to test on.
>=20
> Changes in v2:
> - Updated use of the channel lock in ncsi_reset_dev(), making the channel=
 invisible and leaving the monitor check to ncsi_stop_channel_monitor().
> - Fixed ncsi_channel_is_tx() to consider the state of channels in other p=
ackages.
> Changes in v3:
> - Fixed bisectability bug in patch 1
> - Consider channels on all packages in a few places when multi-package is=
 enabled.
> - Avoid doubling up reset operations, and check the current driver state =
before reset to let any running operations complete.
> - Reorganise the LSC handler slightly to avoid enabling Tx twice.
> Changes in v4:
> - Fix failover in the single-channel case
> - Better handle ncsi_reset_dev() entry during a current config/suspend op=
eration.
>=20
> Samuel Mendoza-Jonas (6):
>   net/ncsi: Don't enable all channels when HWA available
>   net/ncsi: Probe single packages to avoid conflict
>   net/ncsi: Don't deselect package in suspend if active
>   net/ncsi: Don't mark configured channels inactive
>   net/ncsi: Reset channel state in ncsi_start_dev()
>   net/ncsi: Configure multi-package, multi-channel modes with failover
>=20
>  include/uapi/linux/ncsi.h |  15 ++
>  net/ncsi/internal.h       |  19 +-
>  net/ncsi/ncsi-aen.c       |  75 ++++--
>  net/ncsi/ncsi-manage.c    | 522 +++++++++++++++++++++++++++-----------
>  net/ncsi/ncsi-netlink.c   | 233 ++++++++++++++---
>  net/ncsi/ncsi-rsp.c       |   2 +-
>  6 files changed, 660 insertions(+), 206 deletions(-)
>=20
> --
> 2.19.1
