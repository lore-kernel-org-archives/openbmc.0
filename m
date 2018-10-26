Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="CwR6YBa1"; 
 dkim-atps=neutral
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hW8r0MwtzF3Fh
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 04:25:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1540574705; x=1572110705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pQCgxxvPoCdTj/jHAUQ4+7tKcJvJ2a5XKPHcMVbfld8=;
 b=CwR6YBa1C+z5AHz7PfYtSaMIhN9TmajVaS3b1DPpxcOuwLNJuHW0VNk2
 WjPnp2QzzwglIa22PP7U5BJbDkE5OBNkKQBUL3p2WRUbcwe/GXbcvuM0i
 +5e35rJEdJJo7U3IS/sveyX/4F93MWt0pT32gmGv14NRjp2Rhoh1eRumM 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ESAAD+TNNbhyeV50NjHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBgVWCFDKMA1+LOZkqFIFmCwEBhGwCgxkhNA0NAQMBAQIBAQI?=
 =?us-ascii?q?BAQIQAQEBCgsJCCkvgjYigmQCAQMSFRMtEhACAQg2EFcCBAENDRqCf4ICmk0?=
 =?us-ascii?q?CgRCJVwEBAYFoM4oei2iCF4ERgxKEZ4VyAoEqAYdDhW6BQ45gBgECkHcgkEU?=
 =?us-ascii?q?slj8CBAIEBQIUgUOCDnCBboFPgiUOCY4ai2YpgQWBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2ESAAD+TNNbhyeV50NjHAEBAQQBAQcEAQGBUQcBAQsBg?=
 =?us-ascii?q?VWCFDKMA1+LOZkqFIFmCwEBhGwCgxkhNA0NAQMBAQIBAQIBAQIQAQEBCgsJC?=
 =?us-ascii?q?CkvgjYigmQCAQMSFRMtEhACAQg2EFcCBAENDRqCf4ICmk0CgRCJVwEBAYFoM?=
 =?us-ascii?q?4oei2iCF4ERgxKEZ4VyAoEqAYdDhW6BQ45gBgECkHcgkEUslj8CBAIEBQIUg?=
 =?us-ascii?q?UOCDnCBboFPgiUOCY4ai2YpgQWBHwEB?=
Received: from mx0a-00154901.pphosted.com ([67.231.149.39])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Oct 2018 12:25:02 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9QHr6Vr190005
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 13:54:23 -0400
Received: from esa2.dell-outbound2.iphmx.com (esa2.dell-outbound2.iphmx.com
 [68.232.153.202])
 by mx0a-00154901.pphosted.com with ESMTP id 2nc3w0sbvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 13:54:23 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 26 Oct 2018 23:25:03 +0600
X-LoopCount0: from 10.166.135.92
X-IronPort-AV: E=Sophos;i="5.54,428,1534827600"; d="scan'208";a="1317855931"
To: <sam@mendozajonas.com>, <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next v2 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Topic: [PATCH net-next v2 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Index: AQHUaxq5zixhV1A3m0GL9JnkLZs93aUxueYw
Date: Fri, 26 Oct 2018 17:25:10 +0000
Message-ID: <d6172566ffe94dec83c1026108e24c98@AUSX13MPS306.AMER.DELL.COM>
References: <20181023215201.27315-1-sam@mendozajonas.com>
 <20181023215201.27315-6-sam@mendozajonas.com>
In-Reply-To: <20181023215201.27315-6-sam@mendozajonas.com>
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
 definitions=2018-10-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810260146
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
X-List-Received-Date: Fri, 26 Oct 2018 17:25:17 -0000

Hi Samuel,

I noticed a few issues and commented below.

Thanks,
Justin


>  /* Resources */
> +int ncsi_reset_dev(struct ncsi_dev *nd);
>  void ncsi_start_channel_monitor(struct ncsi_channel *nc);
>  void ncsi_stop_channel_monitor(struct ncsi_channel *nc);
>  struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 014321ad31d3..9bad03e3fa5e 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -550,8 +550,10 @@ static void ncsi_suspend_channel(struct ncsi_dev_pri=
v *ndp)
>  		spin_lock_irqsave(&nc->lock, flags);
>  		nc->state =3D NCSI_CHANNEL_INACTIVE;
>  		spin_unlock_irqrestore(&nc->lock, flags);
> -		ncsi_process_next_channel(ndp);
> -
> +		if (ndp->flags & NCSI_DEV_RESET)
> +			ncsi_reset_dev(nd);
> +		else
> +			ncsi_process_next_channel(ndp);
>  		break;
>  	default:
>  		netdev_warn(nd->dev, "Wrong NCSI state 0x%x in suspend\n",
> @@ -1554,7 +1556,7 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>  		return 0;
>  	}
> =20
> -	return ncsi_choose_active_channel(nd);
> +	return ncsi_reset_dev(nd);

If there is no available channel due to the whitelist, ncsi_start_dev() fun=
ction will return failed
Status and the network interface may fail to bring up too. It is possible f=
or user to disable all=20
channels and leave the interface up for checking the LOM status.

>  }
>  EXPORT_SYMBOL_GPL(ncsi_start_dev);

Also, if I send set_package_mask and set_channel_mask commands back to back=
 in a program,
the state machine doesn't work well. If I use command line and wait for it =
to complete for=20
each step, then it is fine.

npcm7xx-emc f0825000.eth eth2: NCSI: Multi-package enabled on ifindex 2, ma=
sk 0x00000001
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_stop_channel_monitor() - pkg 0 ch=
 0
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_dev_work()
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_suspend_channel() - pkg 0 ch 0 st=
ate 0400
npcm7xx-emc f0825000.eth eth2: NCSI: pkg 0 ch 0 set as preferred channel
npcm7xx-emc f0825000.eth eth2: NCSI: Multi-channel enabled on ifindex 2, ma=
sk 0x00000003
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_stop_channel_monitor() - pkg 0 ch=
 1
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_dev_work()
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_suspend_channel() - pkg 0 ch 1 st=
ate 0400
npcm7xx-emc f0825000.eth eth2: NCSI: Package 1 set to all channels disabled
npcm7xx-emc f0825000.eth eth2: NCSI: Multi-channel enabled on ifindex 2, ma=
sk 0x00000000
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel()
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - pkg 0
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - pass pk=
g whitelist
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - ch 0
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - pass ch=
 whitelist
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - skip
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - ch 1
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - pass ch=
 whitelist
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - skip
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - next pk=
g
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_choose_active_channel() - pkg 1
npcm7xx-emc f0825000.eth eth2: NCSI: No channel found to configure!
npcm7xx-emc f0825000.eth eth2: NCSI interface down
npcm7xx-emc f0825000.eth eth2: NCSI: ncsi_dev_work()
npcm7xx-emc f0825000.eth eth2: Wrong NCSI state 0x100 in workqueue

All masks are set correctly, but you can see the PS column is not right and=
 channel doesn't
configure correctly.

/sys/kernel/debug/ncsi_protocol# cat ncsi_device_status
IFIDX IFNAME NAME   PID CID RX TX MP MC WP WC PC PS LS RU CR NQ HA
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  2   eth2   ncsi0  000 000 1  1  1  1  1  1  1  0  1  1  1  0  1
  2   eth2   ncsi1  000 001 1  0  1  1  1  1  0  0  1  1  1  0  1
  2   eth2   ncsi2  001 000 0  0  1  1  0  0  0  0  1  1  1  0  1
  2   eth2   ncsi3  001 001 0  0  1  1  0  0  0  0  1  1  1  0  1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MP: Multi-mode Package     WP: Whitelist Package
MC: Multi-mode Channel     WC: Whitelist Channel
PC: Primary Channel
PS: Poll Status
LS: Link Status
RU: Running
CR: Carrier OK
NQ: Queue Stopped
HA: Hardware Arbitration

PS column is getting from (int)nc->monitor.enabled.
